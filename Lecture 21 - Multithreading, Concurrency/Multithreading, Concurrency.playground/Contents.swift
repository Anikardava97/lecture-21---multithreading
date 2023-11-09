import Foundation
typealias BigInt = _BigInt<UInt>

func generateNumbers() -> (BigInt, BigInt) {
    let firstRandomNumber = BigInt(Int.random(in: 20...50))
    let secondRandomNumber = BigInt(Int.random(in: 20...50))
    return (firstRandomNumber, secondRandomNumber)
}

let (firstNumber, secondNumber) = generateNumbers()
print(firstNumber, secondNumber)

func factorial(n: BigInt) -> BigInt {
    n < 2 ? 1: n * factorial(n: n - 1)
}

func calculateFactorial(number: BigInt) -> BigInt {
    factorial(n: number)
}

func calculateFirstNumberFactorial() async -> BigInt {
    calculateFactorial(number: firstNumber)
}

func calculateSecondNumberFactorial() async -> BigInt {
    calculateFactorial(number: secondNumber)
}

func IdentifyWinnerThread() async {
    let startFirstTask = Date()
    let firstTask = await calculateFirstNumberFactorial()
    let firstDuration = Date().timeIntervalSince(startFirstTask)
    
    let startSecondTask = Date()
    let secondTask = await calculateSecondNumberFactorial()
    let secondDuration = Date().timeIntervalSince(startSecondTask)
    
    if firstDuration < secondDuration {
        print("Winner thread: First Number \(firstNumber), with factorial: \(firstTask), finished in \(firstDuration)")
    } else if firstDuration > secondDuration {
        print("Winner thread: Second Number \(secondNumber), with factorial: \(secondTask), finished in \(secondDuration)")
    } else {
        print("Both threads finished simultaneously. There's no winner :(")
    }
}

Task {
    await IdentifyWinnerThread()
}

