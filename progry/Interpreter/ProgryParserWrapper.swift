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
        
        
        private(set) var operands : [String] = []
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
            quadruples.print()
            
            let globalModule = Module(name: "global", returnType: .VOID, key: "global", forQuadruple: 0)
            modules.addElement(globalModule, forKey: "global")
            currentModule = "global";
        }
        
        override func enterMain(_ ctx: ProgryParser.MainContext) {
            
            //
            let quadrupleIndex = jumpsStack.popLast()
            quadruples.list[quadrupleIndex!].result?.quadruple = quadrupleIndex! + 1
            quadruples.print()
            
            
            //Ingresamos el modulo main
            let mainModule = Module(name: "main", returnType: .VOID, key: "main", forQuadruple: quadruples.list.count)
            modules.addElement(mainModule, forKey: "main")
            currentModule = "main"
            
        }
        
        override func enterModule(_ ctx: ProgryParser.ModuleContext) {
            
            // Necesitamos guardar en la tabla de funciones que
            // esta en el cuadruplo
            
            guard let id = ctx.ID(0)?.getText() else{
                return //regresar errror
            }
            
            
            let newModule = Module(name: id, returnType: .VOID, key: id, forQuadruple: quadruples.list.count)
            
            let result = modules.addElement(Module(name: id, returnType: .VOID, key: id, forQuadruple: quadruples.list.count), forKey: id)
            
            if (result == .collision){
                print("El id del modulo ya esta declarado.")
            }
            
            currentModule = id
            
    
            
        }
        
        override func exitModule(_ ctx: ProgryParser.ModuleContext) {
            currentModule = ""
            
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
            var localInsertion : InsertionStatus?
            var globalSearch : Variable?
            let _ = modules.deleteElementForKey(currentModule)
            
            switch type {
            case "number":
                curr?.numbers += 1

                let memory = globalMemory.pushNumber()
                localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Number, direction: memory), forKey: id)
                globalSearch = globalModule?.varsTable.getElement(forKey: id)
                
            case "decimal":
                curr?.decimals += 1
                localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Decimal, direction: 0), forKey: id)
                globalSearch = globalModule?.varsTable.getElement(forKey: id)
                
            case "text":
                curr?.texts += 1
                localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Text, direction: 0), forKey: id)
                globalSearch = globalModule?.varsTable.getElement(forKey: id)
            case "flag":
                curr?.flags += 1
                localInsertion = curr?.varsTable.addElement(Variable(id: id, type: .Flag, direction: 0), forKey: id)
                globalSearch = globalModule?.varsTable.getElement(forKey: id)
                
            default:
                print("no type found it")
            }
            
            
            if((localInsertion == .collision || globalSearch != nil) && currentModule != "global"){
                //Ya existe el id o localmente o globalmente
                print("id repetido", id , "en", currentModule)
                return
            }
            
            
            let _ = modules.addElement(curr!, forKey: currentModule)
            
            
        }
        
        override func enterF(_ ctx: ProgryParser.FContext) {
            if let operand = ctx.ID()?.getText() {
                operands.append(operand)
            } else if let cte = ctx.cte()?.getText() {
                operands.append(cte)
            }
            
            // PENDEINTE VALIDACION DE TYPES
            
            //            switch operandType {
            //            case "number":
            //                types.append(0)
            //
            //            case "decimal":
            //                types.append(1)
            //
            //            case "text":
            //                types.append(2)
            //
            //            case "flag":
            //                types.append(3)
            //            }
            
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
                
                let newQuadruple = Quadruple(op: lastOperator, opLeft: MemoryDirection(data: leftOperand), opRight: MemoryDirection(data: rightOperand), result: MemoryDirection())
                quadruples.list.append(newQuadruple)
                operands.append("res")
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
                
                let newQuadruple = Quadruple(op: lastOperator, opLeft: MemoryDirection(data: leftOperand), opRight: MemoryDirection(data: rightOperand), result: MemoryDirection())
                quadruples.list.append(newQuadruple)
                operands.append("res")
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
                print(operands)
                print(operators)
                let lastOperator = operators.popLast()
                let rightOperand = operands.popLast()
                let leftOperand = operands.popLast()
                
                let newQuadruple = Quadruple(op: lastOperator, opLeft: MemoryDirection(data: leftOperand), opRight: MemoryDirection(data: rightOperand), result: MemoryDirection())
                quadruples.list.append(newQuadruple)
                operands.append("res")
            }
            
        }
        
        override func exitExpr(_ ctx: ProgryParser.ExprContext) {
            if let newOperator = ctx.OR()?.getText() {
                operators.append(newOperator)
            } else if let newOperator = ctx.AND()?.getText() {
                operators.append(newOperator)
            }
            
            if operators.last == "&&" || operators.last == "||" {
                print(operands)
                print(operators)
                let lastOperator = operators.popLast()
                let rightOperand = operands.popLast()
                let leftOperand = operands.popLast()
                
                let newQuadruple = Quadruple(op: lastOperator, opLeft: MemoryDirection(data: leftOperand), opRight: MemoryDirection(data: rightOperand), result: MemoryDirection())
                quadruples.list.append(newQuadruple)
                operands.append("res")
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
            assignQuadruple.opLeft = lastResult
            
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
    
    func parseExpression(_ input: String) throws -> [Instruction] {
        //print("parse Expression", input)
        let parser = try buildParser(input)
        let programContext = try parser.program()
        
        let listener = Listener()
        try ParseTreeWalker().walk(listener, programContext)
        
        return listener.instructions
    }
    
    
    
    private func buildParser(_ input: String) throws -> ProgryParser {
        let inputStream = ANTLRInputStream(input)
        
        let lexer = ProgryLexer(inputStream)
        let tokenStream = CommonTokenStream(lexer)
        
        return try ProgryParser(tokenStream)
    }
}

