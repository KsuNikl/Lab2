fun reverseNumber(num: Int): Int {
    var reversed = 0
    var n = num
    while (n > 0) {
        reversed = reversed * 10 + n % 10
        n /= 10
    }
    return reversed
}
fun main() {
    print("Введите количество чисел: ")
    val n = readln().toInt()
    
    print("Введите числа через пробел: ")
    val numbers = readln()
        .split(" ")
        .map { it.toInt() }
        .take(n)
    
    println("Результаты:")
    numbers.forEach { number ->
        val reversed = reverseNumber(number)
        val difference = kotlin.math.abs(number - reversed)
        println("|$number - $reversed| = $difference")
    }
}
