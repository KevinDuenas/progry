//
//  ProgryParserWrapper.swift
//  progry
//
//  Created by Kevin Duenas on 21/04/22.
//


import Antlr4
import UIKit

/// Wrapper (adapter) around Antlr4 library.
struct ProgryParserWrapper : ParserType {
    
    
    
    
    /// Convers AST nodes to instructions.
    private final class Listener : ProgryBaseListener {
        
        private(set) var instructions: [Instruction] = []
        private(set) var modules = HashTable<Module>(bucketSize: 15)
        private(set) var matchTable = TypeMatch()
        private(set) var quadruples = Quadruples()
        private(set) var globalMemory = Memory(start: 1000, end: 4000, type: .GLOBAL)
        private(set) var temporalMemory = Memory(start: 4000, end: 8000, type: .TEMPORAL)
        private(set) var moduleMemory : Memory?
        private(set) var constanteMemory = Memory(start: 10000, end: 14000, type: .CONSTANTS)
        private(set) var operands : [MemoryDirection] = []
        private(set) var operators : [String] = []
        
        var i: Int = 0 // OPONER NOMBNRE DE DONDE ES
        
        // para contar las variables de cada modulo, se suma en vars - se agrega en exit module y se reinicia a 0
        var localCount: Int = 0;
        var tempCount: Int = 0;
        
        private(set) var currentModule = ""
        private(set) var currentCicle = ""
        
        let typeOracle = TypeMatch.init()
        
        
        //Context variables
        var jumpsStack = [Int]()
        
        
        
        override func enterProgram(_ ctx: ProgryParser.ProgramContext){
            
            jumpsStack.append(quadruples.list.count) //migajita de pan
            let goToMain = Quadruple(op: "GOTO", opLeft: nil, opRight: nil, result: MemoryDirection())
            quadruples.list.append(goToMain)
            
            let globalModule = Module(name: "global", returnType: .VOID, key: "global", forQuadruple: 0)
            modules.addElement(globalModule, forKey: "global")
            currentModule = "global";
        }
        
        override func enterMain(_ ctx: ProgryParser.MainContext) {
            
            
            let quadrupleIndex = jumpsStack.popLast()
            let quadrupleNo = quadruples.list.count
            quadruples.list[quadrupleIndex!].result?.quadruple = quadrupleNo
            
            //Ingresamos el modulo main
            //let mainModule = Module(name: "main", returnType: .VOID, key: "main", forQuadruple: quadruples.list.count)
            // modules.addElement(mainModule, forKey: "main")
            currentModule = "global"
            
        }
        
