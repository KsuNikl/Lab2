using System;
using System.Linq;

class Program
{
    static void Main()
    {
        int n = int.Parse(Console.ReadLine());
        string flowersStr = Console.ReadLine().Replace(',', ' ');
        int[] flowers = flowersStr.Split(new[] {' '}, StringSplitOptions.RemoveEmptyEntries)
                                  .Select(int.Parse)
                                  .ToArray();
        int capacity = int.Parse(Console.ReadLine());
        
        int steps = 0;
        int currentPos = -1; // Начинаем у реки
        int currentWater = capacity;

        for (int i = 0; i < n; i++)
        {
            // Перемещение к текущему цветку
            steps += Math.Abs(i - currentPos);
            currentPos = i;

            // Полив цветка
            currentWater -= flowers[i];

            // Проверка необходимости возврата к реке
            if (i != n - 1 && currentWater < flowers[i + 1])
            {
                steps += currentPos - (-1); // Шаги до реки
                currentPos = -1;
                currentWater = capacity; // Наполняем лейку
            }
        }

        Console.WriteLine(steps);
    }
}
