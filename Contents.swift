import UIKit
import Foundation

enum CalculatorError: Error, CustomStringConvertible {
    case divideByZero
    case invalidOperator
    
    var description: String {
        switch self {
        case .divideByZero:
            return "0으로는 나눌 수 없음"
        case .invalidOperator:
            return "지원하지 않는 연산자"
        }
    }
}

protocol Operation {
    var symbol: String { get }
    func execute(_ lhs: Double, _ rhs: Double) throws -> Double
}

struct AddOperation: Operation {
    let symbol = "+"
    func execute(_ lhs: Double, _ rhs: Double) -> Double {
        lhs + rhs
    }
}

struct SubtractOperation: Operation {
    let symbol = "-"
    func execute(_ lhs: Double, _ rhs: Double) -> Double {
        lhs - rhs
    }
}

struct MultiplyOperation: Operation {
    let symbol = "*"
    func execute(_ lhs: Double, _ rhs: Double) -> Double {
        lhs * rhs
    }
}

struct DivideOperation: Operation {
    let symbol = "/"
    func execute(_ lhs: Double, _ rhs: Double) throws -> Double {
        guard rhs != 0 else {
            throw CalculatorError.divideByZero
        }
        return lhs / rhs
    }
}

struct ModuloOperation: Operation {
    let symbol = "%"
    func execute(_ lhs: Double, _ rhs: Double) throws -> Double {
        guard rhs != 0 else {
            throw CalculatorError.divideByZero
        }
        return lhs.truncatingRemainder(dividingBy: rhs)
    }
}

final class Calculator {
    private var operations: [String: any Operation] = [:]
    
    init(_ operations: [any Operation]) {
        for op in operations {
            self.operations[op.symbol] = op
        }
    }
    
    func calculate(op symbol: String, _ lhs: Double, _ rhs: Double) throws -> Double {
        guard let operation = operations[symbol] else {
            throw CalculatorError.invalidOperator
        }
        return try operation.execute(lhs, rhs)
    }
}

let calculator = Calculator([
    AddOperation(),
    SubtractOperation(),
    MultiplyOperation(),
    DivideOperation(),
    ModuloOperation()
])

do {
    print("덧셈 결과: \(try calculator.calculate(op: "+", 10, 5))")
    print("나눗셈 결과: \(try calculator.calculate(op: "/", 10, 2))")
    print("뺄셈 결과: \(try calculator.calculate(op: "-", 10, 2))")
    print("곱셈 결과: \(try calculator.calculate(op: "*", 3, 3))")
    print("나머지 결과: \(try calculator.calculate(op: "%", 7, 4))")
    
    print("예외 테스트: \(try calculator.calculate(op: "/", 10, 0))")
    
} catch let error as CalculatorError {
    print(error.description)
}
