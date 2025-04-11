import java.util.Scanner;

public class MaxDigitSubstring {

    public static String findMaxSumSubstring(String s) {
        int maxSum = 0;
        StringBuilder result = new StringBuilder();
        int currentSum = 0;
        StringBuilder currentSub = new StringBuilder();
        boolean hasDigits = false;

        for (char c : s.toCharArray()) {
            if (Character.isDigit(c)) {
                hasDigits = true;
                currentSub.append(c);
                currentSum += Character.getNumericValue(c);
            } else {
                if (currentSub.length() > 0) {
                    if (currentSum > maxSum) {
                        maxSum = currentSum;
                        result = new StringBuilder(currentSub);
                    }
                    currentSub.setLength(0);
                    currentSum = 0;
                }
            }
        }

        // Проверяем последнюю подстроку
        if (currentSub.length() > 0 && currentSum > maxSum) {
            result = new StringBuilder(currentSub);
        }

        return hasDigits ? result.toString() : "В строке нет цифр!";
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Введите строку: ");
        String input = scanner.nextLine();
        
        String result = findMaxSumSubstring(input);
        System.out.println("Результат: " + result);
        
        scanner.close();
    }
}
