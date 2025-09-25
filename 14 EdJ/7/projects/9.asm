; Create a program to iteratively find the nth Fibonacci number. The value for n
; should be set as a parameter (e.g., a programmer defined constant).
; The formula for computing Fibonacci is as follows:
;                / n                          if n = 0 or n = 1
; fibonacci(n) = | fibonacci(n - 2) + 
;                \          fibonacci(n - 1)  if n ≥ 2
; Use the debugger to execute the program and display the final results.
; Test the program for various values of n.
; Create a debugger input file to show the results in both decimal and hexadecimal.
section .data
n dd 3
result dd 0
section .text
global _start
_start:
    mov eax, 0
    mov ebx, 1
    mov edx, 0
    mov ecx, DWORD [n]
fibonacciLoop:
    add eax, ebx
    mov edx, eax
    mov eax, ebx
    mov ebx, edx
    loop fibonacciLoop
    mov DWORD [result], eax
last:
    mov rax, 60
    mov rdi, 0
    syscall
