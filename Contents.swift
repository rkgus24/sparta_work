import UIKit

enum CalculatorError: Error, CustomStringConvertible {
    case divideByZero
    case invalidOperator
    
    var description: String {
        switch self {
        case .divideByZero: return "0으로는 나눌 수 없음"
        case .invalidOperator: return "지원하지 않는 연산자"
        }
    }
}

class Calculator {
    func calculate(op: String, _ a: Double, _ b: Double) throws -> Double {
        guard b != 0 || !["/", "%"].contains(op) else {
            throw CalculatorError.divideByZero
        }
        
        switch op {
        case "+": return a + b
        case "-": return a - b
        case "*": return a * b
        case "/": return a / b
        case "%": return a.truncatingRemainder(dividingBy: b)
        default:  throw CalculatorError.invalidOperator
        }
    }
}

let calc = Calculator()

do {
    print("덧셈 : \(try calc.calculate(op: "+", 10, 5))")
    print("나눗셈 : \(try calc.calculate(op: "/", 10, 2))")
    print("나머지 : \(try calc.calculate(op: "%", 5, 3))")
    
    // 예외 테스트
    print("예외 테스트 : \(try calc.calculate(op: "%", 5, 0))")
    
} catch let error as CalculatorError {
    print("오류: \(error.description)")
}