        override func enterModule(_ ctx: ProgryParser.ModuleContext) {
            moduleMemory = Memory(start: 8000, end: 10000, type: .FUNCTION)
            var memoryDir = 0
            
            let totalIds = ctx.ID().count
            
            // Necesitamos guardar en la tabla de funciones que
            // esta en el cuadruplo
            
            guard let id = ctx.ID(0)?.getText() else {
                return //regresar errror
            }
            
            let moduleVoid = ctx.VOID()?.getText()
            
            // String
            currentModule = id
            
            let result = modules.addElement(Module.init(name: id, returnType: .VOID, key: id, forQuadruple: quadruples.list.count), forKey: id)
            
            if (result == .collision){
                return
            }
            
            let mod = modules.getElement(forKey: currentModule)!
            
            if moduleVoid == "void" {
                
                if totalIds > 1 { // Tengo uno o mÃ¡s parametros
                    
                    let paramNumbers = ctx.ID().count - 1
                    
                    mod.parametersNumber = paramNumbers
                    
                    for p in 1...paramNumbers {
                        guard let paramType = ctx.type(p - 1)?.getText() else {
                            return
                        }
                        
                        guard let varId = ctx.ID(p)?.getText() else {
                            return
                        }
                        
                        switch paramType {
                        case "number":
                            memoryDir = moduleMemory!.newNumberDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Number, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Number)
                            mod.numbers = mod.numbers + 1
                        case "decimal":
                            memoryDir = moduleMemory!.newDecimalDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Decimal, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Decimal)
                            mod.decimals = mod.decimals + 1
                        case "flag":
                            memoryDir = moduleMemory!.newFlagDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Flag, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Flag)
                            mod.flags = mod.flags + 1
                        case "text":
                            memoryDir = moduleMemory!.newTextDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Text, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Text)
                            mod.texts = mod.texts + 1
                        case "error": break
                        case "void": break
                        default:
                            break
                        }
                    } // cierra for
                }else{
                    mod.parametersNumber = 0
                }
                
                
            } else {
                // tipado
                guard let moduleType = ctx.type(0)?.getText() else {
                    return
                }
                
                let modGlobal = modules.getElement(forKey: "global")
                
                switch moduleType {
                case "number":
                    memoryDir = globalMemory.newNumberDirection()
                    modGlobal?.varsTable.addElement(Variable(id: currentModule, type: .Number, direction: memoryDir), forKey: currentModule)
                case "decimal":
                    memoryDir = globalMemory.newDecimalDirection()
                    modGlobal?.varsTable.addElement(Variable(id: currentModule, type: .Decimal, direction: memoryDir), forKey: currentModule)
                case "text":
                    memoryDir = globalMemory.newTextDirection()
                    modGlobal?.varsTable.addElement(Variable(id: currentModule, type: .Text, direction: memoryDir), forKey: currentModule)
                case "flag":
                    memoryDir = globalMemory.newFlagDirection()
                    modGlobal?.varsTable.addElement(Variable(id: currentModule, type: .Flag, direction: memoryDir), forKey: currentModule)
                default:
                    print("no type found it")
                }
                
                
                var modType : Types?
                
                switch moduleType {
                case "number":
                    modType = .Number
                case "decimal":
                    modType = .Decimal
                case "flag":
                    modType = .Flag
                case "text":
                    modType = .Text
                case "error": break
                case "void": break
                default:
                    break
                }
                
                mod.returnType = modType!
                
                if totalIds > 1 {
                    
                    let paramNumbers = ctx.ID().count - 1
                    
                    mod.parametersNumber = paramNumbers
                    
                    print("param numbers", paramNumbers)
                    for p in 1...paramNumbers {
                        
                        guard let paramType = ctx.type(p)?.getText() else {
                            return
                        }
                        guard let varId = ctx.ID(p)?.getText() else {
                            return
                        }
                        
                        switch paramType {
                        case "number":
                            memoryDir = moduleMemory!.newNumberDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Number, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Number)
                            mod.numbers = mod.numbers + 1
                        case "decimal":
                            memoryDir = moduleMemory!.newDecimalDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Decimal, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Decimal)
                            mod.decimals = mod.decimals + 1
                        case "flag":
                            memoryDir = moduleMemory!.newFlagDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Flag, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Flag)
                            mod.flags = mod.flags + 1
                        case "text":
                            memoryDir = moduleMemory!.newTextDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Text, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Text)
                            mod.texts = mod.texts + 1
                        case "error": break
                        case "void": break
                        default:
                            break
                        }
                    }
                    
                } else {
                    guard let moduleType = ctx.type(0)?.getText() else {
                        return
                    }
                    
                    var modType : Types?
                    
                    switch moduleType {
                    case "number":
                        modType = .Number
                    case "decimal":
                        modType = .Decimal
                    case "flag":
                        modType = .Flag
                    case "text":
                        modType = .Text
                    case "error": break
                    case "void": break
                    default:
                        break
                    }
                    
                    mod.returnType = modType!
                    mod.parametersNumber = 0
                }
            }
        }
        
        override func exitRead(_ ctx: ProgryParser.ReadContext) {
            //            if let newOperator = ctx.READ()?.getText() {
            //                let leftOperand = ctx.ID()?.getText()
            //
            //                let newQuadruple = Quadruple(op: newOperator, opLeft: MemoryDirection(data: leftOperand), opRight: nil, result: MemoryDirection())
            //
            //                quadruples.list.append(newQuadruple)
            //            }
            
            let lastOperand = operands.popLast()
            
            let readQuadruple = Quadruple(op: "READ", opLeft: nil, opRight: nil, result: lastOperand)
            
            quadruples.list.append(readQuadruple)
            
            
        }
        
        override func exitModule(_ ctx: ProgryParser.ModuleContext) {
            
            let modType = ctx.VOID()?.getText()
            let mod = modules.getElement(forKey: currentModule)!
            let id = ctx.ID(0)?.getText()
            let global = modules.getElement(forKey: "global")
            let modvar = global!.varsTable.getElement(forKey: id!)
            
            if modType != "void" {
                let newQuadruple = Quadruple(op: "RETURN", opLeft: operands.popLast(), opRight: nil, result: MemoryDirection(address: modvar?.memoryDirection))
                quadruples.list.append(newQuadruple)
            }
            
            mod.localVarNumber = localCount
            mod.temporalVars = tempCount
            
            let newQuadruple = Quadruple(op: "ENDFUNC", opLeft: nil, opRight: nil, result: nil)
            quadruples.list.append(newQuadruple)
            
            currentModule = ""
            localCount = 0;
            tempCount = 0;
            
            //mod.print()
        }
        
        override func enterModule_call(_ ctx: ProgryParser.Module_callContext) {
            
            
            guard let id = ctx.ID()?.getText() else{
                return //regresar errror
            }
            guard let mod = modules.getElement(forKey: id) else {
                //print("No existe el modulo en el directorio")
                return
            }
            
            // pasarle numero de cada cosa
            var modSizes : String;
            modSizes = "\(mod.numbers)-\(mod.decimals)-\(mod.flags)-\(mod.texts)"
            let newQuadruple = Quadruple(op: "ERA", opLeft: nil, opRight: nil, result: MemoryDirection(data: modSizes))
            quadruples.list.append(newQuadruple)
            
            
        }
        
        override func exitModule_call(_ ctx: ProgryParser.Module_callContext) {
                    // Aquí no reviso ID => eso es en enterModule
                    
                    let globalModule = modules.getElement(forKey: "global")
                    let globalModuleResult = globalModule?.varsTable.getElement(forKey: (ctx.ID()?.getText())!)
                    
                    
                    let mod = modules.getElement(forKey: (ctx.ID()?.getText())!)
                    var newStack : [MemoryDirection] = []
                    var pStack : [MemoryDirection] = []
                    let virtMemFake = Memory(start: 8000, end: 1000, type: .FUNCTION)
                    
                    let operandsStackSize = operands.count
                    
                    if mod?.parametersNumber != 0 {
                        if operandsStackSize == mod?.parametersNumber {
                            //print("Parametros numero coinciden")
                            
                            print("mod ->", mod?.parametersNumber)
                            
                            
                            for i in 0...mod!.parametersNumber - 1 {
                               
                                if operands[i].type != mod?.paramaters![i] {
                                    //print("ERROR, parametro #\(i) de \(operands[i].type) no coincide con \(mod?.paramaters![i])")
                                    return
                                }
                                switch mod?.paramaters![i] {
                                case .Number:
                                    pStack.append(MemoryDirection(address: virtMemFake.newNumberDirection()))
                                case .Decimal:
                                    pStack.append(MemoryDirection(address: virtMemFake.newDecimalDirection()))
                                case .Text:
                                    pStack.append(MemoryDirection(address: virtMemFake.newTextDirection()))
                                case .Flag:
                                    pStack.append(MemoryDirection(address: virtMemFake.newFlagDirection()))
                                    
                                case .none: break
                                    
                                case .some(.ERROR): break
                                    
                                case .some(.VOID): break
                                    
                                }
                            }
                            
                            
                            // LLenamos el nuevo stack de temporales al reves
                            // vaciamos el stack de expresion => operands_
                            for _ in 0...mod!.parametersNumber - 1 {
                                newStack.append(operands.popLast()!)
                                
                            }
                            
                            for i in 0...operandsStackSize - 1 {
                                let opLeft = newStack.popLast()
                                let newQuadruple = Quadruple(op: "PARAM", opLeft: opLeft, opRight: nil, result: pStack[i])
                                quadruples.list.append(newQuadruple)
                            }
                            let indexMod = mod?.quadrupleIndex
                            
                            let newQuadruple = Quadruple(op: "GOSUB", opLeft: nil, opRight: nil, result: MemoryDirection(quadruple: indexMod ))
                            quadruples.list.append(newQuadruple)
                            
                        } else {
                            print("ERROR, Número de parámtetros no coincide...")
                        }
                        
                    } else {
                        let indexMod = mod?.quadrupleIndex
                        
                        let newQuadruple = Quadruple(op: "GOSUB", opLeft: nil, opRight: nil, result: MemoryDirection(quadruple: indexMod ))
                        quadruples.list.append(newQuadruple)
                    }
                    
                    switch mod?.returnType {
                    case .Number:

                        let parcheMem = temporalMemory.newNumberDirection()
                        let newQuadruple = Quadruple(op: "=", opLeft: MemoryDirection(type: .Number, address: globalModuleResult?.memoryDirection), opRight: nil, result: MemoryDirection(type: .Number, address: parcheMem))
                        quadruples.list.append(newQuadruple)
                        operands.append(MemoryDirection(type: .Number, address: parcheMem))
                    case .Decimal:
                        let parcheMem = temporalMemory.newDecimalDirection()
                        let newQuadruple = Quadruple(op: "=", opLeft: MemoryDirection(type: .Decimal, address: globalModuleResult?.memoryDirection), opRight: nil, result: MemoryDirection(type: .Decimal, address: parcheMem))
                        quadruples.list.append(newQuadruple)
                        operands.append(MemoryDirection(type: .Decimal, address: parcheMem))
                    case .Flag:
                        let parcheMem = temporalMemory.newFlagDirection()
                        let newQuadruple = Quadruple(op: "=", opLeft: MemoryDirection(type: .Flag, address: globalModuleResult?.memoryDirection), opRight: nil, result: MemoryDirection(type: .Flag, address: parcheMem))
                        quadruples.list.append(newQuadruple)
                        operands.append(MemoryDirection(type: .Flag, address: parcheMem))
                    case .Text:
                        let parcheMem = temporalMemory.newTextDirection()
                        let newQuadruple = Quadruple(op: "=", opLeft: MemoryDirection(type: .Text, address: globalModuleResult?.memoryDirection), opRight: nil, result: MemoryDirection(type: .Text, address: parcheMem))
                        quadruples.list.append(newQuadruple)
                        operands.append(MemoryDirection(type: .Text, address: parcheMem))
                    case .none:
                        break
                    case .some(_):
                        break
                    }
                    
                    
                   
                }
        override func enterIfs(_ ctx: ProgryParser.IfsContext) {
            
            currentCicle = "IF";
            
        }
        
        
        
        
        override func exitIfs(_ ctx: ProgryParser.IfsContext) {
            currentCicle = ""
            
            let goToFIndex = jumpsStack.popLast()
            //quadruples.list[goToFIndex!].result?.quadruple = quadruples.list.count
            
            let goToFalseNewIndex = quadruples.list.count
            quadruples.list[goToFIndex!].result?.quadruple = goToFalseNewIndex
        }
        
        override func enterDos(_ ctx: ProgryParser.DosContext) {
            
            let lastOp = operands.popLast()
            
            //jumpsStack.append(quadruples.list.count ) //Migajita de pan
            //let goToF = Quadruple(op:"GOTOF", opLeft: lastOp, opRight: nil, result: MemoryDirection())
            //quadruples.list.append(goToF)
            
            switch currentCicle {
                
            case "IF":
                print("if")
                jumpsStack.append(quadruples.list.count)
                let goToF =  Quadruple(op:"GOTOF", opLeft: lastOp, opRight: nil, result: MemoryDirection())
                quadruples.list.append(goToF)
            case "WHILE":
                jumpsStack.append(quadruples.list.count ) //Migajita de pan
                let goToF = Quadruple(op:"GOTOF", opLeft: lastOp, opRight: nil, result: MemoryDirection())
                quadruples.list.append(goToF)
            case "FOR":
                print("FOR DO")
                
                
            default:
                break;
            }
            
        }
        
        
        
        override func enterFors(_ ctx: ProgryParser.ForsContext) {
            currentCicle = "FOR";
            let curr = modules.getElement(forKey: currentModule)
            let globalModule = modules.getElement(forKey: "global")
            var firstVar : Variable?
            var limitDir : Variable?
            
            var tempResultDir : Int?
            
            if let varId = ctx.ID(0)?.getText(){
                firstVar = curr?.varsTable.getElement(forKey: varId)
                
                if firstVar == nil {
                    firstVar = globalModule?.varsTable.getElement(forKey: varId)
                }
            }
            
            guard let firstCte = ctx.cte(0)?.DIGIT()?.getText() else {return}
            let cteDir =  constanteMemory.newNumberDirection()
            let _ = constanteMemory.assignNumber(dir: cteDir, value: Int(firstCte)!)
            
            //Creando el cuadruplo de asignación
            let assignQuadruple = Quadruple(op: "=", opLeft: MemoryDirection(type: .Number, address: cteDir), opRight: nil, result: MemoryDirection( type: firstVar?.type, address: firstVar?.memoryDirection))
            quadruples.list.append(assignQuadruple)
            
            if let lim = ctx.cte(1)?.DIGIT()?.getText() {
                // Constante
                let constant = constanteMemory.newNumberDirection()
                constanteMemory.assignData(dir: constant, data: lim)
                
                let opLeft = MemoryDirection(type: firstVar?.type ,address: firstVar?.memoryDirection)
                let opRight = MemoryDirection(type: firstVar?.type ,address: constant)
                tempResultDir = temporalMemory.newFlagDirection()
                let opRes = MemoryDirection(type: .Flag, address: tempResultDir)
                
                quadruples.list.append(Quadruple(op: "<=", opLeft: opLeft, opRight: opRight, result: opRes))
                
                
            }else if let lim = ctx.ID(1)?.getText() {
                
                limitDir = curr?.varsTable.getElement(forKey: lim)
                
                if limitDir == nil {
                    limitDir = globalModule?.varsTable.getElement(forKey: lim)
                }
                let opLeft = MemoryDirection(type: firstVar?.type ,address: firstVar?.memoryDirection)
                let opRight = MemoryDirection(type: limitDir?.type ,address: limitDir?.memoryDirection)
                tempResultDir = temporalMemory.newFlagDirection()
                let opRes = MemoryDirection(type: .Flag, address: tempResultDir)
                quadruples.list.append(Quadruple(op: "<=", opLeft: opLeft, opRight: opRight, result: opRes))
            }
            jumpsStack.append(quadruples.list.count - 1)
            
            //Go To F
            quadruples.list.append(Quadruple(op: "GOTOF", opLeft: MemoryDirection( type: .Flag, address: tempResultDir), opRight: nil, result: MemoryDirection()))
            jumpsStack.append(quadruples.list.count - 1)
        }
        
        
        
        override func exitFors(_ ctx: ProgryParser.ForsContext) {
            
            let curr = modules.getElement(forKey: currentModule)
            let globalModule = modules.getElement(forKey: "global")
            var firstVar : Variable?
            
            if let varId = ctx.ID(0)?.getText(){
                firstVar = curr?.varsTable.getElement(forKey: varId)
                
                if firstVar == nil {
                    firstVar = globalModule?.varsTable.getElement(forKey: varId)
                }
            }
            
            // Constante
            let constantOne = constanteMemory.newNumberDirection()
            constanteMemory.assignData(dir: constantOne, data: "1")
            
            
            //Sumar uno a la variable
            quadruples.list.append(Quadruple(op: "+", opLeft: MemoryDirection( type: .Number, address: firstVar?.memoryDirection), opRight: MemoryDirection(type: .Number, address: constantOne), result: MemoryDirection( type: .Number, address: firstVar?.memoryDirection)))
            
            
            //Pop the migajita
            let goToFIndex = jumpsStack.popLast()
            let goToQuadrupleIndex = jumpsStack.popLast()
            
            
            //Go To
            quadruples.list.append(Quadruple(op: "GOTO", opLeft: nil, opRight: nil, result: MemoryDirection(quadruple: goToQuadrupleIndex)))
            
            //Fill the quadruple of goToF
            let quadrupleCount = quadruples.list.count
            quadruples.list[goToFIndex!].result? =  MemoryDirection(quadruple: quadrupleCount)
            
            currentCicle = "";
        }
        override func exitVars(_ ctx: ProgryParser.VarsContext) {
            
            guard let type = ctx.type()?.getText() else{
                return //regresar errror
            }
            
            guard let id = ctx.ID()?.getText() else {
                return
            }
            
            //Le añadimos uno al tipo de variable en la funcion
            let curr =  modules.getElement(forKey: currentModule)
            let globalModule = modules.getElement(forKey: "global")
            var memoryDir = 0
            var localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .VOID, direction: 0), forKey: id)
            var globalSearch : Variable?
            let _ = modules.deleteElementForKey(currentModule)
            
            if((localInsertion == .collision || globalSearch != nil) && currentModule != "global"){
                //Ya existe el id o localmente o globalmente
                //print("id repetido", id , "en", currentModule)
                return
            }else{
                let _ = curr?.varsTable.deleteElementForKey(id)
            }
            
            
            
            let isArray = ctx.OPEN_SBRACKET()?.getText()
            let isMatrix = ctx.COMMA()?.getText()
            
            if isArray == "[" && isMatrix != "," {
                
                let sizeArray = operands.popLast()
                if (sizeArray?.type != .Number) {
                    print("Tiene que ser entero (number)")
                    return
                }
                let sizeArrayInt = constanteMemory.getNumber(dir: (sizeArray?.address)!)
                
                
                switch type {
                case "number":
                    curr?.numbers += 1
                    if(currentModule == "global"){
                        memoryDir = globalMemory.newNumberDirection()
                        for _ in 1...sizeArrayInt {
                            let _ = globalMemory.newNumberDirection()
                        }
                    }else{
                        memoryDir = moduleMemory!.newNumberDirection()
                        localCount = localCount + 1;
                        for _ in 1...sizeArrayInt {
                            let _ = moduleMemory!.newNumberDirection()
                        }
                    }
                    localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Number, direction: memoryDir), forKey: id)
                    let vectorVar = curr?.varsTable.getElement(forKey: id)
                    
                    let addressSizeArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressSizeArrDir, value: sizeArrayInt)
                    
                    let addressOffArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressOffArrDir, value: sizeArrayInt + 1)
                    
                    vectorVar?.vector = size(inf: 0, sup: addressSizeArrDir, off: addressOffArrDir)
                    globalSearch = globalModule?.varsTable.getElement(forKey: id)
                    
                    
                    let addressMemDirection = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressMemDirection, value: memoryDir)
                    
                    vectorVar?.cteDir = addressMemDirection
                    
                case "decimal":
                    curr?.decimals += 1
                    if(currentModule == "global"){
                        memoryDir = globalMemory.newDecimalDirection()
                        for _ in 1...sizeArrayInt {
                            let _ = globalMemory.newDecimalDirection()
                        }
                    }else{
                        memoryDir = moduleMemory!.newDecimalDirection()
                        localCount = localCount + 1;
                        for _ in 1...sizeArrayInt {
                            let _ = moduleMemory!.newDecimalDirection()
                        }
                    }
                    localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Decimal, direction: memoryDir), forKey: id)
                    let vectorVar = curr?.varsTable.getElement(forKey: id)
                    
                    let addressSizeArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressSizeArrDir, value: sizeArrayInt)
                    
                    let addressOffArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressOffArrDir, value: sizeArrayInt + 1)
                    
                    vectorVar?.vector = size(inf: 0, sup: addressSizeArrDir, off: addressOffArrDir)
                    
                    globalSearch = globalModule?.varsTable.getElement(forKey: id)
                    
                    let addressMemDirection = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressMemDirection, value: memoryDir)
                    
                    vectorVar?.cteDir = addressMemDirection
                    
                case "text":
                    curr?.texts += 1
                    if(currentModule == "global"){
                        memoryDir = globalMemory.newTextDirection()
                        for _ in 1...sizeArrayInt {
                            let _ = globalMemory.newTextDirection()
                        }
                    }else{
                        memoryDir = moduleMemory!.newTextDirection()
                        localCount = localCount + 1;
                        for _ in 1...sizeArrayInt {
                            let _ = moduleMemory!.newTextDirection()
                        }
                    }
                    localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Text, direction: memoryDir), forKey: id)
                    let vectorVar = curr?.varsTable.getElement(forKey: id)
                    let addressSizeArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressSizeArrDir, value: sizeArrayInt)
                    
                    let addressOffArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressOffArrDir, value: sizeArrayInt + 1)
                    
                    vectorVar?.vector = size(inf: 0, sup: addressSizeArrDir, off: addressOffArrDir)
                    globalSearch = globalModule?.varsTable.getElement(forKey: id)
                    
                    let addressMemDirection = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressMemDirection, value: memoryDir)
                    
                    vectorVar?.cteDir = addressMemDirection
                case "flag":
                    curr?.flags += 1
                    if(currentModule == "global"){
                        memoryDir = globalMemory.newFlagDirection()
                        for _ in 1...sizeArrayInt {
                            let _ = globalMemory.newFlagDirection()
                        }
                    }else{
                        memoryDir = moduleMemory!.newFlagDirection()
                        localCount = localCount + 1;
                        for _ in 1...sizeArrayInt {
                            let _ = moduleMemory!.newFlagDirection()
                        }
                    }
                    localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Flag, direction: memoryDir), forKey: id)
                    let vectorVar = curr?.varsTable.getElement(forKey: id)
                    let addressSizeArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressSizeArrDir, value: sizeArrayInt)
                    
                    let addressOffArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressOffArrDir, value: sizeArrayInt + 1)
                    
                    vectorVar?.vector = size(inf: 0, sup: addressSizeArrDir, off: addressOffArrDir)
                    globalSearch = globalModule?.varsTable.getElement(forKey: id)
                    
                    let addressMemDirection = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressMemDirection, value: memoryDir)
                    
                    vectorVar?.cteDir = addressMemDirection
                    
                default:
                    print("no type found it")
                }
                
                let _ = modules.addElement(curr!, forKey: currentModule)
                
            } else if isMatrix == "," && isArray == "[" {
                let sizeM2 = operands.popLast()
                let sizeM1 = operands.popLast()
                if (sizeM1?.type != .Number && sizeM2?.type != .Number) {
                    //print("Tienen que ser enteros (number)")
                    return
                }
                let sizeM1Int = constanteMemory.getNumber(dir: (sizeM1?.address)!)
                let sizeM2Int = constanteMemory.getNumber(dir: (sizeM2?.address)!)
                
                let totalSize = sizeM1Int * sizeM2Int
                
                switch type {
                case "number":
                    curr?.numbers += 1
                    if(currentModule == "global"){
                        memoryDir = globalMemory.newNumberDirection()
                        for _ in 1...totalSize {
                            let _ = globalMemory.newNumberDirection()
                        }
                    }else{
                        memoryDir = moduleMemory!.newNumberDirection()
                        localCount = localCount + 1;
                        for _ in 1...totalSize {
                            let _ = moduleMemory!.newNumberDirection()
                        }
                    }
                    localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Number, direction: memoryDir), forKey: id)
                    let vectorVar = curr?.varsTable.getElement(forKey: id)
                    
                    let addressSizeArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressSizeArrDir, value: sizeM1Int)
                    
                    let addressOffArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressOffArrDir, value: sizeM2Int)
                    
                    vectorVar?.vector = size(inf: 0, sup: addressSizeArrDir, off: addressOffArrDir)
                    
                    let addressSizeMatDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressSizeMatDir, value: sizeM2Int)
                    
                    let addressOffMatDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressOffMatDir, value: 1)
                    
                    vectorVar?.matrix = size(inf: 0, sup: addressSizeMatDir, off: addressOffMatDir)
                    
                    globalSearch = globalModule?.varsTable.getElement(forKey: id)
                    
                    let addressMemDirection = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressMemDirection, value: memoryDir)
                    
                    vectorVar?.cteDir = addressMemDirection
                    
                case "decimal":
                    curr?.decimals += 1
                    if(currentModule == "global"){
                        memoryDir = globalMemory.newDecimalDirection()
                        for _ in 1...totalSize {
                            let _ = globalMemory.newDecimalDirection()
                        }
                    }else{
                        memoryDir = moduleMemory!.newDecimalDirection()
                        localCount = localCount + 1;
                        for _ in 1...totalSize {
                            let _ = moduleMemory!.newDecimalDirection()
                        }
                    }
                    localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Decimal, direction: memoryDir), forKey: id)
                    let vectorVar = curr?.varsTable.getElement(forKey: id)
                    let addressSizeArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressSizeArrDir, value: sizeM1Int)
                    
                    let addressOffArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressOffArrDir, value: sizeM2Int)
                    
                    vectorVar?.vector = size(inf: 0, sup: addressSizeArrDir, off: addressOffArrDir)
                    
                    let addressSizeMatDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressSizeMatDir, value: sizeM2Int)
                    
                    let addressOffMatDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressOffMatDir, value: 1)
                    
                    vectorVar?.matrix = size(inf: 0, sup: addressSizeMatDir, off: addressOffMatDir)
                    globalSearch = globalModule?.varsTable.getElement(forKey: id)
                    
                    let addressMemDirection = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressMemDirection, value: memoryDir)
                    
                    vectorVar?.cteDir = addressMemDirection
                    
                case "text":
                    curr?.texts += 1
                    if(currentModule == "global"){
                        memoryDir = globalMemory.newTextDirection()
                        for _ in 1...totalSize {
                            let _ = globalMemory.newTextDirection()
                        }
                    }else{
                        memoryDir = moduleMemory!.newTextDirection()
                        localCount = localCount + 1;
                        for _ in 1...totalSize {
                            let _ = moduleMemory!.newTextDirection()
                        }
                    }
                    localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Text, direction: memoryDir), forKey: id)
                    let vectorVar = curr?.varsTable.getElement(forKey: id)
                    let addressSizeArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressSizeArrDir, value: sizeM1Int)
                    
                    let addressOffArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressOffArrDir, value: sizeM2Int)
                    
                    vectorVar?.vector = size(inf: 0, sup: addressSizeArrDir, off: addressOffArrDir)
                    
                    let addressSizeMatDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressSizeMatDir, value: sizeM2Int)
                    
                    let addressOffMatDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressOffMatDir, value: 1)
                    
                    vectorVar?.matrix = size(inf: 0, sup: addressSizeMatDir, off: addressOffMatDir)
                    globalSearch = globalModule?.varsTable.getElement(forKey: id)
                    
                    let addressMemDirection = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressMemDirection, value: memoryDir)
                    
                    vectorVar?.cteDir = addressMemDirection
                case "flag":
                    curr?.flags += 1
                    if(currentModule == "global"){
                        memoryDir = globalMemory.newFlagDirection()
                        for _ in 1...totalSize {
                            let _ = globalMemory.newFlagDirection()
                        }
                    }else{
                        memoryDir = moduleMemory!.newFlagDirection()
                        localCount = localCount + 1;
                        for _ in 1...totalSize {
                            let _ = moduleMemory!.newFlagDirection()
                        }
                    }
                    localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Flag, direction: memoryDir), forKey: id)
                    let vectorVar = curr?.varsTable.getElement(forKey: id)
                    let addressSizeArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressSizeArrDir, value: sizeM1Int)
                    
                    let addressOffArrDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressOffArrDir, value: sizeM2Int)
                    
                    vectorVar?.vector = size(inf: 0, sup: addressSizeArrDir, off: addressOffArrDir)
                    
                    let addressSizeMatDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressSizeMatDir, value: sizeM2Int)
                    
                    let addressOffMatDir = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressOffMatDir, value: 1)
                    
                    vectorVar?.matrix = size(inf: 0, sup: addressSizeMatDir, off: addressOffMatDir)
                    globalSearch = globalModule?.varsTable.getElement(forKey: id)
                    
                    let addressMemDirection = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: addressMemDirection, value: memoryDir)
                    
                    vectorVar?.cteDir = addressMemDirection
                    
                default:
                    print("no type found it")
                }
                
                let _ = modules.addElement(curr!, forKey: currentModule)
                
            } else {
                
                switch type {
                case "number":
                    curr?.numbers += 1
                    if(currentModule == "global"){
                        memoryDir = globalMemory.newNumberDirection()
                    }else{
                        memoryDir = moduleMemory!.newNumberDirection()
                        localCount = localCount + 1;
                    }
                    localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Number, direction: memoryDir), forKey: id)
                    globalSearch = globalModule?.varsTable.getElement(forKey: id)
                    
                case "decimal":
                    curr?.decimals += 1
                    if(currentModule == "global"){
                        memoryDir = globalMemory.newDecimalDirection()
                    }else{
                        memoryDir = moduleMemory!.newDecimalDirection()
                        localCount = localCount + 1;
                    }
                    localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Decimal, direction: memoryDir), forKey: id)
                    globalSearch = globalModule?.varsTable.getElement(forKey: id)
                    
                case "text":
                    curr?.texts += 1
                    if(currentModule == "global"){
                        memoryDir = globalMemory.newTextDirection()
                    }else{
                        memoryDir = moduleMemory!.newTextDirection()
                        localCount = localCount + 1;
                    }
                    localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Text, direction: memoryDir), forKey: id)
                    globalSearch = globalModule?.varsTable.getElement(forKey: id)
                case "flag":
                    curr?.flags += 1
                    if(currentModule == "global"){
                        memoryDir = globalMemory.newFlagDirection()
                    }else{
                        memoryDir = moduleMemory!.newFlagDirection()
                        localCount = localCount + 1;
                    }
                    localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Flag, direction: memoryDir), forKey: id)
                    globalSearch = globalModule?.varsTable.getElement(forKey: id)
                    
                default:
                    print("no type found it")
                }
                
                
                
                let _ = modules.addElement(curr!, forKey: currentModule)
            }
        }
        
        
        override func exitF(_ ctx: ProgryParser.FContext) {
            
            let curr =  modules.getElement(forKey: currentModule)
            var opDirection : MemoryDirection?
            
            if let operand = ctx.ID()?.getText() {
                
                
                let element = curr?.varsTable.getElement(forKey: operand)
                
                if(element != nil){
                    
                    // aqui empezar los quad de arreglos
                    let isArray = ctx.OPEN_SBRACKET()?.getText()
                    let isMatrix = ctx.COMMA()?.getText()
                    
                    if isArray == "[" && isMatrix != "," {
                        let leftOperand = operands.popLast()
                        let righOperand = element?.vector?.inf
                        let resultOperand = element?.vector?.sup
                        
                        let newQuadruple = Quadruple(op: "VER", opLeft: leftOperand, opRight: MemoryDirection(data: String(righOperand!)), result: MemoryDirection(data: String(resultOperand!)))
                        
                        quadruples.list.append(newQuadruple)
                        
                        let newTemporalDirection = temporalMemory.newNumberDirection()
                        opDirection = MemoryDirection(data: "POINTER", type: .Number ,address: newTemporalDirection)
                        
                        let dirQuadruple = Quadruple(op: "+", opLeft: leftOperand, opRight: MemoryDirection(address: element?.cteDir), result: opDirection)
                        
                        quadruples.list.append(dirQuadruple)
                        
                    } else if isArray == "[" && isMatrix == "," {
                        let rightSize = operands.popLast()
                        let leftSize = operands.popLast()
                        
                        let limSupM1 = element?.vector?.sup
                        let offM1 = element?.vector?.off
                        let limSupM2 = element?.matrix?.sup
                        
                        
                        
                        let newQuadruple = Quadruple(op: "Ver", opLeft: leftSize, opRight: MemoryDirection(data: "0"), result: MemoryDirection(data: String(limSupM1!)))
                        quadruples.list.append(newQuadruple)
                        
                        let newTemporalDirection1 = temporalMemory.newNumberDirection()
                        let temp1 = MemoryDirection(type: .Number ,address: newTemporalDirection1)
                        
                        let newQuadrupleSM = Quadruple(op: "*", opLeft: leftSize, opRight: MemoryDirection(address: offM1!), result: temp1)
                        quadruples.list.append(newQuadrupleSM)
                        
                        let newQuadruple2 = Quadruple(op: "VER", opLeft: rightSize, opRight: MemoryDirection(data: "0"), result: MemoryDirection(data: String(limSupM2!)))
                        
                        quadruples.list.append(newQuadruple2)
                        
                        let newTemporalDirection2 = temporalMemory.newNumberDirection()
                        let temp2 = MemoryDirection(type: .Number ,address: newTemporalDirection2)
                        
                        let newQuadrupleSMS = Quadruple(op: "+", opLeft: temp1, opRight: rightSize, result: temp2)
                        quadruples.list.append(newQuadrupleSMS)
                        
                        let newTemporalDirection3 = temporalMemory.newNumberDirection()
                        opDirection = MemoryDirection(data: "POINTER", type: .Number ,address: newTemporalDirection3)
                        
                        let lastQuadruple = Quadruple(op: "+", opLeft: temp2, opRight: MemoryDirection(address: element?.cteDir), result: opDirection)
                        quadruples.list.append(lastQuadruple)
                        
                    } else {
                        switch element?.type {
                        case .Number:
                            opDirection = MemoryDirection(data: nil, type: .Number, address: element?.memoryDirection, quadruple: nil)
                        case .Decimal:
                            opDirection = MemoryDirection(data: nil, type: .Decimal, address: element?.memoryDirection, quadruple: nil)
                        case .Text:
                            opDirection = MemoryDirection(data: nil, type: .Text, address: element?.memoryDirection, quadruple: nil)
                        case .Flag:
                            opDirection = MemoryDirection(data: nil, type: .Flag, address: element?.memoryDirection, quadruple: nil)
                        case .VOID:
                            print("Type not found")
                        case .ERROR:
                            print("Type not found")
                        case .none:
                            print("Type not found")
                        }
                    }
                    
                }else{
                    //print("No existe la variable: \(operand)")
                    //variable not fout locally
                }
                
                
                
            } else if let _ = ctx.cte()?.getText() {
                
                if let number = ctx.cte()?.DIGIT()?.getText() {
                    let newMemoryDirection = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: newMemoryDirection, value: Int(number)!)
                    opDirection = MemoryDirection(data: nil, type: .Number, address: newMemoryDirection, quadruple: nil)
                    
                }else if let decimal = ctx.cte()?.DECIMAL()?.getText(){
                    
                    let newMemoryDirection = constanteMemory.newDecimalDirection()
                    let _ = constanteMemory.assignDecimal(dir: newMemoryDirection, value: Double(decimal)!)
                    opDirection = MemoryDirection(data: nil, type: .Decimal, address: newMemoryDirection, quadruple: nil)
                    
                }else if let text = ctx.cte()?.TEXT()?.getText(){
                    
                    let newMemoryDirection = constanteMemory.newTextDirection()
                    let _ = constanteMemory.assignText(dir: newMemoryDirection, value: text)
                    opDirection = MemoryDirection(data: nil, type: .Text, address: newMemoryDirection, quadruple: nil)
                    
                }else if let flag = ctx.cte()?.FLAG()?.getText(){
                    
                    let newMemoryDirection = constanteMemory.newFlagDirection()
                    let _ = constanteMemory.assignFlag(dir: newMemoryDirection, value: Bool(flag)!)
                    opDirection = MemoryDirection(data: nil, type: .Flag, address: newMemoryDirection, quadruple: nil)
                    
                }else{
                    //No concuerda con ningun tipo
                }
                
                
            }else{
                //parenthesis
                return
            }
            
            operands.append(opDirection!)
        }
        
        override func exitT(_ ctx: ProgryParser.TContext) {
            if let newOperator = ctx.MULT()?.getText() {
                operators.append(newOperator)
            } else if let newOperator = ctx.DIV()?.getText() {
                operators.append(newOperator)
            }
            
            if operators.last == "*" || operators.last == "/" {
                let lastOperator = operators.popLast()
                let rightOperand = operands.popLast()
                let leftOperand = operands.popLast()
                
                //aqui tenemos que ver el resultante de los dos tipos de se operaran
                
                let rightTypeNum = typeOracle.checkOracle(typeOperand: (rightOperand?.type)!)
                let leftTypeNum = typeOracle.checkOracle(typeOperand: (leftOperand?.type)!)
                
                let resTypeOracle = typeOracle.validate(left: leftTypeNum, right: rightTypeNum, op: 0)
                
                if resTypeOracle == .Number {
                    let newTemporalDirection = temporalMemory.newNumberDirection()
                    let resultOperand = MemoryDirection(type: .Number ,address: newTemporalDirection)
                    let newQuadruple = Quadruple(op: lastOperator, opLeft: leftOperand, opRight: rightOperand, result: resultOperand)
                    
                    quadruples.list.append(newQuadruple)
                    operands.append(resultOperand)
                    tempCount = tempCount + 1
                    
                } else if resTypeOracle == .Decimal {
                    let newTemporalDirection = temporalMemory.newDecimalDirection()
                    let resultOperand = MemoryDirection(type: .Decimal ,address: newTemporalDirection)
                    let newQuadruple = Quadruple(op: lastOperator, opLeft: leftOperand, opRight: rightOperand, result: resultOperand)
                    
                    quadruples.list.append(newQuadruple)
                    operands.append(resultOperand)
                    tempCount = tempCount + 1
                    
                } else {
                    // ERRORRRRRR
                }
            }
        }
        
        override func exitM_expr(_ ctx: ProgryParser.M_exprContext) {
            
            if let newOperator = ctx.PLUS()?.getText() {
                operators.append(newOperator)
            } else if let newOperator = ctx.MINUS()?.getText() {
                operators.append(newOperator)
            }
            
            
            if operators.last == "+" || operators.last == "-" {
                let lastOperator = operators.popLast()
                let rightOperand = operands.popLast()
                let leftOperand = operands.popLast()
                
                let rightTypeNum = typeOracle.checkOracle(typeOperand: (rightOperand?.type)!)
                let leftTypeNum = typeOracle.checkOracle(typeOperand: (leftOperand?.type)!)
                
                print("rightty", rightTypeNum)
                print("lefttty", leftTypeNum)
                
                let resTypeOracle = typeOracle.validate(left: leftTypeNum, right: rightTypeNum, op: 0)
                
                print("val", resTypeOracle)
                
                if resTypeOracle == .Number {
                    let newTemporalDirection = temporalMemory.newNumberDirection()
                    let resultOperand = MemoryDirection(type: .Number, address: newTemporalDirection)
                    let newQuadruple = Quadruple(op: lastOperator, opLeft: leftOperand, opRight: rightOperand, result: resultOperand)
                    
                    quadruples.list.append(newQuadruple)
                    operands.append(resultOperand)
                    tempCount = tempCount + 1
                    
                } else if resTypeOracle == .Decimal {
                    let newTemporalDirection = temporalMemory.newDecimalDirection()
                    let resultOperand = MemoryDirection(type: .Decimal ,address: newTemporalDirection)
                    let newQuadruple = Quadruple(op: lastOperator, opLeft: leftOperand, opRight: rightOperand, result: resultOperand)
                    
                    quadruples.list.append(newQuadruple)
                    operands.append(resultOperand)
                    tempCount = tempCount + 1
                    
                } else {
                    // ERRORRRRRR
                }
            }
        }
        
        override func exitG_expr(_ ctx: ProgryParser.G_exprContext) {
            if let newOperator = ctx.MORE_THAN()?.getText(){
                operators.append(newOperator)
            } else if let newOperator = ctx.LESS_THEN()?.getText() {
                operators.append(newOperator)
            } else if let newOperator = ctx.DIFERENT_THAN()?.getText() {
                operators.append(newOperator)
            } else if let newOperator = ctx.EQUAL_THAN()?.getText() {
                operators.append(newOperator)
            } else if let newOperator = ctx.MORE_AND_THAN()?.getText() {
                operators.append(newOperator)
            } else if let newOperator = ctx.LESS_AND_THAN()?.getText() {
                operators.append(newOperator)
            }
            
            if operators.last == "<" || operators.last == ">" || operators.last == "!=" || operators.last == "==" || operators.last == ">=" || operators.last == "<="{
                let lastOperator = operators.popLast()
                let rightOperand = operands.popLast()
                let leftOperand = operands.popLast()
                
                //aqui tenemos que ver el resultante de los dos tipos de se operaran
                
                let rightTypeOp = typeOracle.checkOracle(typeOperand: (rightOperand?.type)!)
                let leftTypeOp = typeOracle.checkOracle(typeOperand: (leftOperand?.type)!)
                
                
                let resTypeOracle = typeOracle.validate(left: leftTypeOp, right: rightTypeOp, op: 1)
                
                if resTypeOracle == .Flag {
                    let newTemporalDirection = temporalMemory.newFlagDirection()
                    let resultOperand = MemoryDirection(type: .Flag ,address: newTemporalDirection)
                    let newQuadruple = Quadruple(op: lastOperator, opLeft: leftOperand, opRight: rightOperand, result: resultOperand)
                    
                    quadruples.list.append(newQuadruple)
                    operands.append(resultOperand)
                    tempCount = tempCount + 1
                    
                } else {
                    // ERRORRRRRR
                }
                
            }
            
        }
        
        override func exitExpr(_ ctx: ProgryParser.ExprContext) {
            if let newOperator = ctx.OR()?.getText() {
                operators.append(newOperator)
            } else if let newOperator = ctx.AND()?.getText() {
                operators.append(newOperator)
            }
            
            if operators.last == "&&" || operators.last == "||" {
                let lastOperator = operators.popLast()
                let rightOperand = operands.popLast()
                let leftOperand = operands.popLast()
                
                //aqui tenemos que ver el resultante de los dos tipos de se operaran
                let rightTypeOp = typeOracle.checkOracle(typeOperand: (rightOperand?.type)!)
                let leftTypeOp = typeOracle.checkOracle(typeOperand: (leftOperand?.type)!)
                
                let resTypeOracle = typeOracle.validate(left: leftTypeOp, right: rightTypeOp, op: 3)
                
                if resTypeOracle == .Flag {
                    let newTemporalDirection = temporalMemory.newFlagDirection()
                    let resultOperand = MemoryDirection(type: .Flag, address: newTemporalDirection)
                    let newQuadruple = Quadruple(op: lastOperator, opLeft: leftOperand, opRight: rightOperand, result: resultOperand)
                    
                    quadruples.list.append(newQuadruple)
                    operands.append(resultOperand)
                    tempCount = tempCount + 1
                    
                } else {
                    // ERRORRRRRR
                }
            }
        }
        
        override func exitAsignation(_ ctx: ProgryParser.AsignationContext) {
            let curr = modules.getElement(forKey: currentModule)
            guard let id = ctx.ID()?.getText() else {
                return
            }
            let element = curr?.varsTable.getElement(forKey: id)
            let globalModule = modules.getElement(forKey: "global")
            let globalModuleResult = globalModule?.varsTable.getElement(forKey: id)
            var assignQuadruple = Quadruple()
            assignQuadruple.op = "="
            assignQuadruple.opLeft = operands.popLast()
            
            let isArray = ctx.array()?.OPEN_SBRACKET()?.getText()
            let isMatrix = ctx.array()?.COMMA()?.getText()
            
            if element != nil {
                if isArray == "[" && isMatrix != "," {
                    //print("ENTRA A ARRAY ASSIGN")
                    let leftOperand = operands.popLast()
                    let rightOperand = element?.vector?.inf
                    let resultOperand = element?.vector?.sup
                    
                    
                    let newQuadruple = Quadruple(op: "VER", opLeft: leftOperand, opRight: MemoryDirection(data: String(rightOperand!)), result: MemoryDirection(data: String(resultOperand!)))
                    quadruples.list.append(newQuadruple)
                    
                    let temporalDirection = temporalMemory.newNumberDirection()
                    let opDirection = MemoryDirection(data: "POINTER", type: .Number, address: temporalDirection)
                    
                    let dirQuadruple = Quadruple(op: "+", opLeft: leftOperand, opRight: MemoryDirection(address: element?.cteDir), result: opDirection)
                    quadruples.list.append(dirQuadruple)
                    assignQuadruple.result = opDirection // en global cambiar a globalresult
                    
                } else if isArray == "[" && isMatrix == "," {
                    //print("Entra a matriz assign")
                    
                    let rightSize = operands.popLast()
                    let leftSize = operands.popLast()
                    
                    let limSupM1 = element?.vector?.sup
                    let offM1 = element?.vector?.off
                    let limSupM2 = element?.matrix?.sup
                    
                    let newQuadruple = Quadruple(op: "Ver", opLeft: leftSize, opRight: MemoryDirection(data: "0"), result: MemoryDirection(data: String(limSupM1!)))
                    quadruples.list.append(newQuadruple)
                    
                    let newTemporalDirection1 = temporalMemory.newNumberDirection()
                    let temp1 = MemoryDirection(type: .Number ,address: newTemporalDirection1)
                    
                    let newQuadrupleSM = Quadruple(op: "*", opLeft: leftSize, opRight: MemoryDirection(data: String(offM1!)), result: temp1)
                    quadruples.list.append(newQuadrupleSM)
                    
                    let newQuadruple2 = Quadruple(op: "VER", opLeft: rightSize, opRight: MemoryDirection(data: "0"), result: MemoryDirection(data: String(limSupM2!)))
                    
                    quadruples.list.append(newQuadruple2)
                    
                    let newTemporalDirection2 = temporalMemory.newNumberDirection()
                    let temp2 = MemoryDirection(type: .Number ,address: newTemporalDirection2)
                    
                    let newQuadrupleSMS = Quadruple(op: "+", opLeft: temp1, opRight: rightSize, result: temp2)
                    quadruples.list.append(newQuadrupleSMS)
                    
                    let newTemporalDirection3 = temporalMemory.newNumberDirection()
                    let opDirection = MemoryDirection(data: "POINTER", type: .Number ,address: newTemporalDirection3)
                    
                    let lastQuadruple = Quadruple(op: "+", opLeft: temp2, opRight: MemoryDirection(address: element?.cteDir), result: opDirection)
                    quadruples.list.append(lastQuadruple)
                    
                    assignQuadruple.result = opDirection
                    
                } else {
                    assignQuadruple.result = MemoryDirection(data: nil, type: nil, address: element?.memoryDirection, quadruple: nil)
                }
                
            } else if globalModuleResult != nil {
                // global
                
                if isArray == "[" && isMatrix != "," {
                    let leftOperand = operands.popLast()
                    let rightOperand = globalModuleResult?.vector?.inf
                    let resultOperand = globalModuleResult?.vector?.sup
                    
                    let newQuadruple = Quadruple(op: "VER", opLeft: leftOperand, opRight: MemoryDirection(data: String(rightOperand!)), result: MemoryDirection(data: String(resultOperand!)))
                    quadruples.list.append(newQuadruple)
                    
                    let temporalDirection = temporalMemory.newNumberDirection()
                    let opDirection = MemoryDirection(data: "POINTER", type: .Number, address: temporalDirection)
                    
                    let dirQuadruple = Quadruple(op: "+", opLeft: leftOperand, opRight: MemoryDirection(address: globalModuleResult?.cteDir), result: opDirection)
                    quadruples.list.append(dirQuadruple)
                    
                    assignQuadruple.result = opDirection
                    
                    
                    
                } else if isArray == "[" && isMatrix == "," {
                    let rightSize = operands.popLast()
                    let leftSize = operands.popLast()
                    
                    // aqui son direciones de memoria
                    let limSupM1 = globalModuleResult?.vector?.sup
                    let offM1 = globalModuleResult?.vector?.off
                    let limSupM2 = globalModuleResult?.matrix?.sup
                    
                    let newQuadruple = Quadruple(op: "Ver", opLeft: leftSize, opRight: MemoryDirection(data: "0"), result: MemoryDirection(data: String(limSupM1!)))
                    quadruples.list.append(newQuadruple)
                    
                    let newTemporalDirection1 = temporalMemory.newNumberDirection()
                    let temp1 = MemoryDirection(type: .Number ,address: newTemporalDirection1)
                    
                    
                    let newQuadrupleSM = Quadruple(op: "*", opLeft: leftSize, opRight: MemoryDirection(address: offM1!), result: temp1)
                    quadruples.list.append(newQuadrupleSM)
                    
                    let newQuadruple2 = Quadruple(op: "VER", opLeft: rightSize, opRight: MemoryDirection(data: "0"), result: MemoryDirection(data: String(limSupM2!)))
                    
                    quadruples.list.append(newQuadruple2)
                    
                    let newTemporalDirection2 = temporalMemory.newNumberDirection()
                    let temp2 = MemoryDirection(type: .Number ,address: newTemporalDirection2)
                    
                    let newQuadrupleSMS = Quadruple(op: "+", opLeft: temp1, opRight: rightSize, result: temp2)
                    quadruples.list.append(newQuadrupleSMS)
                    
                    let newTemporalDirection3 = temporalMemory.newNumberDirection()
                    let opDirection = MemoryDirection(data: "POINTER", type: .Number ,address: newTemporalDirection3)
                    
                    let lastQuadruple = Quadruple(op: "+", opLeft: temp2, opRight: MemoryDirection(address: globalModuleResult?.cteDir), result: opDirection)
                    quadruples.list.append(lastQuadruple)
                    
                    assignQuadruple.result = opDirection
                    
                } else {
                    assignQuadruple.result = MemoryDirection(data: nil, type: nil, address: globalModuleResult?.memoryDirection, quadruple: nil)
                }
                
            } else {
                print("entra aqui")
                //no existe
            }
            quadruples.list.append(assignQuadruple)
        }
        
        override func enterWhiles(_ ctx: ProgryParser.WhilesContext) {
            
            currentCicle = "WHILE"
            
            //Migajita de pan
            jumpsStack.append(quadruples.list.count)
            
        }
        
        override func exitWhiles(_ ctx: ProgryParser.WhilesContext) {
            //sacamos el inice del goToF que tenemos pendiente
            let goToFalseIndex = jumpsStack.popLast()
            
            // Insertamos el GoTo para verificar de nuevo la condicion del while
            let goToIndex = jumpsStack.popLast()
            let goTo = Quadruple(op:"GOTO", opLeft: nil, opRight: nil, result: MemoryDirection(data: nil, type: nil, address: nil, quadruple: goToIndex))
            quadruples.list.append(goTo)
            
            //Rellenamos el goToF con el siguiente quadruplo
            let goToFalseNewIndex = quadruples.list.count
            quadruples.list[goToFalseIndex!].result?.quadruple = goToFalseNewIndex
            currentCicle = ""
        }
        
        
        override func enterStatute(_ ctx: ProgryParser.StatuteContext) {
            
            
        }
        
        override func enterWrite(_ ctx: ProgryParser.WriteContext) {
            
            
        }
        override func exitWrite(_ ctx: ProgryParser.WriteContext) {
            
            let count = ctx.COMMA().count
            
            
            for i in 0...count {
                let operand = operands[i]
                let newWriteQuadruple = Quadruple(op: "WRITE", opLeft: nil, opRight: nil, result: operand)
                operands.removeFirst()
                quadruples.list.append(newWriteQuadruple)
            }
        }
        
        override func exitProgram(_ ctx: ProgryParser.ProgramContext) {
            quadruples.print()
            print("op count", operands.count)
        }
        
    }
    
    func parseExpression(_ input: String) throws -> ([Quadruple], CoreMemory) {
        //print("parse Expression", input)
        let parser = try buildParser(input)
        let programContext = try parser.program()
        
        let listener = Listener()
        try ParseTreeWalker().walk(listener, programContext)
        
        return (listener.quadruples.list, CoreMemory(temporal: listener.temporalMemory, global: listener.globalMemory, constant: listener.constanteMemory))
    }
    
    
    
    private func buildParser(_ input: String) throws -> ProgryParser {
        let inputStream = ANTLRInputStream(input)
        
        let lexer = ProgryLexer(inputStream)
        let tokenStream = CommonTokenStream(lexer)
        
        return try ProgryParser(tokenStream)
    }
    
    
}

