import UIKit

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

class Calculator {
    func calculate(operator op: String, firstNumber: Double, secondNumber: Double) throws -> Double {
        switch op {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            if secondNumber == 0 {
                throw CalculatorError.divideByZero
            }
            return firstNumber / secondNumber
        case "%":
            if secondNumber == 0 {
                throw CalculatorError.divideByZero
            }
            return firstNumber.truncatingRemainder(dividingBy: secondNumber)
        default:
            throw CalculatorError.invalidOperator
        }
    }
}

let calculator = Calculator()

do {
    let sum = try calculator.calculate(operator: "+", firstNumber: 10, secondNumber: 5)
    print("덧셈 : \(sum)")
    
    let div = try calculator.calculate(operator: "/", firstNumber: 10, secondNumber: 0)
    print("나눗셈 : \(div)")
    
    let remainder = try calculator.calculate(operator: "%", firstNumber: 5, secondNumber: 3)
    print("나머지 : \(remainder)")
    
    let errorTest = try calculator.calculate(operator: "%", firstNumber: 5, secondNumber: 0)
        print("예외 테스트 : \(errorTest)")
    
} catch let error as CalculatorError {
    print(error.description)
}
