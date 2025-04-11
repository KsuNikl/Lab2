#include <iostream>
#include <vector>
#include <sstream>
#include <string>

using namespace std;

int main() {
    int n;
    cin >> n;
    cin.ignore(); // Игнорируем символ новой строки после n

    string flowersStr;
    getline(cin, flowersStr);

    // Заменяем запятые на пробелы для удобства парсинга
    for (char& c : flowersStr) {
        if (c == ',') c = ' ';
    }

    vector<int> flowers(n);
    stringstream ss(flowersStr);
    for (int i = 0; i < n; ++i) {
        ss >> flowers[i];
    }

    int capacity;
    cin >> capacity;

    int steps = 0;
    int currentPos = -1;
    int currentWater = capacity;

    for (int i = 0; i < n; ++i) {
        // Перемещаемся к текущему цветку
        steps += abs(i - currentPos);
        currentPos = i;

        // Поливаем цветок
        currentWater -= flowers[i];
// Проверяем, нужно ли возвращаться к реке
        if (i != n - 1) {
            if (currentWater < flowers[i + 1]) {
                // Возвращаемся к реке
                steps += (currentPos - (-1)); // Расстояние от текущей позиции до реки
                currentPos = -1;
                currentWater = capacity; // Наполняем лейку
            }
        }
    }

    cout << steps << endl;

    return 0;
}
