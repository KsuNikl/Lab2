#include <iostream>
#include <locale.h>
using namespace std;

// Функция для реверса цифр числа
int reverse_number(int num) {
    int reversed = 0;
    while (num > 0) {
        reversed = reversed * 10 + num % 10; // Добавляем последнюю цифру исходного числа
        num /= 10; // Убираем последнюю цифру
    }
    return reversed;
}

int main() {
    setlocale(LC_ALL, "rus");
    int n;
    // Ввод количества чисел
    cout << "Введите количество чисел (N): ";
    cin >> n;

    // Ввод чисел и обработка
    cout << "Введите " << n << " натуральных чисел через пробел: ";
    for (int i = 0; i < n; ++i) {
        int number;
        cin >> number;

        int reversed = reverse_number(number);
        int difference = number - reversed;

        // Ручной расчет модуля разности
        int absolute = (difference < 0) ? -difference : difference;

        cout << "|" << number << " - " << reversed << "| = "
            << absolute << endl;
    }

    return 0;
}
