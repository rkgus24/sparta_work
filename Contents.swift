import Foundation

let calculator = Calculator(with: [
    AddOperation(),
    SubtractOperation(),
    MultiplyOperation(),
    DivideOperation(),
    ModuloOperation()
])

let testCases: [(String, Double, Double)] = [
    ("+", 10, 5),
    ("-", 10, 2),
    ("*", 10, 2),
    ("/", 10, 0),
    ("%", 10, 0)
]

for (op, a, b) in testCases {
    do {
        let result = try calculator.calculate(symbol: op, lhs: a, rhs: b)
        print("\(a) \(op) \(b) = \(result)")
    } catch let error as CalculatorError {
        print("오류 (\(a) \(op) \(b)) -> \(error.description)")
    }
}
