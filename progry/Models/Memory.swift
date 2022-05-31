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
    case CONSTANTS
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
            let size = end - start
            arraySize = size / 4
            startNumber = start;
            startDecimal = start + arraySize
            startText = start + arraySize + arraySize
            startFlag = start + arraySize + arraySize + arraySize
            
        case .CONSTANTS:
            let size = end - start
            arraySize = size / 4
            startNumber = start;
            startDecimal = start + arraySize
            startText = start + arraySize + arraySize
            startFlag = start + arraySize + arraySize + arraySize
            
        }
        
    }
    
    
    public func assignData(dir: Int, data: String)  {
        switch getDirType(dir: dir){
        case .Number:
            
            assignNumber(dir: dir, value: Int(data)!)
        case .Decimal:
            assignDecimal(dir: dir, value: Double(data)!)
        case .Text:
            assignText(dir: dir, value: data)
        case .Flag:
            assignFlag(dir: dir, value: Bool(data)!)
        case .ERROR:
            return
        case .VOID:
            return 
        }
        
        
    }
    
    public func getData(dir: Int) -> (Types, String) {
        switch getDirType(dir: dir){
           
        case .Number:
            return(.Number, String(getNumber(dir: dir)) )
        case .Decimal:

            return(.Decimal, String(getDecimal(dir: dir)) )
        case .Text:
            return(.Text, String(getText(dir: dir)) )
        case .Flag:
            return(.Flag, String(getFlag(dir: dir)) )
        case .ERROR:
            return(.ERROR,"" )
        case .VOID:
            return(.ERROR,"" )
        }
        
    }
    
    public func getDirType(dir: Int) -> Types {
        if self.type == .TEMPORAL {

            if dir >= start! && dir < startDecimal {

                return .Number
            }else if dir >= startDecimal && dir < end!{

                return .Decimal
            }
        }else{
            if dir >= start! && dir < startDecimal {

                return .Number
            }else if dir >= startDecimal && dir < startText{

                return .Decimal
            }else if dir >= startText && dir < startFlag {

                return .Text
            }else if dir >= startFlag && dir <= end! {

                return .Flag
            }
        }
        
        return .ERROR
        
    }

    public func assignNumber(dir: Int, value: Int) -> Bool{
        
        let arrayDir = dir - startNumber
        numberMemory[arrayDir] = value
        return true
    }

    public func assignDecimal(dir: Int, value: Double) -> Bool {
        
        let arrayDir = dir - startDecimal
        decimalMemory[arrayDir] = value
        return true
    }

    public func assignText(dir: Int, value: String) -> Bool {

        let arrayDir = dir - startText
        textMemory[arrayDir] = value
        return true

    }

    public func assignFlag(dir: Int, value: Bool) -> Bool {

        let arrayDir = dir - startFlag
        flagMemory[arrayDir] = value
        return true

    }
    
    public func getNumber(dir: Int) -> Int{
        
        let arrayDir = dir - startNumber
        return numberMemory[arrayDir]
    }

    public func getDecimal(dir: Int) -> Double {
        
        let arrayDir = dir - startDecimal
        return   decimalMemory[arrayDir]
    }

    public func getText(dir: Int) -> String {

        let arrayDir = dir - startText
        return textMemory[arrayDir]

    }

    public func getFlag(dir: Int) -> Bool {

        let arrayDir = dir - startFlag
        return flagMemory[arrayDir]

    }
    
    

    public func newNumberDirection() -> Int{
        let direction = startNumber + countNumber;
        numberMemory.append(0)
        countNumber += 1
        return direction
    }
    
    public func newDecimalDirection() -> Int {

        let direction = startDecimal + countDecimal;
        decimalMemory.append(0)
        countDecimal += 1
        return direction

    }

    public func newTextDirection() -> Int {

        let direction = startText + countText;
        textMemory.append("")
        countText += 1
        return direction

    }

    public func newFlagDirection() -> Int {

        let direction = startFlag + countFlag;
        flagMemory.append(false)
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
