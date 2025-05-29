//
//  Operation.swift
//  
//
//  Created by 노가현 on 5/28/25.
//

import Foundation

// 연산자 프로토콜
public protocol Operation {
    var symbol: String { get }  // 연산자 기호
    func execute(_ lhs: Double, _ rhs: Double) throws -> Double
}
