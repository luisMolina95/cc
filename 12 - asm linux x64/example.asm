section .data
EXIT_SUCCESS equ 0
SYS_exit     equ 60

bVar1 db 5
bVar2 db 5
bResult db 0

section .text
global _start
_start:
    mov al, byte[bVar1]
    add al, byte[bVar2]
    mov byte[bResult], al
    mov rax, SYS_exit
    movzx rdi, byte[bResult]
    syscall