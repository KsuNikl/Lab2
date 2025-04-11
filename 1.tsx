function findMaxSum(s: string): string {
    let maxSum = 0;
    let result = '';
    let currentSum = 0;
    let currentSub = '';
    let hasDigits = false;
    for (const char of s) {
        if (/\d/.test(char)) {
            hasDigits = true;
            currentSub += char;
            currentSum += parseInt(char, 10);
        } else {
            // Обрабатываем текущую группу цифр при встрече не-цифры
            if (currentSub.length > 0) {
                if (currentSum > maxSum) {
                    maxSum = currentSum;
                    result = currentSub;
                }
                currentSub = '';
                currentSum = 0;
            }
        }
    }
    // Проверяем последнюю группу цифр в конце строки
    if (currentSub.length > 0) {
        if (currentSum > maxSum) {
            result = currentSub;
        }
    }
    return hasDigits ? result : 'В строке нет цифр';
}
// Тесты
console.log(findMaxSum("abc1234def56gh789")); // "789"
console.log(findMaxSum("a1b22c333d4444"));    // "4444"
console.log(findMaxSum("HelloWorld!"));       // "В строке нет цифр"
console.log(findMaxSum("a1b2"));              // "2"
console.log(findMaxSum("12a34"));             // "34"
console.log(findMaxSum("9"));                 // "9"
