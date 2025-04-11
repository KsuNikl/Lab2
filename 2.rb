def calculate_steps(n, flowers, capacity)
  steps = 0
  current_pos = -1  # Начинаем у реки
  current_water = capacity

  n.times do |i|
    # Перемещаемся к текущему цветку
    steps += (i - current_pos).abs
    current_pos = i

    remaining = flowers[i]
    while remaining > 0
      # Поливаем часть цветка
      water = [current_water, remaining].min
      remaining -= water
      current_water -= water

      # Проверяем необходимость возврата к реке
      need_refill = remaining > 0 || (i < n - 1 && current_water < flowers[i + 1])

      if need_refill
        # Возвращаемся к реке
        steps += (current_pos - (-1)).abs
        current_pos = -1
        current_water = capacity
      end
    end
  end

  steps
end

# Ввод данных
print "Введите количество цветов: "
n = gets.chomp.to_i

print "Введите потребности цветов через пробел или запятую: "
flowers_input = gets.chomp.gsub(/,/, ' ').split
flowers = flowers_input.map(&:to_i)[0...n]

print "Введите вместимость лейки: "
capacity = gets.chomp.to_i

# Расчёт и вывод результата
puts "Количество шагов: #{calculate_steps(n, flowers, capacity)}"
