<?php

function findMaxSum($s) {
    $maxSum = 0;
    $result = "";
    $currentSum = 0;
    $currentSub = "";

    for ($i = 0; $i < strlen($s); $i++) {
        $c = $s[$i];
        if (ctype_digit($c)) {
            $currentSub .= $c;
            $currentSum += intval($c);
        } else {
            if ($currentSub !== "") {
                if ($currentSum > $maxSum) {
                    $maxSum = $currentSum;
                    $result = $currentSub;
                }
                $currentSub = "";
                $currentSum = 0;
            }
        }
    }

    // Проверяем последнюю подстроку
    if ($currentSub !== "" && $currentSum > $maxSum) {
        $result = $currentSub;
    }

    return $result;
}

echo "Введите строку: ";
$input = trim(fgets(STDIN));

$result = findMaxSum($input);

if ($result === "") {
    echo "В строке нет цифр\n";
} else {
    echo "Подстрока с максимальной суммой цифр: " . $result . "\n";
}

?>
