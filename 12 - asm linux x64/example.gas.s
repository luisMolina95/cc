.intel_syntax noprefix
.section .data
.equ EXIT_SUCCESS, 0
.equ SYS_exit, 60
bVar1: .byte 5
bVar2: .byte 5
bResult: .byte 0

.section .text
.globl _start
_start:
    mov al, byte[bVar1]
    add al, byte[bVar2]
    mov byte[bResult], al
    mov rax, SYS_exit
    mov rdi, byte[bResult]
    syscall
