using System;

class Program
{
    // Функция для реверса цифр числа
    static int ReverseNumber(int num)
    {
        int reversed = 0;
        while (num > 0)
        {
            reversed = reversed * 10 + num % 10;
            num /= 10;
        }
        return reversed;
    }

    static void Main()
    {
        Console.Write("Введите количество чисел: ");
        int n = int.Parse(Console.ReadLine());
        
        Console.Write("Введите числа через пробел: ");
        string[] input = Console.ReadLine().Split();
        
        Console.WriteLine("Результаты:");
        for (int i = 0; i < n && i < input.Length; i++)
        {
            int number = int.Parse(input[i]);
            int reversed = ReverseNumber(number);
            int difference = Math.Abs(number - reversed);
            Console.WriteLine($"|{number} - {reversed}| = {difference}");
        }
    }
}
