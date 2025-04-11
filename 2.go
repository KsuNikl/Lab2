package main
import (
  "bufio"
  "fmt"
  "os"
  "strconv"
  "strings"
)
func main() {
  scanner := bufio.NewScanner(os.Stdin)
  // Чтение количества цветов
  scanner.Scan()
  n, _ := strconv.Atoi(scanner.Text())
  // Чтение и обработка строки с потребностями цветов
  scanner.Scan()
  flowersStr := strings.ReplaceAll(scanner.Text(), ",", " ") // Исправлено здесь
  flowers := make([]int, n)
  parts := strings.Fields(flowersStr)
  // Проверка длины введенных данных
  if len(parts) < n {
    panic("Not enough flowers data")
  }
  for i := 0; i < n; i++ {
    flowers[i], _ = strconv.Atoi(parts[i])
  }
  // Чтение вместимости лейки
  scanner.Scan()
  capacity, _ := strconv.Atoi(scanner.Text())
  steps := 0
  currentPos := -1
  currentWater := capacity
  for i := 0; i < n; i++ {
    steps += abs(i - currentPos)
    currentPos = i
    currentWater -= flowers[i]
    if i < n-1 && currentWater < flowers[i+1] {
      steps += abs(currentPos - (-1))
      currentPos = -1
      currentWater = capacity
    }
  }
  fmt.Println(steps)
}
func abs(x int) int {
  if x < 0 {
    return -x
  }
  return x
}

