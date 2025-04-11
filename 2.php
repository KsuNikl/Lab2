<?php
// Чтение входных данных
$n = intval(trim(fgets(STDIN)));
$flowersStr = trim(fgets(STDIN));
$capacity = intval(trim(fgets(STDIN)));

// Обработка строки с цветами: заменяем запятые, разбиваем на массив и обрезаем до n элементов
$flowersStr = str_replace(',', ' ', $flowersStr);
$flowers = array_map('intval', preg_split('/\s+/', $flowersStr, -1, PREG_SPLIT_NO_EMPTY));
$flowers = array_slice($flowers, 0, $n); // Фиксируем длину массива

// Инициализация переменных
$steps = 0;
$currentPos = -1; // Начальная позиция у реки
$currentWater = $capacity;

for ($i = 0; $i < $n; $i++) {
    // Шаги до текущего цветка
    $steps += abs($i - $currentPos);
    $currentPos = $i;
    
    // Поливаем цветок
    $currentWater -= $flowers[$i];
    
    // Проверяем необходимость возврата к реке
    if ($i < $n - 1 && $currentWater < $flowers[$i + 1]) {
        $steps += ($currentPos - (-1)); // Шаги до реки
        $currentPos = -1;
        $currentWater = $capacity; // Наполняем лейку
    }
}
echo $steps . PHP_EOL;
?>
