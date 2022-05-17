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
}


class Memory {
    
    let start : Int?
    let end : Int?
    let type : MemoryType?
    
//    let startNumber : Int?
//    let startDecimal : Int?
//    let startText : Int?
//    let startFlag : Int?
//    
//    
//    var numberMemory : [Int]?
//    var decimalMemory : [Double]?
//    var textMemory : [String]?
//    var flagMemory : [Bool]?
    
        
    
    init(start : Int, end :Int, type: MemoryType){
        
        self.start = start
        self.end = end
        self.type = type
        
//        switch type {
//        case .GLOBAL:
//            let size = end - start + 1
//            let arraySize = size / 4
//            startNumber = start;
//            numberMemory = []
//            startDecimal  = arraySize + startNumber!;
//            decimalMemory = []
//            startText = arraySize + startDecimal!;
//            textMemory = []
//            startFlag = arraySize + startText!;
//            flagMemory = []
//            
//        case .TEMPORAL:
//            let size = end - start + 1
//            let arraySize = size / 2
//            startNumber = start;
//            numberMemory = []
//            startDecimal  = arraySize + startNumber!;
//            decimalMemory = []
//        }
        
    }
    

//    public func pushNumber(number : Int) -> Int{
//
//        numberMemory?.append(number)
//
//        let direction = startNumber! + numberMemory!.count - 1;
//
//        return direction
//    }
//
//    public func pushDecimal(decimal : Double) -> Int {
//
//        decimalMemory?.append(decimal)
//
//        let direction = startDecimal! + decimalMemory!.count - 1;
//
//        return direction
//
//    }
//
//    public func pushText(text : String) -> Int {
//
//        textMemory?.append(text)
//
//        let direction = startText! + textMemory!.count - 1;
//
//        return direction
//
//    }
//
//    public func pushFlag(flag : Bool) -> Int {
//
//        flagMemory?.append(flag)
//
//        let direction = startFlag! + flagMemory!.count - 1;
//
//        return direction
//
//    }
//
    
}
