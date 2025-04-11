import Foundation

// Функция для реверса цифр числа
func reverseNumber(_ num: Int) -> Int {
    var reversed = 0
    var n = num
    while n > 0 {
        reversed = reversed * 10 + n % 10
        n /= 10
    }
    return reversed
}

// Основная программа
print("Введите количество чисел:")
guard let n = Int(readLine() ?? "") else {
    fatalError("Ошибка ввода количества чисел")
}

var results = [(original: Int, reversed: Int)]()
for i in 1...n {
    print("Введите число #\(i):")
    guard let num = Int(readLine() ?? "") else {
        fatalError("Ошибка ввода числа")
    }
    
    let reversed = reverseNumber(num)
    results.append((num, reversed))
}

print("\nРезультаты:")
for (num, rev) in results {
    let diff = abs(num - rev)
    print("|\(num) - \(rev)| = \(diff)")
}
