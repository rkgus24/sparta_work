//
//  AppOperation.swift
//  
//
//  Created by 노가현 on 5/28/25.
//

import Foundation

// 덧셈
public struct AddOperation: Operation {
    public let symbol = "+"
    public init() {}

    public func execute(_ lhs: Double, _ rhs: Double) -> Double {
        return lhs + rhs
    }
}
