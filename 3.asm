section .data
    msg_n       db 'Введите количество чисел: ', 0
    len_n       equ $ - msg_n
    msg_num     db 'Введите число: ', 0
    len_num     equ $ - msg_num
    msg_result  db '|'
    sep         db ' - ', 0
    eq          db '| = ', 0
    newline     db 10

section .bss
    buffer      resb 32
    num         resd 1     ; Для хранения исходного числа
    reversed    resd 1     ; Для хранения перевернутого числа
    diff        resd 1     ; Для хранения разницы
section .text
    global _start

_start:
    ; Вывод приглашения для ввода количества чисел
    mov eax, 4            ; sys_write
    mov ebx, 1            ; stdout
    mov ecx, msg_n
    mov edx, len_n
    int 0x80

    ; Чтение количества чисел
    call read_int
    mov ecx, eax          ; ECX = количество чисел

main_loop:
    test ecx, ecx
    jz exit               ; Выход, если ECX == 0
    push ecx              ; Сохраняем счетчик

    ; Вывод приглашения для ввода числа
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_num
    mov edx, len_num
    int 0x80

    ; Чтение числа
    call read_int
    mov [num], eax        ; Сохраняем число в num

    ; Реверс числа
    call reverse_number
    mov [reversed], eax   ; Сохраняем перевернутое число

    ; Вычисление разницы
    mov ebx, [num]
    sub ebx, eax
    jns .store_diff       ; Если разница положительная, переходим
    neg ebx               ; Иначе инвертируем знак
.store_diff:
    mov [diff], ebx

    ; Вывод результата
    call print_result

    pop ecx               ; Восстанавливаем счетчик
    dec ecx
    jmp main_loop

exit:
    ; Завершение программы
    mov eax, 1            ; sys_exit
    xor ebx, ebx          ; код возврата 0
    int 0x80

; Функция чтения числа из ввода
read_int:
    mov eax, 3            ; sys_read
    mov ebx, 0            ; stdin
    mov ecx, buffer
    mov edx, 32
    int 0x80

    xor eax, eax          ; Обнуляем EAX для результата
    xor ecx, ecx          ; Счетчик символов
.convert:
    movzx edx, byte [buffer + ecx] ; Загружаем символ
    cmp dl, 10            ; Проверка на конец строки (LF)
    je .done
    cmp dl, 13            ; Проверка на конец строки (CR)
    je .done
    sub dl, '0'           ; Преобразуем ASCII в число
    imul eax, 10          ; Умножаем текущий результат на 10
    add eax, edx          ; Добавляем новую цифру
    inc ecx
    jmp .convert
.done:
    ret

; Функция реверса цифр числа
reverse_number:
    mov eax, [num]        ; Загружаем исходное число
    xor ebx, ebx          ; EBX будет хранить перевернутое число
    mov ecx, 10           ; Делитель
.reverse_loop:
    test eax, eax         ; Проверяем, остались ли цифры
    jz .done
    xor edx, edx          ; Обнуляем EDX перед делением
    div ecx               ; EAX = EAX / 10, EDX = остаток
    imul ebx, 10          ; Умножаем текущий результат на 10
    add ebx, edx          ; Добавляем остаток
    jmp .reverse_loop
.done:
    mov eax, ebx          ; Возвращаем результат в EAX
    ret

; Функция вывода числа
print_int:
    pusha                 ; Сохраняем все регистры
    mov edi, buffer + 11  ; Указатель на конец буфера
    mov byte [edi], 0     ; Нуль-терминатор
    dec edi
    mov ebx, 10           ; Делитель
    mov eax, [esp + 36]   ; Берем число из стека (pusha сохраняет 8 регистров)

.convert_loop:
    xor edx, edx          ; Обнуляем EDX перед делением
    div ebx               ; EDX = остаток от деления
    add dl, '0'           ; Преобразуем цифру в ASCII
    mov [edi], dl         ; Сохраняем символ в буфер
    dec edi
    test eax, eax         ; Проверяем, остались ли цифры
    jnz .convert_loop

    ; Вычисляем длину строки
    inc edi
    mov ecx, edi          ; Начало строки
    mov edx, buffer + 11  ; Конец буфера
    sub edx, ecx          ; Длина строки

    ; Вывод
    mov eax, 4            ; sys_write
    mov ebx, 1            ; stdout
    int 0x80

    popa                  ; Восстанавливаем регистры
    ret

; Функция вывода результата
print_result:
    ; Вывод левой палочки "|"
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_result
    mov edx, 1
    int 0x80

    ; Вывод исходного числа
    push dword [num]
    call print_int
    add esp, 4            ; Чистим стек

    ; Вывод разделителя " - "
    mov eax, 4
    mov ebx, 1
    mov ecx, sep
    mov edx, 3
    int 0x80

    ; Вывод перевернутого числа
    push dword [reversed]
    call print_int
    add esp, 4

    ; Вывод "| = "
    mov eax, 4
    mov ebx, 1
    mov ecx, eq
    mov edx, 4
    int 0x80
; Вывод разницы
    push dword [diff]
    call print_int
    add esp, 4

    ; Перевод строки
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    ret
