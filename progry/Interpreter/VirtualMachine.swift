//
//  VirtualMachine.swift
//  progry
//
//  Created by Kevin Duenas on 21/04/22.
//

struct VirtualMachine : VirtualMachineType {

   
    func execute(_ quadruples: [Quadruple], withMemory memory : CoreMemory) throws -> Double  {
        

        for quadruple in quadruples {
            
            let left = quadruple.opLeft
            let right = quadruple.opRight
            let result = quadruple.result
            
            switch quadruple.op{
            
            case "START":
                
                print("START QUADRUPLE")
                
            case "=":
                let l = memory.getValueFromDir(dir: (left?.address)!)
                memory.addValueToDir(dir: result!.address!, data: l!.1)
                
            case "+":
                
                let l = memory.getValueFromDir(dir: (left?.address)!)
                let r = memory.getValueFromDir(dir: (right?.address)!)

                switch l!.0{
                case .Number:
                    print("+ QUADRUPLE ->", Int(l!.1)! + Int(r!.1)!)
                    let sum =  Int(l!.1)! + Int(r!.1)!
                    memory.addValueToDir(dir: (result?.address)!, data: String(sum))
                case .Decimal:
                    let sum =  Double(l!.1)! + Double(r!.1)!
                    print("+ QUADRUPLE ->", sum)
                    memory.addValueToDir(dir: (result?.address)!, data: String(sum))
                case .Text:
                    print("texts cannot sum")
                case .Flag:
                    print("flags cannot sum")
                case .ERROR:
                    print("error cannot sum")
                case .VOID:
                    print("void cannot sum")
                }

                
            case "-":
                
                let l = memory.getValueFromDir(dir: (left?.address)!)
                let r = memory.getValueFromDir(dir: (right?.address)!)

                switch l!.0{
                case .Number:
                    let rest = Int(l!.1)! - Int(r!.1)!
                    print("- QUADRUPLE ->", rest)
                    memory.addValueToDir(dir: (result?.address)!, data: String(rest))
                case .Decimal:
                    let rest =  Double(l!.1)! - Double(r!.1)!
                    print("- QUADRUPLE ->", rest)
                    memory.addValueToDir(dir: (result?.address)!, data: String(rest))
                case .Text:
                    print("texts cannot res")
                case .Flag:
                    print("flags cannot res")
                case .ERROR:
                    print("error cannot res")
                case .VOID:
                    print("void cannot res")
                }
        
                
            case "/":
                let l = memory.getValueFromDir(dir: (left?.address)!)
                let r = memory.getValueFromDir(dir: (right?.address)!)

                switch l!.0{
                case .Number:
                    let div = Int(l!.1)! / Int(r!.1)!
                    print("/ QUADRUPLE ->", div)
                    memory.addValueToDir(dir: (result?.address)!, data: String(div))
                case .Decimal:
                    let div =  Double(l!.1)! / Double(r!.1)!
                    print("/ QUADRUPLE ->", div)
                    memory.addValueToDir(dir: (result?.address)!, data: String(div))
                case .Text:
                    print("texts cannot sum")
                case .Flag:
                    print("flags cannot sum")
                case .ERROR:
                    print("error cannot sum")
                case .VOID:
                    print("void cannot sum")
                }
            
            case "*":
                let l = memory.getValueFromDir(dir: (left?.address)!)
                let r = memory.getValueFromDir(dir: (right?.address)!)

                switch l!.0{
                case .Number:
                    let prod = Int(l!.1)! * Int(r!.1)!
                    print("* QUADRUPLE ->", prod)
                    memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                case .Decimal:
                    let prod =  Double(l!.1)! * Double(r!.1)!
                    print("* QUADRUPLE ->", prod)
                    memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                case .Text:
                    print("texts cannot prod")
                case .Flag:
                    print("flags cannot prod")
                case .ERROR:
                    print("error cannot prod")
                case .VOID:
                    print("void cannot prod")
                }
                
            case "GOTO":
                print("GOTO QUADRUPLE")
                
            case "GOTOF":
                print("GOTOF QUADRUPLE")
                
            case "ENDFUNC":
                print("ENDFUNC QUADRUPLE")
                
            case "ERA":
                print("ERA QUADRUPLE")
            
            case "GOSUB":
                print("GOSUB QUADRUPLE")
            
            default:
                
                print("NOT FOUND => \(quadruple.op ?? " ")")
                
            
            }
            
            
        }

    
        
        return 0
    }
}
