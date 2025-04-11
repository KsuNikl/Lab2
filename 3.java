import java.util.Scanner;

public class ReverseDifference {
    // Функция для реверса цифр числа
    public static int reverseNumber(int num) {
        int reversed = 0;
        while (num > 0) {
            reversed = reversed * 10 + num % 10;
            num /= 10;
        }
        return reversed;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        // Ввод количества чисел
        System.out.print("Введите количество чисел: ");
        int n = scanner.nextInt();
        
        // Обработка каждого числа
        for (int i = 0; i < n; i++) {
            System.out.print("Введите число #" + (i + 1) + ": ");
            int number = scanner.nextInt();
            int reversed = reverseNumber(number);
            int difference = Math.abs(number - reversed);
            
            // Форматированный вывод
            System.out.printf("|%d - %d| = %d%n", number, reversed, difference);
        }
        
        scanner.close();
    }
}
