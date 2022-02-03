//
//  Display.swift
//  Calculator
//
//  Created by Henrique Cruz Neto on 02/02/22.
//

import Foundation

class Calculator: ObservableObject{
    @Published var displayValue: String
    @Published var operationStack: [String]
    @Published var valueStack: [Double]
    @Published var setForOpp: Bool
    
    let INIT_DISP_VALUE: String = "0"
    
    init(){
        self.displayValue = INIT_DISP_VALUE
        self.operationStack = [String]()
        self.valueStack = [Double]()
        self.setForOpp = false
    }
    
    func setCurrentValue(value: String) -> Void {
        self.displayValue  = value
    }
    
    func pushToOppStack(_ opp: String) -> Void {
        self.setForOpp = true
        
        self.pushToValueStack(Double(self.displayValue)!)
        
        self.displayValue = INIT_DISP_VALUE
        
        self.operationStack.append(opp)
    }
    
    func pushToValueStack(_ value: Double) -> Void {
        self.valueStack.append(value)
    }
    
    func pushToDisplayValue(_ char: String) -> Void {
        if (displayValue == INIT_DISP_VALUE && char != ".") || (displayValue == char && char == INIT_DISP_VALUE){
                self.displayValue = ""
        }
        self.displayValue += char
    }
    
    func runOperation() -> Void{
        self.setForOpp = false
        let opp =  operationStack.last
        let x = valueStack.last == nil ?  0  : valueStack.last!
        let y = Double(self.displayValue)!
        var out:Double = 0.0
        
        switch opp{
            case "+":
                out = x + y
            case "-":
                out = x - y
            case "x", "X":
                out = x * y
            case "÷":
                if y != 0.0{
                    out = x / y
                }else{
                    out = y
                }
            case "AC":
                pushToValueStack(y)
                self.displayValue = "0"
                return
            case "+-":
                out = x * -1
                self.setForOpp = false
            case "%":
                out = x * (y / 100)
            default:
                return
        }
        
        let intOut = Int(out)
        
        if  out - Double(intOut) != 0
        {
            self.displayValue = String(out)
        }
        else
        {
            self.displayValue = String(intOut)
        }
        
    }
    
}
