package main
import (
  "bufio"
  "fmt"
  "os"
  "strings"
  "unicode"
)
func findMaxSum(s string) string {
  var (
    maxSum     int
    result     string
    currentSum int
    currentSub []rune
  )
  for _, c := range s {
    if unicode.IsDigit(c) {
      currentSub = append(currentSub, c)
      currentSum += int(c - '0')
    } else {
      if len(currentSub) > 0 {
        if currentSum > maxSum {
          maxSum = currentSum
          result = string(currentSub)
        }
        currentSub = nil
        currentSum = 0
      }
    }
  }
  // Проверяем последнюю подстроку
  if len(currentSub) > 0 {
    if currentSum > maxSum {
      result = string(currentSub)
    }
  }
  return result
}
func main() {
  fmt.Print("Введите строку: ")
  reader := bufio.NewReader(os.Stdin)
  input, _ := reader.ReadString('\n')
  input = strings.TrimRight(input, "\r\n") // Убираем все пробелы и управляющие символы в конце
  result := findMaxSum(input)
  if result == "" {
    fmt.Println("В строке нет цифр")
  } else {
    fmt.Printf("Подстрока с максимальной суммой цифр: %s\n", result)
  }
}
