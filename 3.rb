def reverse_number(num)
  reversed = 0
  n = num
  while n > 0
    reversed = reversed * 10 + n % 10
    n /= 10
  end
  reversed
end

puts "Введите количество чисел:"
n = gets.chomp.to_i

n.times do |i|
  print "Введите число ##{i + 1}: "
  number = gets.chomp.to_i
  reversed = reverse_number(number)
  difference = (number - reversed).abs
  puts "|#{number} - #{reversed}| = #{difference}"
end
