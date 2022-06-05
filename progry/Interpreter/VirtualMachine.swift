//
//  VirtualMachine.swift
//  progry
//
//  Created by Kevin Duenas on 21/04/22.
//

import UIKit

struct VirtualMachine : VirtualMachineType {
    
    
    func execute(_ quadruples: [Quadruple], withMemory memory : CoreMemory)  throws -> Double  {
        
        var pointer = 0;
        let topController: UIViewController =  UIApplication.shared.keyWindow!.rootViewController!.presentedViewController!.childViewControllerForPointerLock!
        let topVc = topController as! ViewController;
        var lastPointers = [Int]()
        

        while pointer < quadruples.count {
            
            let quadruple = quadruples[pointer]
            let left = quadruple.opLeft
            let right = quadruple.opRight
            let result = quadruple.result
            
            switch quadruple.op{
                
            case "START":
                
                print("START QUADRUPLE")
                pointer += 1
                topVc.clearCommandView()
            case "=":
                print("= QUADRUPLE")
                var l = memory.getValueFromDir(dir: (left?.address)!)
                if result?.data == "POINTER"{
                    let dir = memory.getValueFromDir(dir: (result?.address)!)
                    memory.addValueToDir(dir: Int(dir!.1)!, data: l!.1)
                }else if left?.data == "POINTER"{
                    l = memory.getValueFromDir(dir: Int(l!.1)!)
                    memory.addValueToDir(dir: Int((result?.address)!), data: l!.1)
                }else {
                    memory.addValueToDir(dir: result!.address!, data: l!.1)
                }
                
                pointer += 1
            case "+":
                var l = memory.getValueFromDir(dir: (left?.address)!)
                var r = memory.getValueFromDir(dir: (right?.address)!)
                
                if left?.data == "POINTER" {
                    let leftPointer = memory.getValueFromDir(dir: (left?.address)!)
                    l = memory.getValueFromDir(dir: Int(leftPointer!.1)!)
                }
                
                if right?.data == "POINTER" {
                    let rightPointer = memory.getValueFromDir(dir: (right?.address)!)
                    r = memory.getValueFromDir(dir: Int(rightPointer!.1)!)
                }
                
                switch l!.0{
                case .Number:
                    print("+ QUADRUPLE ->", Int(l!.1)! + Int(r!.1)!)
                    let sum =  Int(l!.1)! + Int(r!.1)!
                    memory.addValueToDir(dir: (result?.address)!, data: String(sum))
                case .Decimal:
                    let sum =  Double(l!.1)! + Double(r!.1)!
                    print("+ QUADRUPLE ->", sum)
                    memory.addValueToDir(dir: (result?.address)!, data: String(sum))
                case .Text:
                    print("texts cannot sum")
                case .Flag:
                    print("flags cannot sum")
                case .ERROR:
                    print("error cannot sum")
                case .VOID:
                    print("void cannot sum")
                }
                
                pointer += 1
            case "-":
                
                var l = memory.getValueFromDir(dir: (left?.address)!)
                var r = memory.getValueFromDir(dir: (right?.address)!)
                
                if left?.data == "POINTER" {
                    let leftPointer = memory.getValueFromDir(dir: (left?.address)!)
                    l = memory.getValueFromDir(dir: Int(leftPointer!.1)!)
                }
                
                if right?.data == "POINTER" {
                    let rightPointer = memory.getValueFromDir(dir: (right?.address)!)
                    r = memory.getValueFromDir(dir: Int(rightPointer!.1)!)
                }
                
                switch l!.0{
                case .Number:
                    let rest = Int(l!.1)! - Int(r!.1)!
                    print("- QUADRUPLE ->", rest)
                    memory.addValueToDir(dir: (result?.address)!, data: String(rest))
                case .Decimal:
                    let rest =  Double(l!.1)! - Double(r!.1)!
                    print("- QUADRUPLE ->", rest)
                    memory.addValueToDir(dir: (result?.address)!, data: String(rest))
                case .Text:
                    print("texts cannot res")
                case .Flag:
                    print("flags cannot res")
                case .ERROR:
                    print("error cannot res")
                case .VOID:
                    print("void cannot res")
                }
                pointer += 1
                
            case "/":
                var l = memory.getValueFromDir(dir: (left?.address)!)
                var r = memory.getValueFromDir(dir: (right?.address)!)
                
                if left?.data == "POINTER" {
                    let leftPointer = memory.getValueFromDir(dir: (left?.address)!)
                    l = memory.getValueFromDir(dir: Int(leftPointer!.1)!)
                }
                
                if right?.data == "POINTER" {
                    let rightPointer = memory.getValueFromDir(dir: (right?.address)!)
                    r = memory.getValueFromDir(dir: Int(rightPointer!.1)!)
                }
                
                switch l!.0{
                case .Number:
                    let div = Int(l!.1)! / Int(r!.1)!
                    print("/ QUADRUPLE ->", div)
                    memory.addValueToDir(dir: (result?.address)!, data: String(div))
                case .Decimal:
                    let div =  Double(l!.1)! / Double(r!.1)!
                    print("/ QUADRUPLE ->", div)
                    memory.addValueToDir(dir: (result?.address)!, data: String(div))
                case .Text:
                    print("texts cannot sum")
                case .Flag:
                    print("flags cannot sum")
                case .ERROR:
                    print("error cannot sum")
                case .VOID:
                    print("void cannot sum")
                }
                pointer += 1
            case "*":
                var l = memory.getValueFromDir(dir: (left?.address)!)
                var r = memory.getValueFromDir(dir: (right?.address)!)
                
                if left?.data == "POINTER" {
                    let leftPointer = memory.getValueFromDir(dir: (left?.address)!)
                    l = memory.getValueFromDir(dir: Int(leftPointer!.1)!)
                }
                
                if right?.data == "POINTER" {
                    let rightPointer = memory.getValueFromDir(dir: (right?.address)!)
                    r = memory.getValueFromDir(dir: Int(rightPointer!.1)!)
                }
                
                switch l!.0{
                case .Number:
                    let prod = Int(l!.1)! * Int(r!.1)!
                    print("* QUADRUPLE ->", prod)
                    memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                case .Decimal:
                    let prod =  Double(l!.1)! * Double(r!.1)!
                    print("* QUADRUPLE ->", prod)
                    memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                case .Text:
                    print("texts cannot prod")
                case .Flag:
                    print("flags cannot prod")
                case .ERROR:
                    print("error cannot prod")
                case .VOID:
                    print("void cannot prod")
                }
                pointer += 1
                
            case ">":
                var l = memory.getValueFromDir(dir: (left?.address)!)
                var r = memory.getValueFromDir(dir: (right?.address)!)
                
                if left?.data == "POINTER" {
                    let leftPointer = memory.getValueFromDir(dir: (left?.address)!)
                    l = memory.getValueFromDir(dir: Int(leftPointer!.1)!)
                }
                
                if right?.data == "POINTER" {
                    let rightPointer = memory.getValueFromDir(dir: (right?.address)!)
                    r = memory.getValueFromDir(dir: Int(rightPointer!.1)!)
                }
                
                switch l!.0{
                case .Number:
                    let prod = Int(l!.1)! > Int(r!.1)!
                    print("> QUADRUPLE ->", prod)
                    memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                case .Decimal:
                    let prod =  Double(l!.1)! > Double(r!.1)!
                    print("> QUADRUPLE ->", prod)
                    memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                case .Text:
                    print("texts cannot compare")
                case .Flag:
                    print("flags cannot compare")
                case .ERROR:
                    print("error cannot compare")
                case .VOID:
                    print("void cannot compare")
                }
                pointer += 1
                
            case "<":
                var l = memory.getValueFromDir(dir: (left?.address)!)
                var r = memory.getValueFromDir(dir: (right?.address)!)
                
                if left?.data == "POINTER" {
                    let leftPointer = memory.getValueFromDir(dir: (left?.address)!)
                    l = memory.getValueFromDir(dir: Int(leftPointer!.1)!)
                }
                
                if right?.data == "POINTER" {
                    let rightPointer = memory.getValueFromDir(dir: (right?.address)!)
                    r = memory.getValueFromDir(dir: Int(rightPointer!.1)!)
                }
                
                switch l!.0{
                case .Number:
                    let prod = Int(l!.1)! < Int(r!.1)!
                    print("< QUADRUPLE ->", prod)
                    memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                case .Decimal:
                    let prod =  Double(l!.1)! < Double(r!.1)!
                    print("< QUADRUPLE ->", prod)
                    memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                case .Text:
                    print("texts cannot compare")
                case .Flag:
                    print("flags cannot compare")
                case .ERROR:
                    print("error cannot compare")
                case .VOID:
                    print("void cannot compare")
                }
                pointer += 1
                
            case ">=":
                var l = memory.getValueFromDir(dir: (left?.address)!)
                var r = memory.getValueFromDir(dir: (right?.address)!)
                
                if left?.data == "POINTER" {
                    let leftPointer = memory.getValueFromDir(dir: (left?.address)!)
                    l = memory.getValueFromDir(dir: Int(leftPointer!.1)!)
                }
                
                if right?.data == "POINTER" {
                    let rightPointer = memory.getValueFromDir(dir: (right?.address)!)
                    r = memory.getValueFromDir(dir: Int(rightPointer!.1)!)
                }
                
                switch l!.0{
                case .Number:
                    let prod = Int(l!.1)! >= Int(r!.1)!
                    print(">= QUADRUPLE ->")
                    memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                case .Decimal:
                    let prod =  Double(l!.1)! >= Double(r!.1)!
                    print(">= QUADRUPLE ->")
                    memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                case .Text:
                    print("texts cannot compare")
                case .Flag:
                    print("flags cannot compare")
                case .ERROR:
                    print("error cannot compare")
                case .VOID:
                    print("void cannot compare")
                }
                pointer += 1
                
            case "==":
                var l = memory.getValueFromDir(dir: (left?.address)!)
                var r = memory.getValueFromDir(dir: (right?.address)!)
                
                if left?.data == "POINTER" {
                    let leftPointer = memory.getValueFromDir(dir: (left?.address)!)
                    l = memory.getValueFromDir(dir: Int(leftPointer!.1)!)
                }
                
                if right?.data == "POINTER" {
                    let rightPointer = memory.getValueFromDir(dir: (right?.address)!)
                    r = memory.getValueFromDir(dir: Int(rightPointer!.1)!)
                }
                
                switch l!.0{
                case .Number:
                    let prod = Int(l!.1)! == Int(r!.1)!
                    print("== QUADRUPLE ->", prod)
                    memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                case .Decimal:
                    let prod =  Double(l!.1)! == Double(r!.1)!
                    print("== QUADRUPLE ->", prod)
                    memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                case .Text:
                    print("texts cannot compare")
                case .Flag:
                    print("flags cannot compare")
                case .ERROR:
                    print("error cannot compare")
                case .VOID:
                    print("void cannot compare")
                }
                pointer += 1
            case "<=":
                var l = memory.getValueFromDir(dir: (left?.address)!)
                var r = memory.getValueFromDir(dir: (right?.address)!)
                
                if left?.data == "POINTER" {
                    let leftPointer = memory.getValueFromDir(dir: (left?.address)!)
                    l = memory.getValueFromDir(dir: Int(leftPointer!.1)!)
                }
                
                if right?.data == "POINTER" {
                    let rightPointer = memory.getValueFromDir(dir: (right?.address)!)
                    r = memory.getValueFromDir(dir: Int(rightPointer!.1)!)
                }
                
                switch l!.0{
                case .Number:
                    let prod = Int(l!.1)! <= Int(r!.1)!
                    print("<= QUADRUPLE ->", prod)
                    memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                case .Decimal:
                    let prod =  Double(l!.1)! <= Double(r!.1)!
                    print("<= QUADRUPLE ->", prod)
                    memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                case .Text:
                    print("texts cannot compare")
                case .Flag:
                    print("flags cannot compare")
                case .ERROR:
                    print("error cannot compare")
                case .VOID:
                    print("void cannot compare")
                }
                pointer += 1
            case "||":
                var l = memory.getValueFromDir(dir: (left?.address)!)
                var r = memory.getValueFromDir(dir: (right?.address)!)
                
                if left?.data == "POINTER" {
                    let leftPointer = memory.getValueFromDir(dir: (left?.address)!)
                    l = memory.getValueFromDir(dir: Int(leftPointer!.1)!)
                }
                
                if right?.data == "POINTER" {
                    let rightPointer = memory.getValueFromDir(dir: (right?.address)!)
                    r = memory.getValueFromDir(dir: Int(rightPointer!.1)!)
                }
                
                
                let prod = Bool(l!.1)! || Bool(r!.1)!
                print("|| QUADRUPLE ->", prod)
                memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                
                pointer += 1
                
            case "&&":
                var l = memory.getValueFromDir(dir: (left?.address)!)
                var r = memory.getValueFromDir(dir: (right?.address)!)
                
                if left?.data == "POINTER" {
                    let leftPointer = memory.getValueFromDir(dir: (left?.address)!)
                    l = memory.getValueFromDir(dir: Int(leftPointer!.1)!)
                }
                
                if right?.data == "POINTER" {
                    let rightPointer = memory.getValueFromDir(dir: (right?.address)!)
                    r = memory.getValueFromDir(dir: Int(rightPointer!.1)!)
                }
                
                
                let prod = Bool(l!.1)! && Bool(r!.1)!
                print("&& QUADRUPLE ->", prod)
                memory.addValueToDir(dir: (result?.address)!, data: String(prod))
                
                pointer += 1
                
            case "GOTO":
                print("GOTO QUADRUPLE", (quadruple.result?.quadruple))
                pointer = (quadruple.result?.quadruple)!
                
            case "GOTOF":
                print("GOTOF QUADRUPLE", (result?.quadruple)!)
                let data = memory.getValueFromDir(dir: (left?.address) as! Int)
                let condition = Bool(data!.1)
                if condition == false{
                    pointer = (result?.quadruple)!
                }else{
                    pointer += 1
                }
                
            case "ENDFUNC":
                print("ENDFUNC QUADRUPLE")
                memory.moduleStack.popLast()
                pointer = lastPointers.popLast()!
            case "ERA":
                
                let newModMemory = Memory(start: 8000, end: 10000, type: .FUNCTION) //Instanciando nueva memoria
                let quantities = result?.data?.components(separatedBy: "-")
                var aux = 0;
                while (aux < Int(quantities![0])! ){
                    print("entra al numero")
                    let _ = newModMemory.newNumberDirection()
                    aux += 1;
                }
                aux = 0;
                while (aux < Int(quantities![1])! ){
                    let _ = newModMemory.newDecimalDirection()
                    aux += 1;
                }
                aux = 0;
                while (aux < Int(quantities![2])! ){
                    let _ = newModMemory.newTextDirection()
                    aux += 1;
                }
                aux = 0;
                while (aux < Int(quantities![3])! ){
                    let _ = newModMemory.newFlagDirection()
                    aux += 1;
                }
                memory.moduleStack.append(newModMemory)
                print("ERA QUADRUPLE", result?.data)
                pointer += 1
            case "GOSUB":
                print("GOSUB QUADRUPLE", quadruple.result?.quadruple)
                lastPointers.append(pointer + 1)
                pointer = (quadruple.result?.quadruple)!
                
            case "READ":
                print("READ QUADRUPLE")
                //ReadPopUpViewController.presentPopUp(parentVC: topVc)
                //PopUpsViewController.presentPopUp(parentVC: topController)
                //topVc.addComand(cmd: "writing")
                //await ReadPopUpViewController.newTask
                pointer += 1
                
            case "PARAM":
                print("PARAM QUADRUPLE")
                var l : (Types, String)
                if(memory.moduleStack.count > 1){
                    l = memory.moduleStack[memory.moduleStack.count - 2].getData(dir: (left?.address)!)
                }else{
                    l = memory.getValueFromDir(dir: (left?.address)!)!
                }

                if result?.data == "POINTER"{
                    let dir = memory.getValueFromDir(dir: (result?.address)!)
                    memory.addValueToDir(dir: Int(dir!.1)!, data: l.1)
                } else {
                    memory.addValueToDir(dir: result!.address!, data: l.1)
                }
                
                pointer += 1
            case "RETURN":
                print("RETURN QUADRUPLE")
                var l = memory.getValueFromDir(dir: (left?.address)!)
                if result?.data == "POINTER"{
                    let dir = memory.getValueFromDir(dir: (result?.address)!)
                    memory.addValueToDir(dir: Int(dir!.1)!, data: l!.1)
                }else if left?.data == "POINTER"{
                    l = memory.getValueFromDir(dir: Int(l!.1)!)
                    memory.addValueToDir(dir: Int((result?.address)!), data: l!.1)
                }else {
                    memory.addValueToDir(dir: result!.address!, data: l!.1)
                }
                pointer += 1
            case "WRITE":
                print("WRITE QUADRUPLE")
                if result?.data == "POINTER" {
                    let dataPointer = memory.getValueFromDir(dir: (result?.address)!)
                    let data = memory.getValueFromDir(dir: Int(dataPointer!.1)!)
                    print("data pointer", data!.1)
                    topVc.addComand(cmd: data!.1)
                } else {
                    let data = memory.getValueFromDir(dir: (result?.address)!)
                    topVc.addComand(cmd: data!.1)
                    print("data", data!.1)
                }
                pointer += 1
            default:
                pointer += 1
                print("NOT FOUND => \(quadruple.op ?? " ")")
            }
            
        }
        
        //   return uno(2) + uno(2)
        
        
        
        return 0
    }
}
