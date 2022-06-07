//
//  Quadruples.swift
//  progry
//
//  Created by Kevin Duenas on 30/04/22.
//

import Foundation


// Struct que utilizaremos en cada
// cuadruplo
struct MemoryDirection {
    var data : String?
    var type : Types?
    var address : Int?
    var quadruple : Int?
}

enum QuadrupleOp {
    case START
    case SUM
    case MULT
    case DIV
    case MINUS
    case GOTOF
    case GOTOV
    case GOTO
    case EQUAL
    case ASSIGNATION
}

struct Quadruple {
    var op : String?
    var opLeft : MemoryDirection?
    var opRight : MemoryDirection?
    var result : MemoryDirection?
}


class Quadruples {
    
    var list = [Quadruple]()
    
    // Función que inicializa la lista de quadruplos
    init(){
        let initQuadruple = Quadruple.init(op: "START", opLeft: nil, opRight: nil, result: nil)
        list.append(initQuadruple)
    }
    
    
    // Función para imprimir la lista de cuadruplos
    // OPERADOR - ADDRESS - ADDRESS - ADDRESS
    public func print(){
        
        for (index, quadruple) in list.enumerated() {
            
            Swift.print("\(index) - \(quadruple.op) - \(quadruple.opLeft?.address) - \(quadruple.opRight?.address) - \(quadruple.result?.address) ")
        }
        
    }
    
}
