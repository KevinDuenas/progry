//
//  Instruction.swift
//  progry
//
//  Created by Kevin Duenas on 20/04/22.
//

/// The instruction executed by a virtual machine
enum Instruction {

    
    case loadModule(_ id: String)
    

   
}
    
extension Instruction : InstructionType {

    func execute(_ modules: inout HashTable<Module>, quadruples: inout Quadruples ) throws {
        
    }
}
