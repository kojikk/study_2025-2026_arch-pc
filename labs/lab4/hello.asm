; hello.asm

SECTION .data            ; Секция данных
    helloMsg DB 'Hello, world!', 10    ; Строка для вывода + перевод строки
    msgLen  EQU $ - helloMsg           ; Длина строки helloMsg

SECTION .text            ; Секция кода
    GLOBAL _start         ; Точка входа в программу

_start:
    mov eax, 4            ; Системный вызов записи (sys_write)
    mov ebx, 1            ; Дескриптор файла 1 — стандартный вывод (stdout)
    mov ecx, helloMsg     ; Адрес строки для вывода
    mov edx, msgLen       ; Длина строки
    int 80h               ; Вызов ядра

    mov eax, 1            ; Системный вызов завершения программы (sys_exit)
    mov ebx, 0            ; Код возврата 0 (без ошибок)
    int 80h               ; Вызов ядра