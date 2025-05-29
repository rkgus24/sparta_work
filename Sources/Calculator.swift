//
//  Calculator.swift
//
//
//  Created by 노가현 on 5/28/25.
//

import Foundation

// 연산을 관리, 실행하는 클래스
public final class Calculator {
    // 연산자 symbol, 연산 객체 매핑
    private var operations: [String: any Operation] = [:]
    
    // 초기화 하고 나서 사용할 연산 등록
    public init(with operations: [any Operation]) {
        for operation in operations {
            self.operations[operation.symbol] = operation
        }
    }
    
    // symbol : 연산자 기호
    // lhs : leftNumber
    // rhs : rightNumber
    // Throws : 발생한 오류
    // Returns : 결과 값
    public func calculate(symbol: String, lhs: Double, rhs: Double) throws -> Double {
        guard let operation = operations[symbol] else {
            throw CalculatorError.invalidOperator
        }
        return try operation.execute(lhs, rhs)
    }
}
