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
}

struct Quadruple {
    var op : String
    var opLeft : MemoryDirection?
    var opRight : MemoryDirection?
    var result : MemoryDirection?
}


class Quadruples {
    
    var list = [Quadruple]()
    
    init(){
        let initQuadruple = Quadruple.init(op: "START", opLeft: nil, opRight: nil, result: nil)
        list.append(initQuadruple)
    }
    
    
    
    
}
