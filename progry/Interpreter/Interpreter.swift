//
//  Interpreter.swift
//  progry
//
//  Created by Kevin Duenas on 20/04/22.
//

protocol ParserType {

    func parseExpression(_ input: String) throws -> ([Quadruple], CoreMemory)
}

protocol VirtualMachineType {

    func execute(_ quadruples: [Quadruple], withMemory memory : CoreMemory) throws -> Double
}

protocol InstructionType {

    func execute(_ modules: inout HashTable<Module>, quadruples : inout Quadruples) throws
}

/// Interpreter parses and evaluates instructions.
struct Interpreter {

    /// An error that can occur during evaluation.
    enum Error : Swift.Error {

        /// Syntax error in input. Reported by the parser.
        case syntax(_ error: Swift.Error)

        /// Runtime error during instruction execution.
        case runtime(_ error: RuntimeError)
    }

    let parser: ParserType

    let virtualMachine: VirtualMachineType

    init(parser: ParserType = ProgryParserWrapper(), virtualMachine: VirtualMachineType = VirtualMachine()) {
        self.parser = parser
        self.virtualMachine = virtualMachine
    }

    /// Evaluates the input string and returns resulting number or an error
    func evaluate(_ input: String) -> Result<Double, Error> {
        
        let result : ([Quadruple], CoreMemory)

        do {
            result = try parser.parseExpression(input)

        }
        catch {
            return .failure(.syntax(error))
        }

        do {
            let resultValue = try  virtualMachine.execute(result.0, withMemory: result.1) //mandar la memoria
            return .success(resultValue)
        }
        catch {
            return .failure(.syntax(error))
        }
    }
}
