import java.util.Scanner;

public class FlowerWatering {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Ввод количества цветов
        System.out.print("Введите количество цветов: ");
        int n = scanner.nextInt();
        scanner.nextLine(); // Очистка буфера
// Ввод потребностей цветов
        System.out.print("Введите потребности цветов через пробел или запятую: ");
        String flowersInput = scanner.nextLine().replaceAll(",", " ");
        String[] flowersParts = flowersInput.trim().split("\\s+");
        int[] flowers = new int[n];
        for (int i = 0; i < n && i < flowersParts.length; i++) {
            flowers[i] = Integer.parseInt(flowersParts[i]);
        }

        // Ввод вместимости лейки
        System.out.print("Введите вместимость лейки: ");
        int capacity = scanner.nextInt();

        // Расчет шагов
        int steps = 0;
        int currentPos = -1; // Начальная позиция у реки
        int currentWater = capacity;

        for (int i = 0; i < n; i++) {
            // Шаги до текущего цветка
            steps += Math.abs(i - currentPos);
            currentPos = i;

            // Поливаем цветок
            currentWater -= flowers[i];

            // Проверка необходимости возврата к реке
            if (i < n - 1) {
                if (currentWater < flowers[i + 1]) {
                    // Возвращаемся к реке
                    steps += Math.abs(currentPos - (-1));
                    currentPos = -1;
                    currentWater = capacity;
                }
            }
        }

        System.out.println("Количество шагов: " + steps);
    }
}
