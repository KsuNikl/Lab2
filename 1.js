function findMaxSum(s) {
    let maxSum = 0;
    let result = '';
    let currentSum = 0;
    let currentSub = '';
    let hasDigits = false;

    for (const char of s) {
        if (/\d/.test(char)) {
            hasDigits = true;
            currentSub += char;
            currentSum += Number(char);
        } else {
            if (currentSub) {
                if (currentSum > maxSum) {
                    maxSum = currentSum;
                    result = currentSub;
                }
                currentSub = '';
                currentSum = 0;
            }
        }
    }
// Проверяем последнюю подстроку
    if (currentSub) {
        if (currentSum > maxSum) {
            result = currentSub;
        }
    }

    return hasDigits ? result : 'В строке нет цифр';
}

// Примеры использования
console.log(findMaxSum("abc1234def56gh789")); // "789" (сумма 24)
console.log(findMaxSum("a1b22c333d4444"));    // "4444" (сумма 16)
console.log(findMaxSum("HelloWorld!"));       // "В строке нет цифр!"
