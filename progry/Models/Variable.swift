//
//  Variable.swift
//  progry
//
//  Created by Kevin Duenas on 20/04/22.
//

import Foundation

class Variable {
    
    var id: String;
    var type: Types;
    var memoryDirection : Int;
//    var key: String;
//    var nextNode: Variable?
    
    
    init(id: String, type: Types, direction: Int){
        self.id = id;
        self.type = type;
        self.memoryDirection = direction
    }
}


