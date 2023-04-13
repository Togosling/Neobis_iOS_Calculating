//
//  Calculator.swift
//  Neobis_iOS_Calculating
//
//  Created by Тагай Абдылдаев on 13/4/23.
//

import Foundation


struct Calculator {
    
    var left: Float
    var right: Float
    var operation: Operation
    
    func calculate() -> Float {
        switch operation {
        case .plus:
            return left + right
        case .minus:
            return left - right
        case .multiply:
            return left * right
        case .divide:
            return left / right
        }
    }
}

enum Operation {
    case plus, minus, multiply, divide
    
}
