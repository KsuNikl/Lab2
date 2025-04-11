use std::io;
fn main() {
    // Чтение количества цветов
    let n: usize = read_line().trim().parse().expect("Invalid number");
    // Чтение и обработка строки с потребностями цветов
    let flowers_str = read_line().replace(',', " ");
    let mut flowers: Vec<i32> = flowers_str
        .split_whitespace()
        .map(|s| s.parse().expect("Invalid number"))
        .collect();
    flowers.truncate(n); // Обрезаем до n элементов

    // Чтение вместимости лейки
    let capacity: i32 = read_line().trim().parse().expect("Invalid number");

    let mut steps = 0;
    let mut current_pos = -1; // Начинаем у реки (-1)
    let mut current_water = capacity;

    for i in 0..n {
        // Шаги до текущего цветка
        steps += (i as i32 - current_pos).abs();
        current_pos = i as i32;

        // Поливаем цветок
        current_water -= flowers[i];

        // Проверяем необходимость возврата к реке
        if i < n - 1 && current_water < flowers[i + 1] {
            steps += (current_pos - (-1)).abs(); // Шаги до реки
            current_pos = -1;
            current_water = capacity; // Наполняем лейку
        }
    }

    println!("{}", steps);
}

// Вспомогательная функция для чтения строки из stdin
fn read_line() -> String {
    let mut line = String::new();
    io::stdin().read_line(&mut line).expect("Failed to read line");
    line
}

