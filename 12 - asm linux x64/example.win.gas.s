.intel_syntax noprefix
.section .data
.equ EXIT_SUCCESS, 0
.equ SYS_exit, 60
bVar1: .byte 5
bVar2: .byte 5
bResult: .byte 0

.section .text
.globl _start
.extern ExitProcess
_start:
    mov al, byte ptr [rip + bVar1]
    add al, byte ptr [rip + bVar2]
    mov byte ptr [rip + bResult], al
    movzx rcx, byte ptr [rip + bResult]
    call ExitProcess
