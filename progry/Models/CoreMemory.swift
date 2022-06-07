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
    var moduleStack = [Memory]()
    
    
    init(temporal : Memory, global : Memory, constant: Memory){
        self.temporal = temporal
        self.global = global
        self.constant = constant
    }

    // Función encargada de añadir un valor a
    // una dirección especifica. Validando
    // los limites de cada memoria que tenemos
    func addValueToDir(dir : Int, data: String)  {
        
        if((temporal?.start!)! <= dir && dir < (temporal?.end!)! ){

            temporal?.assignData(dir: dir, data: data)
        }else if ((global?.start!)! <= dir && dir < (global?.end!)! ){

            global?.assignData(dir: dir, data: data)
        }else if ((constant?.start!)! <= dir && dir < (constant?.end!)! ){

            constant?.assignData(dir: dir, data: data)
        }else {
            moduleStack[moduleStack.count-1].assignData(dir: dir, data: data)
        }
        
    }
    
    // Función que retorna un un valor y su tipo
    // dada una dirección específica. Validando
    // los limites de cada memoria que tenemos
    
     func getValueFromDir(dir : Int) -> (Types, String)? {
         
        var val : (Types, String)?

         
        if((temporal?.start!)! <= dir && dir < (temporal?.end!)! ){

            val = temporal?.getData(dir: dir)
            
        }else if ((global?.start!)! <= dir && dir < (global?.end!)! ){

            val = global?.getData(dir: dir)
        }else if ((constant?.start!)! <= dir && dir < (constant?.end!)! ){

            val = constant?.getData(dir: dir)
        }else{
            val = moduleStack[moduleStack.count-1].getData(dir: dir)
        }
         
        
        return val
        
    }
    
}
