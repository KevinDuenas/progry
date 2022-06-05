//
//  Quadruples.swift
//  progry
//
//  Created by Kevin Duenas on 30/04/22.
//

import Foundation

struct MemoryDirection {
    var data : String?
    var type : Types?
    var address : Int?
    var quadruple : Int?
}

enum QuadrupleOp {
    case START
    case SUM
    case MULT
    case DIV
    case MINUS
    case GOTOF
    case GOTOV
    case GOTO
    case EQUAL
    case ASSIGNATION
}

struct Quadruple {
    var op : String?
    var opLeft : MemoryDirection?
    var opRight : MemoryDirection?
    var result : MemoryDirection?
}


class Quadruples {
    
    var list = [Quadruple]()
    
    init(){
        let initQuadruple = Quadruple.init(op: "START", opLeft: nil, opRight: nil, result: nil)
        list.append(initQuadruple)
    }
    
    
    public func print(){
        
        let num = "#"
        let op = "Operator"
        let l = "Left"
        let r = "Right"
        let a = "Result"
        let s = "-"
        
        Swift.print(num.padding(toLength: 6, withPad: " ", startingAt: 0), s.padding(toLength: 7, withPad: " ", startingAt: 0), op.padding(toLength: 12, withPad: " ", startingAt: 0), s.padding(toLength: 7, withPad: " ", startingAt: 0), l.padding(toLength: 29, withPad: " ", startingAt: 0), s.padding(toLength: 7, withPad: " ", startingAt: 0), r.padding(toLength: 29, withPad: " ", startingAt: 0), s.padding(toLength: 7, withPad: " ", startingAt: 0), a.padding(toLength: 15, withPad: " ", startingAt: 0))
        
        for (index, quadruple) in list.enumerated() {
            
            let sep = "-"
            let ind = String(index)
            let oper = quadruple.op
            let leftd = quadruple.opLeft?.data
            let lefta = quadruple.opLeft?.address
            let rightd = quadruple.opRight?.data
            let righta = quadruple.opRight?.address
            let resd = quadruple.result?.data
            let resa = quadruple.result?.address
            let resi = quadruple.result?.quadruple
            
            
            Swift.print(ind.padding(toLength: 6, withPad: " ", startingAt: 0), sep.padding(toLength: 7, withPad: " ", startingAt: 0) , oper!.padding(toLength: 12, withPad: " ", startingAt: 0), sep.padding(toLength: 7, withPad: " ", startingAt: 0), leftd?.padding(toLength: 8, withPad: " ", startingAt: 0) ?? "--".padding(toLength: 8, withPad: " ", startingAt: 0), "->  ", lefta?.description.padding(toLength: 15, withPad: " ", startingAt: 0) ?? "--".padding(toLength: 15, withPad: " ", startingAt: 0), sep.padding(toLength: 7, withPad: " ", startingAt: 0), rightd?.padding(toLength: 8, withPad: " ", startingAt: 0) ?? "--".padding(toLength: 8, withPad: " ", startingAt: 0), "->  ", righta?.description.padding(toLength: 15, withPad: " ", startingAt: 0) ?? "--".padding(toLength: 15, withPad: " ", startingAt: 0), sep.padding(toLength: 7, withPad: " ", startingAt: 0), resd?.padding(toLength: 8, withPad: " ", startingAt: 0) ?? "--".padding(toLength: 8, withPad: " ", startingAt: 0), "->  ", resa?.description.padding(toLength: 8, withPad: " ", startingAt: 0) ?? "--".padding(toLength: 10, withPad: " ", startingAt: 0), resi ?? " ")
        }
        
    }
    
}
