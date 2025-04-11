function reverseNumber(num: number): number {
    let reversed = 0;
    let n = num;
    while (n > 0) {
        reversed = reversed * 10 + n % 10;
        n = Math.floor(n / 10);
    }
    return reversed;
}
// Пример использования без консольного ввода (чистые числа)
const inputNumbers = [123, 400];
console.log("Результаты:");
inputNumbers.forEach(num => {
    const reversed = reverseNumber(num);
    const difference = Math.abs(num - reversed);
    console.log(|${num} - ${reversed}| = ${difference});
});

// Вывод:
// |123 - 321| = 198
// |400 - 4| = 396
