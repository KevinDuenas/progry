//
//  Variable.swift
//  progry
//
//  Created by Kevin Duenas on 20/04/22.
//

import Foundation

class Variable {
    
    var id: String;
    var type: String;
    var scope: String;
    var value : String;
    
    init(id: String, type: String, scope: String, value: String){
        self.id = id;
        self.type = type;
        self.scope = scope;
        self.value = value;
    }
}


