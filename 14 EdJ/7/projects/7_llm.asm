section .data
    n   dq 1000 * 1000 * 1000        ; número hasta el que sumamos los cuadrados

section .bss
    sum dq 0         ; variable para almacenar la suma

section .text
global _start

_start:
    xor rsi, rsi        ; suma = 0
    xor rcx, rcx        ; i = 0
    mov rbx, [n]
sum_loop:
    inc rcx
    mov rax, rcx
    mul rax          ; RAX = RAX * RDX (unsigned), RDX:RAX resultado 128-bit
    add rsi, rax     ; sum += i*i  (rdx tiene la parte baja de mul)
    cmp rcx, rbx
    jl sum_loop

    ; opcional: guardamos el resultado en memoria
    mov [sum], rsi
last:
    ; terminamos el programa
    mov rdi, rax            ; ponemos la suma en rdi (para ver en debugger)
    mov rax, 60             ; syscall exit
    syscall