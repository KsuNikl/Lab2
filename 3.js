// Функция для реверса цифр числа
function reverseNumber(num) {
    let reversed = 0;
    for (let n = num; n > 0; n = Math.floor(n / 10)) {
        reversed = reversed * 10 + n % 10;
    }
    return reversed;
}

// Основная функция с красивым выводом
function calculateDifferences(...numbers) {
    console.log("Результаты:");
    numbers.forEach(num => {
        const reversed = reverseNumber(num);
        const diff = Math.abs(num - reversed);
        console.log(|${num} - ${reversed}| = ${diff});
    });
}

// Пример использования
calculateDifferences(123, 400);
