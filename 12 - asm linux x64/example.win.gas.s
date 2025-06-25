.intel_syntax noprefix
.section .data
.equ EXIT_SUCCESS, 0
.equ SYS_exit, 60
bVar1: .byte 1
bVar2: .byte 3
bResult: .byte 0

.section .text
.globl _start
.extern ExitProcess
_start:
    mov al, byte ptr [rip + bVar1]
    add al, byte ptr [rip + bVar2]
    mov byte ptr [rip + bResult], al
    movzx ecx, byte ptr [rip + bResult]
    call ExitProcess
