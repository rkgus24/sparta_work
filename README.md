## Swift로 Calculator 구현하기

### 기능 요약

| 기능 | 설명 |
|------|------|
| 덧셈 | `AddOperation` |
| 뺄셈 | `SubtractOperation` |
| 곱셈 | `MultiplyOperation` |
| 나눗셈 | `DivideOperation`, 0 나눗셈 예외 처리 포함 |
| 나머지 | `ModuloOperation`, `truncatingRemainder` 사용 |
| 에러 처리 | divideByZero, invalidOperator |

<br>

### 파일 구조

```
Ccalculator/ (Contents.swift) // 메인 클래스
└── Sources/
    ├── Calculator.swift // 연산 객체 등록, 실행
    ├── Errors/
    │   └── CalculatorError.swift // 오류 정의
    └── Operations/
        ├── Operation.swift // 연산 프로토콜
        ├── AddOperation.swift // 더하기 연산
        ├── SubtractOperation.swift // 빼기 연산
        ├── MultiplyOperation.swift // 곱하기 연산
        ├── DivideOperation.swift // 나누기 연산
        └── ModuloOperation.swift  // 나머지 연산
```

<br>

### 아키텍처 구조

```swift
protocol Operation {
    var symbol: String { get }
    func execute(_ lhs: Double, _ rhs: Double) throws -> Double
}
```

#### Calculator ---> symbol --- > Operation ---> Add / Sub / Mul / Div

