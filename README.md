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

- 덧셈, 뺄셈, 곱셈, 나눗셈, 나머지 연산
- 프로토콜 기반으로 연산 기능 추상화
- 연산 중에 발생 가능한 예외 처리

<br>

### 서비스 구조
- Operation 프로토콜을 채택한 연산 클래스를 사용함
- 사용자가 연산자 symbol이랑 값 두 개를 입력하게 되면 적절한 Operation 객체를 찾아서 연산하도록 함
- 오류가 생기면 CalculatorError 열거를 통해서 예외 처리를 하도록 함

<br>

### API 명세서
1. init(with:)
   Calculator 클래스 초기화
2. calculate(symbol:lhs:rhs:)
   연산자 symbol에 맞는 연산 수행하고 결과 반환
   잘못된 연산 -> CalculatorError
   

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

