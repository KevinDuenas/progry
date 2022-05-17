//
//  Module.swift
//  progry
//
//  Created by Kevin Duenas on 20/04/22.
//

import Foundation

class Module{
    
    var name: String;
    var returnType: Types;
    var varsTable = HashTable<Variable>(bucketSize: 100)
    var key: String;
    var quadrupleIndex : Int;
    
    var paramaters : [Types]?
    var numbers : Int;
    var decimals : Int;
    var texts : Int;
    var flags : Int;
    
    
    var nextNode: Module?
    
    init(name: String, returnType: Types, key : String, forQuadruple index : Int){
        self.name = name;
        self.returnType = returnType;
        self.key = key
        self.quadrupleIndex = index
        self.numbers = 0
        self.decimals = 0
        self.texts = 0
        self.flags = 0;
        paramaters = []
    }
    
}
