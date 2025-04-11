def find_max_sum(s):
    max_sum = 0
    result = ""
    current_sum = 0
    current_sub = ""
    has_digits = False

    for char in s:
        if char.isdigit():
            has_digits = True
            current_sub += char
            current_sum += int(char)
        else:
            if current_sub:
                if current_sum > max_sum:
                    max_sum = current_sum
                    result = current_sub
                current_sub = ""
                current_sum = 0

    # Проверяем последнюю подстроку
    if current_sub:
        if current_sum > max_sum:
            result = current_sub

    return result if has_digits else "В строке нет цифр"
user_input = input("Введите строку: ")
print(find_max_sum(user_input))
