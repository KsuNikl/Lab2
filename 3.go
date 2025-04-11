package main

import "fmt"

// Функция для реверса цифр числа
func reverseNumber(num int) int {
    reversed := 0
    for n := num; n > 0; n /= 10 {
        reversed = reversed*10 + n%10
    }
    return reversed
}

func main() {
    var n int
    fmt.Print("Введите количество чисел: ")
    fmt.Scan(&n)

    fmt.Print("Введите числа: ")
    for i := 0; i < n; i++ {
        var num int
        fmt.Scan(&num) // Чтение каждого числа по отдельности

        reversed := reverseNumber(num)
        difference := num - reversed
        if difference < 0 {
            difference = -difference
        }

        fmt.Printf("|%d - %d| = %d\n", num, reversed, difference)
    }
}
