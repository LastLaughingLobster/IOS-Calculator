//
//  ContentView.swift
//  Calculator
//
//  Created by Henrique Cruz Neto on 02/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var functions: [Int] =  [Int]()
    @ObservedObject var calculator:Calculator = Calculator()
    
    
    var body: some View {
        VStack{
            Text("\(calculator.displayValue)")
            HStack{
                Button(ButtonName.AC){
                    calculator.pushToOppStack(ButtonName.AC)
                }
                Button("+/-"){
                    calculator.pushToOppStack("+/-")
                }
                Button("%"){
                    calculator.pushToOppStack("%")
                }
                Button("÷"){
                    calculator.pushToOppStack("+")
                }
            }
            HStack{
                Button("1"){
                    calculator.pushToDisplayValue("1")
                }
                Button("2"){
                    calculator.pushToDisplayValue("2")
                }
                Button("3"){
                    calculator.pushToDisplayValue("3")
                }
                Button("X"){
                    calculator.pushToOppStack("X")
                }
            }
            HStack{
                Button("4"){
                    calculator.pushToDisplayValue("4")
                }
                Button("5"){
                    calculator.pushToDisplayValue("5")
                }
                Button("6"){
                    calculator.pushToDisplayValue("6")
                }
                Button("-"){
                    calculator.pushToOppStack("-")
                }
            }
            HStack{
                Button("7"){
                    calculator.pushToDisplayValue("7")
                }
                Button("8"){
                    calculator.pushToDisplayValue("8")
                }
                Button("9"){
                    calculator.pushToDisplayValue("9")
                }
                Button("+"){
                    calculator.pushToOppStack("+")
                }
            }
            HStack{
                Button("0"){
                    calculator.pushToDisplayValue("0")
                }
                Button("."){
                    calculator.pushToDisplayValue(".")
                }
                Button("="){
                    calculator.runOperation()
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
