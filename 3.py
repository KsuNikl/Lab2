def reverse_number(num):
    reversed_num = 0
    n = num
    while n > 0:
        reversed_num = reversed_num * 10 + n % 10
        n = n // 10
    return reversed_num

n = int(input("Введите количество чисел: "))

for _ in range(n):
    number = int(input("Введите число: "))
    reversed_num = reverse_number(number)
    difference = abs(number - reversed_num)
    print(f"|{number} - {reversed_num}| = {difference}")
