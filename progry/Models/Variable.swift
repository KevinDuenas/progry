//
//  Variable.swift
//  progry
//
//  Created by Kevin Duenas on 20/04/22.
//

import Foundation

struct size {
    var inf : Int = 0;
    var sup : Int?;
    var off : Int?;
}

class Variable {
    
    var id: String;
    var type: Types;
    var memoryDirection : Int;
    var vector : size?
    var matrix : size?
    var cteDir : Int?;
//    var key: String;
//    var nextNode: Variable?
    
    
    init(id: String, type: Types, direction: Int){
        self.id = id;
        self.type = type;
        self.memoryDirection = direction
    }
}


