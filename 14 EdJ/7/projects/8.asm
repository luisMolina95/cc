; Create a program to compute the square of the sum from 1 to n. Specifically,
; compute the sum of integers from 1 to n and then square the value. Use the
; debugger to execute the program and display the final results. Create a debugger
; input file to show the results in both decimal and hexadecimal.
section .data
n dd 10
result dd 10
section .text
global _start
_start:
    mov ebx, 0
    mov eax, 0
    mov ecx, DWORD [n]
sumLoop:
    inc ebx
    add eax, ebx
    loop sumLoop
    mul eax
    mov DWORD [result], eax
    mov DWORD [result + 4], edx
last:
    mov rax, 60
    mov rdi, 0
    syscall