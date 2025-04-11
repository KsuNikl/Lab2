use std::io;

// Функция для реверса цифр числа
fn reverse_number(num: i32) -> i32 {
    let mut reversed = 0;
    let mut n = num;
    while n > 0 {
        reversed = reversed * 10 + n % 10;
        n /= 10;
    }
    reversed
}

fn main() {
    // Чтение количества чисел
    println!("Введите количество чисел:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Ошибка чтения");
    let n: usize = input.trim().parse().expect("Ожидается число");

    // Чтение чисел
    println!("Введите числа через пробел:");
    input.clear();
    io::stdin().read_line(&mut input).expect("Ошибка чтения");
    
    // Обработка и вывод результатов
    println!("Результаты:");
    input
        .split_whitespace()
        .take(n)
        .map(|s| s.parse::<i32>().expect("Ожидается число"))
        .for_each(|num| {
            let reversed = reverse_number(num);
            let difference = (num - reversed).abs();
            println!("|{} - {}| = {}", num, reversed, difference);
        });
}
