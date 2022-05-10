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
    
    // Global
    var globalNumbersCounter = 0
    var globalTextsCounter = 0
    var globalFlagsCounter = 0
    var globalDecimalsCounter = 0
    
    var globalNumbers = [Int]()
    var globalTexts = [String]()
    var globalFlags = [Bool]()
    var globalDecimals = [Double]()
    
    // Temporal
    
    var tempNumbersCounter = 0;
    var tempTextsCounter = 0;
    var tempFlagsCounter = 0;
    var tempDecimalsCounter = 0;
    
    var tempNumbers = [Int]()
    var tempTexts = [String]()
    var tempFlags = [Bool]()
    var tempDecimals = [Double]()
    
    //
    
    
    init(){
        
    }
    

    public func pushNumber(number : Int, scope: MemoryType) -> Int{
        
        switch scope {
        case .GLOBAL :
            globalNumbers.append(number)
            globalNumbersCounter += 1;
            return globalNumbersCounter;
            
        case .TEMPORAL :
            tempNumbers.append(number)
            tempNumbersCounter += 1;
            return tempNumbersCounter;
            
        default:
            break
        }
        
    }
    
    
}
