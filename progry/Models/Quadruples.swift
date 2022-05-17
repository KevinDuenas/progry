//
//  Quadruples.swift
//  progry
//
//  Created by Kevin Duenas on 30/04/22.
//

import Foundation

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
}

struct Quadruple {
    var op : String?
    var opLeft : String?
    var opRight : String?
    var result : MemoryDirection?
}


class Quadruples {
    
    var list = [Quadruple]()
    
    init(){
        let initQuadruple = Quadruple.init(op: "START", opLeft: nil, opRight: nil, result: nil)
        list.append(initQuadruple)
    }
    
    
    public func print(){
        
        for (index, quadruple) in list.enumerated() {
            
            Swift.print("\(index) - \(quadruple.op) - \(quadruple.opLeft) - \(quadruple.opRight) - \(quadruple.result?.quadruple) ")
        }
        
    }
    
}
