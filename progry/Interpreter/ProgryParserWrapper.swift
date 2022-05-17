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
        private(set) var memory = Memory()
        
        private(set) var operands : [String] = []
        private(set) var operators : [String] = []
        private(set) var types : [Int] = []
        
        var i: Int = 0
        
        
        
        
        //Context variables
        var jumpsStack = [Int]()
        
        
        override func enterProgram(_ ctx: ProgryParser.ProgramContext){
            
            jumpsStack.append(quadruples.list.count) //migajita de pan
            let goToMain = Quadruple(op: "GOTO", opLeft: nil, opRight: nil, result: MemoryDirection())
            quadruples.list.append(goToMain)
            quadruples.print()
            
            print(matchTable.validate(left: 0, right: 1, op: 0))
        }
        
        override func enterMain(_ ctx: ProgryParser.MainContext) {
            
            //
            let quadrupleIndex = jumpsStack.popLast()
            quadruples.list[quadrupleIndex!].result?.quadruple = quadrupleIndex! + 1
            
        }
        
        override func enterModule(_ ctx: ProgryParser.ModuleContext) {
            
            // Necesitamos guardar en la tabla de funciones que
            // esta en el cuadruplo
            
            guard let id = ctx.ID()?.getText() else{
                return //regresar errror
            }
            
            modules.addElement(Module(name: id, type: "void", key: id, forQuadruple: quadruples.list.count), forKey: id)
            
            
            //print("quadruple size", quadruples.list.count)
            //print("MODULE", id)
            
            //revisar que no este repetido
            
            
            
            
            
        }
        
        //        override func enterIf(_ ctx: ProgryParser.IfContext) {
        //
        //            jumpsStack.append(quadruples.list.count - 1) //Migajita de pan
        //            let lastTemporal = quadruples.list[quadruples.list.count - 1].result
        //            let goToF = Quadruple(op: "GOTOF", opLeft:"LASTEMPORAL", opRight: nil, result: MemoryDirection())
        //            quadruples.list.append(goToF)
        //
        //            //Expresiones
        //
        //
        //            let goToFIndex = jumpsStack.popLast()
        //
        //            let goTo = Quadruple(op: .GOTO, opLeft: nil, opRight: nil, result: MemoryDirection())
        //            quadruples.list.append(goTo)
        //            jumpsStack.append(quadruples.list.count-1) //migajita de pan del goTo
        //
        //
        //            quadruples.list[goToFIndex!].result?.quadruple = quadruples.list.count
        //
        //
        //        }
        //
        //        override func exitIf(_ ctx: ProgryParser.IfContext) {
        //
        //
        //
        //            let goToFIndex = jumpsStack.popLast()
        //
        //            let goTo = Quadruple(op: .GOTO, opLeft: nil, opRight: nil, result: MemoryDirection())
        //            quadruples.list.append(goTo)
        //            jumpsStack.append(quadruples.list.count-1) //migajita de pan del goTo
        //
        //
        //            quadruples.list[goToFIndex!].result?.quadruple = quadruples.list.count
        //
        //        }
        
        
        
        override func enterFors(_ ctx: ProgryParser.ForsContext) {
            
            
        }
        
        override func enterVars(_ ctx: ProgryParser.VarsContext) {
            
            //            guard let type = ctx.type()?.getText() else{
            //                return //regresar errror
            //            }
            
            guard let id = ctx.ID()?.getText() else {
                return
            }
            
            
            var memoryDirection = -1
            
            
            //            switch type {
            //            case "number":
            //                memory.pushNumber(number: <#T##Int#>, scope: <#T##MemoryType#>)
            //            }
            
            
            //print("var detected", type, id)
            
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
                
                let newQuadruple = Quadruple(op: lastOperator, opLeft: leftOperand, opRight: rightOperand, result: MemoryDirection())
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
                print(operands)
                print(operators)
                let lastOperator = operators.popLast()
                let rightOperand = operands.popLast()
                let leftOperand = operands.popLast()
                
                let newQuadruple = Quadruple(op: lastOperator, opLeft: leftOperand, opRight: rightOperand, result: MemoryDirection())
                quadruples.list.append(newQuadruple)
                operands.append("res")
            }
        }
        
        //        override func enterWhile(_ ctx: ProgryParser.WhileContext) {
        //
        //
        //            //Migajita de pan
        //            jumpsStack.append(quadruples.list.count)
        //
        //
        //            //Evalua la expresion del while
        //
        //            //Si es falsa la expresion Brinca los estatutos
        //            jumpsStack.append(quadruples.list.count)
        //
        //            //tomamos la direccion del temporal de la expresio
        //            let exprResultOp = quadruples.list[quadruples.list.count-1].result
        //
        //            //Agregamos el cuadruplo goToF
        //            let goToF = Quadruple(op: .GOTOF, opLeft: exprResultOp, opRight: nil, result: MemoryDirection())
        //            quadruples.list.append(goToF)
        //
        //
        //            //Realiza todos los estatuos
        //
        //
        //
        //
        //            //sacamos el inice del goToF que tenemos pendiente
        //            let goToFalseIndex = jumpsStack.popLast()
        //
        //            // Insertamos el GoTo para verificar de nuevo la condicion del while
        //            let goToIndex = jumpsStack.popLast()
        //            let goTo = Quadruple(op: .GOTO, opLeft: nil, opRight: nil, result: MemoryDirection(data: nil, type: nil, address: nil, quadruple: goToIndex))
        //            quadruples.list.append(goTo)
        //
        //            //Rellenamos el goToF con el siguiente quadruplo
        //            quadruples.list[goToFalseIndex!].result?.quadruple = quadruples.list.count + 1
        //
        //
        //
        //        }
        
        
        
        
        
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

