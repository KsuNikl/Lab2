import java.util.Scanner

fun main() {
    val scanner = Scanner(System.in)
    val n = scanner.nextInt()
    scanner.nextLine() // Очистка буфера
    
    var flowersStr = scanner.nextLine()
    flowersStr = flowersStr.replace(",", " ") // Заменяем запятые на пробелы
    
    val flowers = flowersStr.trim().split("\\s+".toRegex()).map { it.toInt() }
    val capacity = scanner.nextInt()
    
    var steps = 0
    var currentPos = -1 // Начинаем у реки
    var currentWater = capacity
    
    for (i in 0 until n) {
        // Перемещение к текущему цветку
        steps += Math.abs(i - currentPos)
        currentPos = i
        
        // Полив цветка
        currentWater -= flowers[i]
        
        // Проверка необходимости возврата к реке
        if (i != n - 1) {
            if (currentWater < flowers[i + 1]) {
                // Возвращаемся к реке
                steps += (currentPos - (-1)) // Расстояние до реки
                currentPos = -1
                currentWater = capacity // Наполняем лейку
            }
        }
    }
    
    println(steps)
}
