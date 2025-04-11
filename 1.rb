def find_max_sum_substring(s)
  groups = s.scan(/\d+/) # Ищем все группы цифр
  return "В строке нет цифр!" if groups.empty?

  max_sum = 0
  result = ""

  groups.each do |group|
    current_sum = group.chars.map(&:to_i).sum # Считаем сумму цифр в группе
    if current_sum >= max_sum # При равенстве сумм выбираем последнюю группу
      max_sum = current_sum
      result = group
    end
  end

  result
end

# Интерактивный ввод
puts "Введите строку:"
input = gets.chomp
puts "Результат: #{find_max_sum_substring(input)}"

