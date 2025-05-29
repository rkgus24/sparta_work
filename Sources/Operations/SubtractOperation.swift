//
//  SubtractOperation.swift
//  
//
//  Created by 노가현 on 5/28/25.
//

import Foundation

// 뺄셈
public struct SubtractOperation: Operation {
    public let symbol = "-"
    public init() {}
    
    public func execute(_ lhs: Double, _ rhs: Double) -> Double {
        lhs - rhs
    }
}
