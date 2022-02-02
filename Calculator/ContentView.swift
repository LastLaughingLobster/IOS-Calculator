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
                    let row:[String] = ["AC", "+-", "%", "÷"]
                    ForEach(row, id:  \.self) { name in
                        Button(action: {
                            calculator.pushToOppStack(name)
                            if name != row.last{
                                calculator.runOperation()
                            }
                        }, label: {
                            Text("\(name)")
                                .bold().frame(width: 74, height: 74)
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .background(.orange)
                                .cornerRadius(37)
                        })
                    }
                }
                HStack{
                    let row:[String] = ["1", "2", "3", "x"]
                    ForEach(row, id:  \.self) { name in
                        Button(action: {
                            if name == row.last{
                                calculator.pushToOppStack(name)
                            }else{
                                calculator.pushToDisplayValue(name)
                            }
                            
                        }, label: {
                            Text("\(name)")
                                .bold().frame(width: 74, height: 74)
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .background(name == "x" ? Color.orange : Color.gray)
                                .cornerRadius(37)
                        })
                    }
                }
                HStack{
                    let row:[String] = ["4", "5", "6", "-"]
                    ForEach(row, id:  \.self) { name in
                        Button(action: {
                            if name == row.last{
                                calculator.pushToOppStack(name)
                            }else{
                                calculator.pushToDisplayValue(name)
                            }
                        }, label: {
                            Text("\(name)")
                                .bold().frame(width: 74, height: 74)
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .background(name == "-" ? Color.orange : Color.gray)
                                .cornerRadius(37)
                        })
                    }
                }
                HStack{
                    let row:[String] = ["7", "8", "9", "+"]
                    ForEach(row, id:  \.self) { name in
                        Button(action: {
                            if name == row.last{
                                calculator.pushToOppStack(name)
                            }else{
                                calculator.pushToDisplayValue(name)
                            }
                        }, label: {
                            Text("\(name)")
                                .bold().frame(width: 74, height: 74)
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .background(name == "+" ? Color.orange : Color.gray)
                                .cornerRadius(37)
                        })
                    }
                }
                HStack{
                    let row:[String] = ["0", ".", "="]
                    ForEach(row, id:  \.self) { name in
                        Button(action: {
                            if name == row.last{
                                calculator.runOperation()
                            }else{
                                calculator.pushToDisplayValue(name)
                            }
                        }, label: {
                            Text("\(name)")
                                .bold().frame(width: name ==  "0" ? 148 :  74, height: 74)
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .background(name == "=" ? Color.orange : Color.gray)
                                .cornerRadius(37)
                        })
                    }
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
