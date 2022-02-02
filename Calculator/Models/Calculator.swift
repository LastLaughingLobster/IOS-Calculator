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
        let x = valueStack.last!
        let y = Double(self.displayValue)!
        var out:Double
        
        switch opp{
            case "+":
                out = x + y
            case "-":
                out = x - y
            case "x", "X":
                out = x * y
            case "÷":
                out = x / y
            default:
                out = x + y
        }
        
        self.displayValue = String(out)
        
    }
    
}
