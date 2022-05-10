//
//  ProgryParserWrapper.swift
//  progry
//
//  Created by Kevin Duenas on 21/04/22.
//


import Antlr4

/// Wrapper (adapter) around Antlr4 library.
struct ProgryParserWrapper : ParserType {
    

    /// Convers AST nodes to instructions.
    private final class Listener : ProgryBaseListener {
        
        private(set) var instructions: [Instruction] = []
        private(set) var modules = HashTable<Module>(bucketSize: 15)
        private(set) var matchTable = TypeMatch()
        private(set) var quadruples = Quadruples()
        private(set) var memory = Memory()
        
        
        //Context variables
        var jumpsStack = [Int]()

        
        override func enterProgram(_ ctx: ProgryParser.ProgramContext){
            
            jumpsStack.append(quadruples.list.count) //migajita de pan
            let goToMain = Quadruple(op: .GOTO, opLeft: nil, opRight: nil, result: MemoryDirection())
            quadruples.list.append(goToMain)
            quadruples.print()
        }
        
        override func enterMain(_ ctx: ProgryParser.MainContext) {
            
            //
            let quadrupleIndex = jumpsStack.popLast()
            quadruples.list[quadrupleIndex!].result?.quadruple = quadrupleIndex! + 1
            quadruples.print()

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
        
        override func enterFor(_ ctx: ProgryParser.ForContext) {
            
            
        }
        
        override func enterVars(_ ctx: ProgryParser.VarsContext) {
            
            guard let type = ctx.type()?.getText() else{
                return //regresar errror
            }
            
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
        
        override func enterExpr(_ ctx: ProgryParser.ExprContext) {
            
            let stack = []
            
            
            let gt = ctx.t_expr().self.
            
            
            let gexp = ctx.g_exp
            
            
            
            
            
            
            
        }
        
        override func enterG_expr(_ ctx: ProgryParser.G_exprContext) {
            
        }
        
        
        override func enterWhile(_ ctx: ProgryParser.WhileContext) {
            
            
            //Migajita de pan
            jumpsStack.append(quadruples.list.count)
        
            
            //Evalua la expresion del while
            
            //Si es falsa la expresion Brinca los estatutos
            jumpsStack.append(quadruples.list.count)
            
            //tomamos la direccion del temporal de la expresio
            let exprResultOp = quadruples.list[quadruples.list.count-1].result
            
            //Agregamos el cuadruplo goToF
            let goToF = Quadruple(op: .GOTOF, opLeft: exprResultOp, opRight: nil, result: MemoryDirection())
            quadruples.list.append(goToF)
            
            
            //Realiza todos los estatuos
            
            
           
            
            //sacamos el inice del goToF que tenemos pendiente
            let goToFalseIndex = jumpsStack.popLast()
            
            // Insertamos el GoTo para verificar de nuevo la condicion del while
            let goToIndex = jumpsStack.popLast()
            let goTo = Quadruple(op: .GOTO, opLeft: nil, opRight: nil, result: MemoryDirection(data: nil, type: nil, address: nil, quadruple: goToIndex))
            quadruples.list.append(goTo)
            
            //Rellenamos el goToF con el siguiente quadruplo
            quadruples.list[goToFalseIndex!].result?.quadruple = quadruples.list.count + 1
            
            
            
        }
        
        
    
        
        
        override func enterStatute(_ ctx: ProgryParser.StatuteContext) {
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

