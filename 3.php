<?php

function reverseNumber($num) {
    $reversed = 0;
    while ($num > 0) {
        $reversed = $reversed * 10 + $num % 10;
        $num = (int)($num / 10);
    }
    return $reversed;
}

// Ввод данных
echo "Введите количество чисел: ";
$n = intval(trim(fgets(STDIN)));

echo "Введите числа через пробел: ";
$input = trim(fgets(STDIN));
$numbers = explode(' ', $input);
$numbers = array_slice($numbers, 0, $n); // Обрезаем до нужного количества
echo "Результат: ";
// Обработка и вывод
foreach ($numbers as $numStr) {
    $num = intval($numStr);
    $reversed = reverseNumber($num);
    $difference = abs($num - $reversed);
    echo "|$num - $reversed| = $difference\n";
}

?>
