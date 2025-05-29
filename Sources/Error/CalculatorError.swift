//
//  CalculatorError.swift
//  
//
//  Created by 노가현 on 5/28/25.
//

import Foundation

// 동작할 때 발생할 수 있는 오류 두 갱 !!
public enum CalculatorError: Error, CustomStringConvertible {
    case divideByZero    // 0으로 나누기 시도
    case invalidOperator // 지원하지 않는 연산자
    
    public var description: String {
        switch self {
        case .divideByZero:
            return "0으로는 나눌 수 없음"
        case .invalidOperator:
            return "지원하지 않는 연산자"
        }
    }
}
