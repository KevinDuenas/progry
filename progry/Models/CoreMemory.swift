//
//  CoreMemory.swift
//  progry
//
//  Created by Kevin Duenas on 26/05/22.
//

import Foundation



class CoreMemory {
    
    let temporal : Memory?
    let global : Memory?
    let constant : Memory?
    
    
    init(temporal : Memory, global : Memory, constant: Memory){
        self.temporal = temporal
        self.global = global
        self.constant = constant
    }

    func addValueToDir(dir : Int, data: String)  {
        
        if((temporal?.start!)! <= dir && dir <= (temporal?.end!)! ){

            temporal?.assignData(dir: dir, data: data)
        }else if ((global?.start!)! <= dir && dir <= (global?.end!)! ){

            global?.assignData(dir: dir, data: data)
        }else if ((constant?.start!)! <= dir && dir <= (constant?.end!)! ){

            constant?.assignData(dir: dir, data: data)
        }
        
    }
    
 
    
     func getValueFromDir(dir : Int) -> (Types, String)? {
         
        var val : (Types, String)?

         
        if((temporal?.start!)! <= dir && dir <= (temporal?.end!)! ){

            val = temporal?.getData(dir: dir)
            
        }else if ((global?.start!)! <= dir && dir <= (global?.end!)! ){

            val = global?.getData(dir: dir)
        }else if ((constant?.start!)! <= dir && dir <= (constant?.end!)! ){

            val = constant?.getData(dir: dir)
        }
         
        
        return val
//        switch val!.0 {
//        case .Number:
//            return Int(val!.1)
//        case.Decimal:
//
//        case .Text:
//
//        case .Flag:
//        case .ERROR:
//            <#code#>
//        case .VOID:
//            <#code#>
//        }
        
    }
    
}
