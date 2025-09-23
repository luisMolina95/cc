; Implement the example program to compute the sum of squares from 1 to n.
; Use the debugger to execute the program and display the final results.
; Create a debugger input file to show the results in both decimal and hexadecimal.
section .data
n dd 10
nSquared dq 0
result dq 0
section .text
global _start
_start:
    mov rsi, 0
    mov rbx, 0
    mov ecx, 1
sum:
    mov eax, ecx
    mul eax
    mov DWORD [nSquared], eax
    mov DWORD [nSquared + 4], edx
    ; mov rsi, rdx
    ; shl rsi, 32
    ; or  rsi, rax
    mov rsi, QWORD [nSquared]
    add rbx, rsi
    inc ecx
    cmp ecx, DWORD [n]
    jbe sum
    mov QWORD [result], rsi
last:
    mov rax, 60
    mov rdi, 0
    syscall