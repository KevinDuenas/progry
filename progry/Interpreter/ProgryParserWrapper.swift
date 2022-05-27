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
        private(set) var types : [Int] = []
        
        var i: Int = 0
        
        private(set) var currentModule = ""
        private(set) var currentCicle = ""
        
        
        
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
            
            //
            let quadrupleIndex = jumpsStack.popLast()
            quadruples.list[quadrupleIndex!].result?.quadruple = quadrupleIndex! + 1
            
            //Ingresamos el modulo main
            //let mainModule = Module(name: "main", returnType: .VOID, key: "main", forQuadruple: quadruples.list.count)
           // modules.addElement(mainModule, forKey: "main")
            currentModule = "global"
            
        }
        
        override func enterModule(_ ctx: ProgryParser.ModuleContext) {
            
            moduleMemory = Memory(start: 8000, end: 10000, type: .FUNCTION)
            var memoryDir = 0
            
            // Necesitamos guardar en la tabla de funciones que
            // esta en el cuadruplo
            
            let moduleVoid = ctx.VOID()?.getText()
            
            guard let id = ctx.ID(0)?.getText() else {
                return //regresar errror
            }
            
            currentModule = id
            
            var mod = Module.init(name: id, returnType: .VOID, key: id, forQuadruple: quadruples.list.count)
            let result = modules.addElement(mod, forKey: id)
            
            if (result == .collision){
                return
            }
            
            if moduleVoid == "void" {
                
                let totalIds = ctx.ID().count
                
                if totalIds > 1 { // Tengo uno o más parametros
                    
                    let paramNumbers = ctx.ID().count - 1
                    
//                    let result = modules.addElement(Module(name: id, returnType: .VOID, key: id, forQuadruple: quadruples.list.count), forKey: id)
//
//
//                    if (result == .collision){
//                        print("El id del modulo ya esta declarado.")
//                        return
//                    }
                    
                    
                    for p in 1...paramNumbers {
                        guard let paramType = ctx.type(p - 1)?.getText() else {
                            return
                        }
                        
                        guard let varId = ctx.ID(p)?.getText() else {
                            return
                        }
                        
                        mod = modules.getElement(forKey: currentModule)!
                        
                        switch paramType {
                        case "number":
                            memoryDir = moduleMemory!.newNumberDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Number, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Number)
                        case "decimal":
                            memoryDir = moduleMemory!.newDecimalDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Decimal, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Decimal)
                        case "flag":
                            memoryDir = moduleMemory!.newFlagDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Flag, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Flag)
                        case "text":
                            memoryDir = moduleMemory!.newTextDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Text, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Text)
                        case "error": break
                        case "void": break
                        default:
                            break
                        }
                        modules.deleteElementForKey(currentModule)
                        modules.addElement(mod, forKey: currentModule)
                    } // cierra for
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
                
                
                let totalIds = ctx.ID().count
                
                if totalIds > 1 {
                    
                    let paramNumbers = ctx.ID().count - 1
                    
                    
                    
                    
                    for p in 1...paramNumbers {
                        guard let paramType = ctx.type(p)?.getText() else {
                            return
                        }
                        guard let varId = ctx.ID(p)?.getText() else {
                            return
                        }
                        
                        mod = modules.getElement(forKey: currentModule)!
                        
                        switch paramType {
                        case "number":
                            memoryDir = moduleMemory!.newNumberDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Number, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Number)
                        case "decimal":
                            memoryDir = moduleMemory!.newDecimalDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Decimal, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Decimal)
                        case "flag":
                            memoryDir = moduleMemory!.newFlagDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Flag, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Flag)
                        case "text":
                            memoryDir = moduleMemory!.newTextDirection()
                            mod.varsTable.addElement(Variable(id: varId, type: .Text, direction: memoryDir), forKey: varId)
                            mod.paramaters?.append(.Text)
                        case "error": break
                        case "void": break
                        default:
                            break
                        }
                        modules.deleteElementForKey(currentModule)
                        modules.addElement(mod, forKey: currentModule)
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
                    
                    modules.deleteElementForKey(currentModule)
                    modules.addElement(mod, forKey: currentModule)
                }
            }
        }
        
        override func exitRead(_ ctx: ProgryParser.ReadContext) {
            if let newOperator = ctx.READ()?.getText() {
                let leftOperand = ctx.ID()?.getText()
                
                let newQuadruple = Quadruple(op: newOperator, opLeft: MemoryDirection(data: leftOperand), opRight: nil, result: MemoryDirection())
                
                quadruples.list.append(newQuadruple)
            }
            
        }
        
        override func exitModule(_ ctx: ProgryParser.ModuleContext) {
            
            guard let modType = ctx.type(0)?.getText() else {
                return
            }
            
            if modType != "void" {
                let lastResult = quadruples.list[quadruples.list.count - 1].result
                let newQuadruple = Quadruple(op: "RETURN", opLeft: nil, opRight: nil, result: operands.last)
                quadruples.list.append(newQuadruple)
            }
            
            let newQuadruple = Quadruple(op: "ENDFUNC", opLeft: nil, opRight: nil, result: nil)
            quadruples.list.append(newQuadruple)
            
            currentModule = ""
        }
        
        override func enterModule_call(_ ctx: ProgryParser.Module_callContext) {
            
            guard let id = ctx.ID()?.getText() else{
                return //regresar errror
            }
            
            let newQuadruple = Quadruple(op: "ERA", opLeft: nil, opRight: nil, result: MemoryDirection(data: id))
            quadruples.list.append(newQuadruple)
            
        }
        
        override func exitModule_call(_ ctx: ProgryParser.Module_callContext) {
            guard let id = ctx.ID()?.getText() else{
                return //regresar errror
            }
            
            let newQuadruple = Quadruple(op: "GOSUB", opLeft: nil, opRight: nil, result: MemoryDirection(data: id))
            quadruples.list.append(newQuadruple)
        }
        
        
        override func enterIfs(_ ctx: ProgryParser.IfsContext) {
            
            
            //Expresiones
            //            jumpsStack.append(quadruples.list.count ) //Migajita de pan
            //            let lastTemporal = quadruples.list[quadruples.list.count - 1].result
            //            let goToF = Quadruple(op:"GOTOF", opLeft: lastTemporal, opRight: nil, result: MemoryDirection())
            //            quadruples.list.append(goToF)
            
            
        }
        
        
        
        
        override func exitIfs(_ ctx: ProgryParser.IfsContext) {
            
            
            
            let goToFIndex = jumpsStack.popLast()
            
            let goTo = Quadruple(op: "GOTO", opLeft: nil, opRight: nil, result: MemoryDirection())
            quadruples.list.append(goTo)
            jumpsStack.append(quadruples.list.count-1) //migajita de pan del goTo
            
            let newQuadrupleCount = quadruples.list.count
            quadruples.list[goToFIndex!].result?.quadruple = newQuadrupleCount
            
        }
        
        override func enterDos(_ ctx: ProgryParser.DosContext) {
            
            
            jumpsStack.append(quadruples.list.count ) //Migajita de pan
            let lastTemporal = quadruples.list[quadruples.list.count - 1].result
            let goToF = Quadruple(op:"GOTOF", opLeft: lastTemporal, opRight: nil, result: MemoryDirection())
            quadruples.list.append(goToF)
        }
        
        override func enterFors(_ ctx: ProgryParser.ForsContext) {
            
            
        }
        override func enterVars(_ ctx: ProgryParser.VarsContext) {
            
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
                print("id repetido", id , "en", currentModule)
                return
            }else{
                let _ = curr?.varsTable.deleteElementForKey(id)
            }
            
            switch type {
            case "number":
                curr?.numbers += 1
                if(currentModule == "global"){
                    memoryDir = globalMemory.newNumberDirection()
                }else{
                    memoryDir = moduleMemory!.newNumberDirection()
                }
                localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Number, direction: memoryDir), forKey: id)
                globalSearch = globalModule?.varsTable.getElement(forKey: id)
                
            case "decimal":
                curr?.decimals += 1
                if(currentModule == "global"){
                    memoryDir = globalMemory.newDecimalDirection()
                }else{
                    memoryDir = moduleMemory!.newDecimalDirection()
                }
                localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Decimal, direction: memoryDir), forKey: id)
                globalSearch = globalModule?.varsTable.getElement(forKey: id)
                
            case "text":
                curr?.texts += 1
                if(currentModule == "global"){
                    memoryDir = globalMemory.newTextDirection()
                }else{
                    memoryDir = moduleMemory!.newTextDirection()
                }
                localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Text, direction: memoryDir), forKey: id)
                globalSearch = globalModule?.varsTable.getElement(forKey: id)
            case "flag":
                curr?.flags += 1
                if(currentModule == "global"){
                    memoryDir = globalMemory.newFlagDirection()
                }else{
                    memoryDir = moduleMemory!.newFlagDirection()
                }
                localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Flag, direction: memoryDir), forKey: id)
                globalSearch = globalModule?.varsTable.getElement(forKey: id)
                
            default:
                print("no type found it")
            }
            
            let _ = modules.addElement(curr!, forKey: currentModule)
            
            
        }
        
        
        override func enterF(_ ctx: ProgryParser.FContext) {
            
            let curr =  modules.getElement(forKey: currentModule)
            var opDirection : MemoryDirection?
            
            if let operand = ctx.ID()?.getText() {
                
                
                let element = curr?.varsTable.getElement(forKey: operand)
                
                if(element != nil){
                    
                    switch element?.type {
                    case .Number:
                        types.append(0)
                        opDirection = MemoryDirection(data: nil, type: .Number, address: element?.memoryDirection, quadruple: nil)
                    case .Decimal:
                        types.append(1)
                        opDirection = MemoryDirection(data: nil, type: .Decimal, address: element?.memoryDirection, quadruple: nil)
                    case .Text:
                        types.append(2)
                        opDirection = MemoryDirection(data: nil, type: .Text, address: element?.memoryDirection, quadruple: nil)
                    case .Flag:
                        types.append(3)
                        opDirection = MemoryDirection(data: nil, type: .Flag, address: element?.memoryDirection, quadruple: nil)
                    case .VOID:
                        print("Type not found")
                    case .ERROR:
                        print("Type not found")
                    case .none:
                        print("Type not found")
                    }
                    
                    
                }else{
                    //variable not fout locally
                }
                
                
                
            } else if let cte = ctx.cte()?.getText() {
                
                if let number = ctx.cte()?.DIGIT(0) {
                  
                    let newMemoryDirection = constanteMemory.newNumberDirection()
                    let _ = constanteMemory.assignNumber(dir: newMemoryDirection, value: Int(cte)!)
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
                let newTemporalDirection = temporalMemory.newDecimalDirection()
                let resultOperand = MemoryDirection(address: newTemporalDirection)
                let newQuadruple = Quadruple(op: lastOperator, opLeft: leftOperand, opRight: rightOperand, result: resultOperand)
                
                
                quadruples.list.append(newQuadruple)
                operands.append(resultOperand)
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
                
                //aqui tenemos que ver el resultante de los dos tipos de se operaran
                let newTemporalDirection = temporalMemory.newDecimalDirection()
                let resultOperand = MemoryDirection(address: newTemporalDirection)
                let newQuadruple = Quadruple(op: lastOperator, opLeft: leftOperand, opRight: rightOperand, result: resultOperand)
                
                quadruples.list.append(newQuadruple)
                operands.append(resultOperand)
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
                let newTemporalDirection = temporalMemory.newDecimalDirection()
                let resultOperand = MemoryDirection(address: newTemporalDirection)
                let newQuadruple = Quadruple(op: lastOperator, opLeft: leftOperand, opRight: rightOperand, result: resultOperand)
                
                quadruples.list.append(newQuadruple)
                operands.append(resultOperand)
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
                let newTemporalDirection = temporalMemory.newDecimalDirection()
                let resultOperand = MemoryDirection(address: newTemporalDirection)
                let newQuadruple = Quadruple(op: lastOperator, opLeft: leftOperand, opRight: rightOperand, result: resultOperand)
                
                quadruples.list.append(newQuadruple)
                operands.append(resultOperand)
            }
        }
        
        
        
        
        override func exitAsignation(_ ctx: ProgryParser.AsignationContext) {
            guard let id = ctx.ID()?.getText() else {
                return
            }
            
            
            let currModule = modules.getElement(forKey: currentModule)
            let currModuleResult = currModule?.varsTable.getElement(forKey: id)
            let globalModule = modules.getElement(forKey: "global")
            let globalModuleResult = globalModule?.varsTable.getElement(forKey: id)
            let lastResult = quadruples.list[quadruples.list.count-1].result
            var assignQuadruple = Quadruple()
            assignQuadruple.op = "="
            assignQuadruple.opLeft = operands.last
            
            if (currModuleResult != nil){ //localmente
                
                assignQuadruple.result = MemoryDirection(data: nil, type: nil, address: currModuleResult?.memoryDirection, quadruple: nil)
                
            }else if (globalModuleResult != nil){ //globalmente
                assignQuadruple.result = MemoryDirection(data: nil, type: nil, address: globalModuleResult?.memoryDirection, quadruple: nil)
            }
            
            quadruples.list.append(assignQuadruple)
            
            
        }
        
        override func enterWhiles(_ ctx: ProgryParser.WhilesContext) {
            
            //            jumpsStack.append(quadruples.list.count ) //Migajita de pan
            //            let lastTemporal = quadruples.list[quadruples.list.count - 1].result
            //            let goToF = Quadruple(op:"GOTOF", opLeft: lastTemporal, opRight: nil, result: MemoryDirection())
            //            quadruples.list.append(goToF)
            
            
            //Migajita de pan
            jumpsStack.append(quadruples.list.count)
            
            
            //Evalua la expresion del while
            
            //Si es falsa la expresion Brinca los estatutos
            //jumpsStack.append(quadruples.list.count)
            
            //tomamos la direccion del temporal de la expresio
            //let exprResultOp = quadruples.list[quadruples.list.count-1].result
            
            //Agregamos el cuadruplo goToF
            //let goToF = Quadruple(op: "GOTOF", opLeft: exprResultOp, opRight: nil, result: MemoryDirection())
            //quadruples.list.append(goToF)
            
            
            //Realiza todos los estatuos
            
            
            
            
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
        }
        
        
        override func enterStatute(_ ctx: ProgryParser.StatuteContext) {
        }
        
        override func exitProgram(_ ctx: ProgryParser.ProgramContext) {
            quadruples.print()
        }
        
    }
    
    func parseExpression(_ input: String) throws -> [Quadruple] {
        //print("parse Expression", input)
        let parser = try buildParser(input)
        let programContext = try parser.program()
        
        let listener = Listener()
        try ParseTreeWalker().walk(listener, programContext)
        
        return listener.quadruples.list
    }
    
    
    
    private func buildParser(_ input: String) throws -> ProgryParser {
        let inputStream = ANTLRInputStream(input)
        
        let lexer = ProgryLexer(inputStream)
        let tokenStream = CommonTokenStream(lexer)
        
        return try ProgryParser(tokenStream)
    }
}

