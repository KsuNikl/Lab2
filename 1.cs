using System;
using System.Text;

class Program
{
    static string FindMaxSum(string s)
    {
        int maxSum = 0;
        string result = "";
        int currentSum = 0;
        StringBuilder currentSub = new StringBuilder();

        foreach (char c in s)
        {
            if (char.IsDigit(c))
            {
                currentSub.Append(c);
                currentSum += c - '0'; // Преобразуем символ в число
            }
            else
            {
                if (currentSub.Length > 0)
                {
                    if (currentSum > maxSum)
                    {
                        maxSum = currentSum;
                        result = currentSub.ToString();
                    }
                    currentSub.Clear();
                    currentSum = 0;
                }
            }
        }

        // Проверяем последнюю подстроку
        if (currentSub.Length > 0 && currentSum > maxSum)
        {
            result = currentSub.ToString();
        }

        return result;
    }
static void Main()
    {
        Console.Write("Введите строку: ");
        string input = Console.ReadLine() ?? "";
        
        string result = FindMaxSum(input);
        
        Console.WriteLine(
            string.IsNullOrEmpty(result) 
                ? "В строке нет цифр" 
                : $"Подстрока с максимальной суммой цифр: {result}"
        );
    }
}
