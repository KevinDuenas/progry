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
    var parametersNumber : Int;
    var localVarNumber : Int;
    var temporalVars : Int;
    var numbers : Int;
    var decimals : Int;
    var texts : Int;
    var flags : Int;
    
    var tempNumbers : Int;
    var tempDecimals : Int;
    var tempFlags : Int;
    
    
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
        self.parametersNumber = 0;
        self.localVarNumber = 0;
        self.temporalVars = 0;
        self.tempFlags = 0;
        self.tempDecimals = 0;
        self.tempNumbers = 0;
    }
    
    //Funcion utilizada para imprimir toda la informacion del modulo
    func print() {
        Swift.print("name: \(name) returnType \(returnType) index \(quadrupleIndex) paramnum \(parametersNumber) locavar \(localVarNumber) temporals \(temporalVars) number \(numbers)")
    }
    
}
