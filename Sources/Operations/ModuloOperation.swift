//
//  ModuloOperation.swift
//  
//
//  Created by 노가현 on 5/28/25.
//

import Foundation

// 나머지 (0으로 나누면 오류 발생)
public struct ModuloOperation: Operation {
    public let symbol = "%"
    public init() {}
    
    public func execute(_ lhs: Double, _ rhs: Double) throws -> Double {
        guard rhs != 0 else {
            throw CalculatorError.divideByZero
        }
        return lhs.truncatingRemainder(dividingBy: rhs)
    }
}
