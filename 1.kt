fun findMaxSum(s: String): String {
    var maxSum = 0
    var result = ""
    var currentSum = 0
    val currentSub = StringBuilder()

    for (c in s) {
        if (c.isDigit()) {
            currentSub.append(c)
            currentSum += c.toString().toInt()
        } else {
            if (currentSub.isNotEmpty()) {
                if (currentSum > maxSum) {
                    maxSum = currentSum
                    result = currentSub.toString()
                }
                currentSub.clear()
                currentSum = 0
            }
        }
    }

    // Проверяем последнюю подстроку
    if (currentSub.isNotEmpty() && currentSum > maxSum) {
        result = currentSub.toString()
    }

    return result
}

fun main() {
    print("Введите строку: ")
    val input = readLine() ?: ""
    
    val result = findMaxSum(input)
    
    println(
        if (result.isEmpty()) "В строке нет цифр"
        else "Подстрока с максимальной суммой цифр: $result"
    )
}
