; Create a program to complete the following expressions using unsigned double-
; word sized variables. Note, the first letter of the variable name denotes the size
; (d → double-word and q → quadword).
; 1. dAns1 = dNum1 + dNum2
; 2. dAns2 = dNum1 + dNum3
; 3. dAns3 = dNum3 + dNum4
; 4. dAns6 = dNum1 - dNum2
; 5. dAns7 = dNum1 - dNum3
; 6. dAns8 = dNum2 - dNum4
; 7. qAns11 = dNum1 * dNum3
; 8. qAns12 = dNum2 * dNum2
; 9. qAns13 = dNum2 * dNum4
; 10. dAns16 = dNum1 / dNum2
; 11. dAns17 = dNum3 / dNum4
; 12. dAns18 = qNum1 / dNum4
; 13. dRem18 = qNum1 % dNum4

section .data
dAns1 dd 0
dAns2 dd 0
dAns3 dd 0
dAns6 dd 0
dAns7 dd 0
dAns8 dd 0
qAns11 dq 0
qAns12 dq 0
qAns13 dq 0
dAns16 dd 0
dAns17 dd 0
dAns18 dd 0
dRem18 dd 0
dNum1 dd 262140
dNum2 dd 131070
dNum3 dd 65535
dNum4 dd 65535
qNum1 dq 1844546515616515
section .text
global _start
_start:
    mov rax, QWORD [qNum1]
; 1. dAns1 = dNum1 + dNum2
    mov eax, DWORD [dNum1]
    add eax, DWORD [dNum2]
    mov DWORD [dAns1], eax
; 2. dAns2 = dNum1 + dNum3
    mov eax, DWORD [dNum1]
    add eax, DWORD [dNum3]
    mov DWORD [dAns2], eax
; 3. dAns3 = dNum3 + dNum4
    mov eax, DWORD [dNum3]
    add eax, DWORD [dNum4]
    mov DWORD [dAns3], eax
; 4. dAns6 = dNum1 - dNum2
    mov eax, DWORD [dNum1]
    sub eax, DWORD [dNum2]
    mov DWORD [dAns6], eax
; 5. dAns7 = dNum1 - dNum3
    mov eax, DWORD [dNum1]
    sub eax, DWORD [dNum3]
    mov DWORD [dAns7], eax
; 6. dAns8 = dNum2 - dNum4
    mov eax, DWORD [dNum2]
    sub eax, DWORD [dNum4]
    mov DWORD [dAns8], eax
; 7. qAns11 = dNum1 * dNum3
    mov eax, DWORD [dNum1]
    mul DWORD [dNum3]
    mov DWORD [qAns11], eax
    mov DWORD [qAns11 + 4], edx
; 8. qAns12 = dNum2 * dNum2
    mov eax, DWORD [dNum2]
    mul DWORD [dNum2]
    mov DWORD [qAns12], eax
    mov DWORD [qAns12 + 4], edx
; 9. qAns13 = dNum2 * dNum4
    mov eax, DWORD [dNum2]
    mul DWORD [dNum4]
    mov DWORD [qAns13], eax
    mov DWORD [qAns13 + 4], edx
; 10. dAns16 = dNum1 / dNum2
    mov edx, 0
    mov eax, DWORD [dNum1]
    div DWORD [dNum2]
    mov DWORD [dAns16], eax
; 11. dAns17 = dNum3 / dNum4
    mov edx, 0
    mov eax, DWORD [dNum3]
    div DWORD [dNum4]
    mov DWORD [dAns17], eax
; 12. dAns18 = qNum1 / dNum4
    mov eax, DWORD [qNum1]
    mov edx, DWORD [qNum1 + 4]
    div DWORD [dNum4]
    mov DWORD [dAns18], eax
; 13. dRem18 = qNum1 % dNum4
    mov DWORD [dRem18], edx
last:
    mov rax, 60
    mov rdi, 0
    syscall
