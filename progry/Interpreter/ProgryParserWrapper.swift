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

        
        override func enterProgram(_ ctx: ProgryParser.ProgramContext){
            
            
        }
        
        override func enterMain(_ ctx: ProgryParser.MainContext) {
          
        }
        
        override func enterModule(_ ctx: ProgryParser.ModuleContext) {
      
            guard let id = ctx.ID()?.getText() else{
                return //regresar errror
            }
            
            //revisar que no este repetido
            
            
            
            
            instructions.append(.loadModule(id))
            
        }
        
        override func enterFor(_ ctx: ProgryParser.ForContext) {
            
            
        }
        
        override func enterVars(_ ctx: ProgryParser.VarsContext) {
            <#code#>
        }
        
        
        
       
        
        override func enterExpr(_ ctx: ProgryParser.ExprContext) {
            
            
            
            
            
            
        }
        
        
        override func enterStatute(_ ctx: ProgryParser.StatuteContext) {
        }

    }

    func parseExpression(_ input: String) throws -> [Instruction] {
        print("parse Expression", input)
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

