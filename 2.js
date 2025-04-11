function calculateWateringSteps(n, flowers, capacity) {
    let steps = 0;
    let currentPos = -1; // Начинаем у реки (-1)
    let currentWater = capacity;

    for (let i = 0; i < n; i++) {
        // Шаги до текущего цветка
        steps += Math.abs(i - currentPos);
        currentPos = i;

        let remaining = flowers[i];
        while (remaining > 0) {
            const waterToUse = Math.min(currentWater, remaining);
            remaining -= waterToUse;
            currentWater -= waterToUse;

            // Проверка необходимости возврата к реке
            const needsRefill = remaining > 0  (i < n - 1 && currentWater < flowers[i + 1]);
            if (needsRefill) {
                steps += Math.abs(currentPos - (-1)); // Шаги до реки
                currentPos = -1;
                currentWater = capacity; // Наполняем лейку
            }
        }
    }

    return steps;
}

// Пример использования
console.log(calculateWateringSteps(3, [2, 2, 3], 5)); // Вывод: 7
console.log(calculateWateringSteps(6, [1,1,1,4,2,3], 4)); // Вывод: 30
console.log(calculateWateringSteps(7, [7,7,7,7,7,7,7], 8)); // Вывод: 49
