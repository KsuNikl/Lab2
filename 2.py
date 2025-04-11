def calculate_steps(n, flowers, capacity):
    steps = 0
    current_pos = -1  # Начинаем у реки
    current_water = capacity
    
    for i in range(n):
        # Перемещаемся к текущему цветку
        steps += abs(i - current_pos)
        current_pos = i
        
        remaining = flowers[i]
        while remaining > 0:
            # Поливаем часть цветка
            water = min(current_water, remaining)
            remaining -= water
            current_water -= water
            
            # Проверяем необходимость возврата к реке
            need_refill = False
            if remaining > 0:
                need_refill = True
            elif i < n - 1 and current_water < flowers[i + 1]:
                need_refill = True
            
            if need_refill:
                # Возвращаемся к реке
                steps += abs(current_pos - (-1))
                current_pos = -1
                current_water = capacity
    
    return steps

# Ввод данных с клавиатуры
n = int(input("Введите количество цветов: "))
flowers_input = input("Введите потребности цветов через пробел или запятую: ").replace(',', ' ')
flowers = list(map(int, flowers_input.split()))
flowers = flowers[:n]  # Обрезаем до указанного количества цветов
capacity = int(input("Введите вместимость лейки: "))

# Расчёт и вывод результата
print("Количество шагов:", calculate_steps(n, flowers, capacity))
