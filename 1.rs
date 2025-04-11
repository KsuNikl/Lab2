use std::io;
fn find_max_sum(s: &str) -> String {
    let mut max_sum = 0;
    let mut result = String::new();
    let mut current_sum = 0;
    let mut current_sub = String::new();

    for c in s.chars() {
        if c.is_ascii_digit() {
            current_sub.push(c);
            current_sum += c.to_digit(10).unwrap();
        } else {
            if !current_sub.is_empty() {
                if current_sum > max_sum {
                    max_sum = current_sum;
                    result = current_sub.clone();
                }
                current_sub.clear();
                current_sum = 0;
            }
        }
    }

    // Проверяем последнюю подстроку
    if !current_sub.is_empty() && current_sum > max_sum {
        result = current_sub;
    }

    result
}
fn main() {
    println!("Введите строку: ");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Ошибка ввода");
    let input = input.trim();

    let result = find_max_sum(input);
if result.is_empty() {
        println!("В строке нет цифр");
    } else {
        println!("Подстрока с максимальной суммой цифр: {}", result);
    }
}
