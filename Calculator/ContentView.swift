//
//  ContentView.swift
//  Calculator
//
//  Created by Henrique Cruz Neto on 02/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var calculator:Calculator = Calculator()
    
    var body: some View {
        ZStack{
            
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text("\(calculator.displayValue)")
                        .bold()
                        .font(.system(size: 54))
                        .foregroundColor(.white)
                        .padding(.trailing, 15.0)
                    
                }
                
                HStack{
                    let row:[ButtonNames] = [.clear, .signal, .percent, .division]
                    ForEach(row, id:  \.self) { name in
                        Button(action: {
                            calculator.pushToOppStack(name.rawValue)
                            if name != row.last{
                                calculator.runOperation()
                            }
                        }, label: {
                            Text("\(name.rawValue)")
                                .bold().frame(
                                    width: buttonDiameter(),
                                    height: buttonDiameter()
                                )
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .background(name.btnColor)
                                .cornerRadius(buttonDiameter()/2)
                        })
                    }
                }
                
                let rows:[[ButtonNames]] = [
                    [.one, .two, .three, .multi],
                    [.four, .five, .six, .minus],
                    [.seven, .eight, .nine, .plus]
                ]
                
                ForEach(rows, id:  \.self) { row in
                    HStack{
                        ForEach(row, id:  \.self) { name in
                            Button(action: {
                                if name == row.last{
                                    calculator.pushToOppStack(name.rawValue)
                                }else{
                                    calculator.pushToDisplayValue(name.rawValue)
                                }
                                
                            }, label: {
                                Text("\(name.rawValue)")
                                    .bold().frame(
                                        width: buttonDiameter(),
                                        height: buttonDiameter()
                                    )
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                                    .background(name.btnColor)
                                    .cornerRadius(buttonDiameter()/2)
                            })
                        }
                    }
                }
                
                HStack{
                    let row:[ButtonNames] = [.zero, .dot, .equals]
                    ForEach(row, id:  \.self) { name in
                        Button(action: {
                            if name == row.last{
                                calculator.runOperation()
                            }else{
                                calculator.pushToDisplayValue(name.rawValue)
                            }
                        }, label: {
                            Text("\(name.rawValue)")
                                .bold().frame(
                                    width: name == ButtonNames.zero ?
                                        (buttonDiameter() * 2) + 10:
                                        buttonDiameter(),
                                    height: buttonDiameter()
                                )
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .background(name.btnColor)
                                .cornerRadius(buttonDiameter()/2)
                        })
                    }
                }
            }
        }
    }
    
    func buttonDiameter() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*8)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
