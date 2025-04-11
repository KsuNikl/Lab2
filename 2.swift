import Foundation

func main() {
    let n = 3
    let flowers = [2, 2, 3]
    let capacity = 5
    
    var steps = 0
    var currentPos = -1
    var currentWater = capacity
    
    for i in 0..<n {
        steps += abs(i - currentPos)
        currentPos = i
        currentWater -= flowers[i]
        
        if i < n - 1 && currentWater < flowers[i + 1] {
            steps += abs(currentPos - (-1))
            currentPos = -1
            currentWater = capacity
        }
    }
    
    print("Результат:", steps) // Вывод: 7
}

main()
