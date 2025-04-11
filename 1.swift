func findMaxSum(_ s: String) -> String {
    var maxSum = 0
    var result = ""
    var currentSum = 0
    var currentSub = ""
    var hasDigits = false
    
    for char in s {
        if char.isNumber {
            hasDigits = true
            currentSub.append(char)
            currentSum += Int(String(char)) ?? 0
        } else {
            if !currentSub.isEmpty {
                if currentSum > maxSum {
                    maxSum = currentSum
                    result = currentSub
                }
                currentSub = ""
                currentSum = 0
            }
        }
    }
    
    if !currentSub.isEmpty && currentSum > maxSum {
        result = currentSub
    }
    
    return hasDigits ? result : "В строке нет цифр"
}

// Тестовые примеры
print(findMaxSum("abc1234def56gh789")) // "789"
print(findMaxSum("a1b2"))              // "2"
print(findMaxSum("HelloWorld!"))       // "В строке нет цифр"
