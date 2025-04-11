function calculateWateringSteps(n: number, flowers: number[], capacity: number): number {
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
const n = 3;
const flowers = [2, 2, 3];
const capacity = 5;
console.log(calculateWateringSteps(n, flowers, capacity)); // Вывод: 7
