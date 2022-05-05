//
//  VirtualMachine.swift
//  progry
//
//  Created by Kevin Duenas on 21/04/22.
//

struct VirtualMachine : VirtualMachineType {

   

    func execute(_ instructions: [InstructionType]) throws -> Double  {
    
        var modules = HashTable<Module>(bucketSize: 15)
        let matchTable = TypeMatch()
        let quadruples = Quadruples()
        
        
        print("curr", matchTable.validate(left: 1, right: 1, op: 3))

        for instruction in instructions {
            try instruction.execute()
        }
        //Resolver Cuadruplos
        
        modules.printHashTable()
        
        
        return 0
    }
}
