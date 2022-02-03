//
//  ButtonNames.swift
//  Calculator
//
//  Created by Henrique Cruz Neto on 02/02/22.
//

import Foundation
import SwiftUI

enum ButtonNames: String{
    case zero = "0"
    case one  = "1"
    case two  = "2"
    case three  = "3"
    case four  = "4"
    case five  = "5"
    case six  = "6"
    case seven  = "7"
    case eight  = "8"
    case nine  = "9"
    case clear = "AC"
    case signal = "+-"
    case percent = "%"
    case division  = "÷"
    case multi = "x"
    case minus = "-"
    case plus = "+"
    case equals  = "="
    case dot = "."
    
    var  btnColor : Color {
        switch self {
            case .clear, .signal, .percent:
                return .gray
            case .division, .multi, .minus, .plus, .equals:
                return .orange
            default:
                return Color(UIColor(red: 55.0/255.0, green: 55.0/255.0, blue: 55.0/255.0, alpha: 1.0))
        }
        
    }
}
