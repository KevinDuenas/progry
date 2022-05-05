//
//  Module.swift
//  progry
//
//  Created by Kevin Duenas on 20/04/22.
//

import Foundation

class Module{
    
    var name: String;
    var type: String;
    var varsTable = HashTable<Variable>(bucketSize: 100)
    var key: String;
    var nextNode: Module?
    
    init(name: String, type: String, key : String){
        self.name = name;
        self.type = type;
        self.key = key
    }
    
}
