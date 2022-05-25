//
//  VirtualMachine.swift
//  progry
//
//  Created by Kevin Duenas on 21/04/22.
//

struct VirtualMachine : VirtualMachineType {

   
    func execute(_ quadruples: [Quadruple], withMemory memory : Memory) throws -> Double  {
        
        

        for quadruple in quadruples {
            
            let left = quadruple.opLeft
            let right = quadruple.opRight
            let result = quadruple.result
  
            
            switch quadruple.op{
            
            case "START":
                
                print("START QUADRUPLE")
                
            case "=":
                print("= QUADRUPLE")
                
            case "+":
                print("+ QUADRUPLE")
                
            case "-":
                print("- QUADRUPLE")
                
            case "/":
                print("/ QUADRUPLE")
            
            case "*":
                print("* QUADRUPLE")
                
            case "GOTO":
                print("GOTO QUADRUPLE")
                
            case "GOTOF":
                print("GOTOF QUADRUPLE")
            
            default:
                
                print("NOT FOUND => \(quadruple.op ?? " ")")
                
            
            }
            
            
        }

    
        
        return 0
    }
}
