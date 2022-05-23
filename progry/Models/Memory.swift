//
//  Memory.swift
//  progry
//
//  Created by Kevin Duenas on 07/05/22.
//

import Foundation

enum MemoryType {
    case GLOBAL
    case TEMPORAL
    case FUNCTION
}


class Memory {
    
    let start : Int?
    let end : Int?
    let type : MemoryType?
    var arraySize : Int = 0
    
    var startNumber : Int = 0
    var startDecimal : Int = 0
    var startText : Int = 0
    var startFlag : Int = 0
    
    var countNumber : Int = 0
    var countDecimal : Int = 0
    var countText : Int = 0
    var countFlag : Int = 0
    
    var numberMemory : [Int] = []
    var decimalMemory : [Double] = []
    var textMemory : [String] = []
    var flagMemory : [Bool] = []
    
        
    
    init(start : Int, end :Int, type: MemoryType){
        
        self.start = start
        self.end = end
        self.type = type
        
        
        switch type {
        case .GLOBAL:
            let size = end - start
            print("size", size)
            arraySize = size / 4
            startNumber = start;
            startDecimal = start + arraySize
            startText = start + arraySize + arraySize
            startFlag = start + arraySize + arraySize + arraySize 
            
        case .TEMPORAL:
            let size = end - start
            arraySize = size / 2
            startNumber = start;
            startDecimal  = start + arraySize;
            
        case .FUNCTION:
            let size = end - start + 1
            let arraySize = size / 4
            startNumber = start;
            numberMemory = []
            startDecimal  = arraySize + startNumber + 1;
            decimalMemory = []
            startText = arraySize + startDecimal + 1;
            textMemory = []
            startFlag = arraySize + startText + 1;
            flagMemory = []
            
        }
        
    }

    

    public func pushNumber() -> Int{
        
        let direction = startNumber + countFlag;
        countNumber += 1
        return direction
    }

    public func pushDecimal() -> Int {

        let direction = startDecimal + countDecimal;
        countDecimal += 1
        return direction

    }

    public func pushText() -> Int {

        let direction = startText + countText;
        countText += 1
        return direction

    }

    public func pushFlag(flag : Bool) -> Int {

        let direction = startFlag + countFlag;
        countFlag += 1
        return direction

    }
    
    public func printMemory() {

        print("NUMBER: \(startNumber) -  \(startNumber + arraySize - 1)  COUNTER -> \(countNumber)")
        print("DECIMAL: \(startDecimal) -  \(startDecimal + arraySize - 1)  COUNTER -> \(countDecimal)")
        print("TEXT: \(startText) -  \(startText + arraySize - 1)  COUNTER -> \(countText)")
        print("FLAG: \(startFlag) -  \(startFlag + arraySize - 1)  COUNTER -> \(countFlag)")
    }

    
}
