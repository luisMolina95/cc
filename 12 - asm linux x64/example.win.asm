section .data
EXIT_SUCCESS equ 0
SYS_exit     equ 60

bVar1 db 5
bVar2 db 5
bResult db 0

section .text
global _start
extern ExitProcess
_start:
    mov al, byte[rel bVar1]
    add al, byte[rel bVar2]
    mov byte[rel bResult], al
    movzx rcx, byte[rel + bResult]
    call ExitProcess