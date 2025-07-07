.intel_syntax noprefix
.section .data
.equ EXIT_SUCCESS, 0
bVar1: .byte 5
bVar2: .byte 5
bResult: .byte 0
hello: .ascii "Hello, Windows!\n"
helloLen = . - hello

.section .text
.globl start
.extern ExitProcess, WriteConsoleA, GetStdHandle
start:
    mov al, BYTE PTR bVar1[rip]
    add al, BYTE PTR bVar2[rip]
    mov BYTE PTR bResult[rip], al
    

    mov rcx, -11
    call GetStdHandle


    mov rcx, rax
    lea rdx, hello[rip]
    mov r8, helloLen
    mov r9, 0
    call WriteConsoleA

    movzx rcx, BYTE PTR bResult[rip]
    call ExitProcess
