#include <iostream>
#include <string>
#include <locale.h>
using namespace std;
string findMaxSum(const string& s) { //Создаём функцию для поиска макс суммы в строке
    int max_sum = 0; //макс сумма
    string result = ""; //строка с найденной последовательностью чисел с макс суммой
    int current_sum = 0; //текущая сумма
    string current_sub = ""; //текущая строка с последовательностью чисел

    for (char c : s) { //проверка каждого символа
        if (isdigit(c)) { //если символ является числом, добавляем его в текущую строку и сумму
            current_sub += c;
            current_sum += c - '0';
        }
        else { //иначе проверяем, не пуста ли текущая строка
            if (!current_sub.empty()) { //если текущая строка не пуста, сравниваем макс и текущую сумму
                if (current_sum > max_sum) { //если текущая сумма больше макс, то обновляем макс сумму и строку-результат
                    max_sum = current_sum;
                    result = current_sub;
                }
                current_sub.clear(); //очищаем текущую строку и сумму
                current_sum = 0;
            }
        }
    }
    // Проверяем последнюю подстроку после завершения цикла
    if (!current_sub.empty() && current_sum > max_sum) {
        result = current_sub;
    }

    return result;
}
int main() {
    setlocale(LC_ALL, "rus");
    string input;
    cout << "Введите строку: ";
    getline(cin, input); // Считываем всю строку, включая пробелы

    string result = findMaxSum(input);

    if (result.empty()) {
        cout << "В строке нет цифр" << endl;
    }
    else {
        cout << "Подстрока с максимальной суммой цифр: " << result << endl;
    }

    return 0;
}
