//
//  TypeMatch.swift
//  progry
//
//  Created by Kevin Duenas on 28/04/22.
//

import Foundation

enum Types {
    case Number
    case Decimal
    case Text
    case Flag
    case ERROR
    case VOID
}


class TypeMatch {
    
    private var oracle = Array(repeating: Array(repeating: Array(repeating: Types.ERROR, count: 10), count: 10), count: 10)
    
    init(){
        setOracle()
    }

    // Función para rellenar el cúbo semántico
    // segun las reglas creadas por nuestro
    // lenguage PROGRY
    private func setOracle(){
        
        // 0 - Number
        // 1 - Decimal
        // 2 - Text
        // 3 - Flag
        
        ///MARK:- OPERATORS +, -, /, *
        oracle[0][0][0] = Types.Number
        oracle[0][1][0] = Types.Decimal
        oracle[0][2][0] = Types.ERROR
        oracle[0][3][0] = Types.ERROR
        
        oracle[1][0][0] = Types.Decimal
        oracle[1][1][0] = Types.Decimal
        oracle[1][2][0] = Types.ERROR
        oracle[1][3][0] = Types.ERROR
        
        oracle[2][0][0] = Types.ERROR
        oracle[2][1][0] = Types.ERROR
        oracle[2][2][0] = Types.ERROR
        oracle[2][3][0] = Types.ERROR
        
        oracle[3][0][0] = Types.ERROR
        oracle[3][1][0] = Types.ERROR
        oracle[3][2][0] = Types.ERROR
        oracle[3][3][0] = Types.ERROR
        
        ///MARK:- OPERATORS  <,> , >=, <=
        oracle[0][0][1] = Types.Flag
        oracle[0][1][1] = Types.Flag
        oracle[0][2][1] = Types.ERROR
        oracle[0][3][1] = Types.ERROR
        
        oracle[1][0][1] = Types.Flag
        oracle[1][1][1] = Types.Flag
        oracle[1][2][1] = Types.ERROR
        oracle[1][3][1] = Types.ERROR
        
        oracle[2][0][1] = Types.ERROR
        oracle[2][1][1] = Types.ERROR
        oracle[2][2][1] = Types.ERROR
        oracle[2][3][1] = Types.ERROR
        
        oracle[3][0][1] = Types.ERROR
        oracle[3][1][1] = Types.ERROR
        oracle[3][2][1] = Types.ERROR
        oracle[3][3][1] = Types.ERROR
        
        ///MARK:- OPERATORS  >< , ==
        oracle[0][0][2] = Types.Flag
        oracle[0][1][2] = Types.Flag
        oracle[0][2][2] = Types.ERROR
        oracle[0][3][2] = Types.ERROR
        
        oracle[1][0][2] = Types.Flag
        oracle[1][1][2] = Types.Flag
        oracle[1][2][2] = Types.ERROR
        oracle[1][3][2] = Types.ERROR
        
        oracle[2][0][2] = Types.ERROR
        oracle[2][1][2] = Types.ERROR
        oracle[2][2][2] = Types.Flag
        oracle[2][3][2] = Types.ERROR
        
        oracle[3][0][2] = Types.ERROR
        oracle[3][1][2] = Types.ERROR
        oracle[3][2][2] = Types.ERROR
        oracle[3][3][2] = Types.Flag
        
        ///MARK:- OPERATORS &&, | |
        oracle[0][0][3] = Types.ERROR
        oracle[0][1][3] = Types.ERROR
        oracle[0][2][3] = Types.ERROR
        oracle[0][3][3] = Types.ERROR
        
        oracle[1][0][3] = Types.ERROR
        oracle[1][1][3] = Types.ERROR
        oracle[1][2][3] = Types.ERROR
        oracle[1][3][3] = Types.ERROR
        
        oracle[2][0][3] = Types.ERROR
        oracle[2][1][3] = Types.ERROR
        oracle[2][2][3] = Types.ERROR
        oracle[2][3][3] = Types.ERROR
        
        oracle[3][0][3] = Types.ERROR
        oracle[3][1][3] = Types.ERROR
        oracle[3][2][3] = Types.ERROR
        oracle[3][3][3] = Types.Flag
        
    }
    
    // Función para validar el tipo resultante entre
    // dos operandos y un operador
    public func validate(left: Int, right: Int, op: Int) -> Types {
        return oracle[left][right][op]
    }
    
    // Función para relacionar el un valor de tipo
    // Type con el indice del cúbo semántico
    public func checkOracle(typeOperand : Types) -> Int {
        switch typeOperand {
        case .Number:
            return 0
        case .Decimal:
            return 1
        case .Text:
            return 2
        case .Flag:
            return 3
        case .ERROR: break
            
        case .VOID: break
            
        }
        return -1
    }
    
                                
    
}
