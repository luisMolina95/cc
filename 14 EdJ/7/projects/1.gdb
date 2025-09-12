break last
run

# 1. bAns1 = bNum1 + bNum2
echo 1. bAns1 = bNum1 + bNum2\n
printf "1. %05u = %05u + %05u\n", (unsigned char)bAns1, (unsigned char)bNum1, (unsigned char)bNum2
x/ub &bAns1
echo \n

# 2. bAns2 = bNum1 + bNum3
echo 2. bAns2 = bNum1 + bNum3\n
printf "2. %05u = %05u + %05u\n", (unsigned char)bAns2, (unsigned char)bNum1, (unsigned char)bNum3
x/ub &bAns2
echo \n

# 3. bAns3 = bNum3 + bNum4
echo 3. bAns3 = bNum3 + bNum4\n
printf "3. %05u = %05u + %05u\n", (unsigned char)bAns3, (unsigned char)bNum3, (unsigned char)bNum4
x/ub &bAns3
echo \n

# 4. bAns6 = bNum1 - bNum2
echo 4. bAns6 = bNum1 - bNum2\n
printf "4. %05u = %05u - %05u\n", (unsigned char)bAns6, (unsigned char)bNum1, (unsigned char)bNum2
x/ub &bAns6
echo \n

# 5. bAns7 = bNum1 - bNum3
echo 5. bAns7 = bNum1 - bNum3\n
printf "5. %05u = %05u - %05u\n", (unsigned char)bAns7, (unsigned char)bNum1, (unsigned char)bNum3
x/ub &bAns7
echo \n

# 6. bAns8 = bNum2 - bNum4
echo 6. bAns8 = bNum2 - bNum4\n
printf "6. %05u = %05u - %05u\n", (unsigned char)bAns8, (unsigned char)bNum2, (unsigned char)bNum4
x/ub &bAns8
echo \n

# 7. wAns11 = bNum1 * bNum3
echo 7. wAns11 = bNum1 * bNum3\n
printf "7. %05u = %05u * %05u\n", (unsigned short)wAns11, (unsigned char)bNum1, (unsigned char)bNum3
x/uh &wAns11
echo \n

# 8. wAns12 = bNum2 * bNum2
echo 8. wAns12 = bNum2 * bNum2\n
printf "8. %05u = %05u * %05u\n", (unsigned short)wAns12, (unsigned char)bNum2, (unsigned char)bNum2
x/uh &wAns12
echo \n

# 9. wAns13 = bNum2 * bNum4
echo 9. wAns13 = bNum2 * bNum4\n
printf "9. %05u = %05u * %05u\n", (unsigned short)wAns13, (unsigned char)bNum2, (unsigned char)bNum4
x/uh &wAns13
echo \n

# 10. bAns16 = bNum1 / bNum2
echo 10. bAns16 = bNum1 / bNum2\n
printf "10. %05u = %05u / %05u\n", (unsigned char)bAns16, (unsigned char)bNum1, (unsigned char)bNum2
x/ub &bAns16
echo \n

# 11. bAns17 = bNum3 / bNum4
echo 11. bAns17 = bNum3 / bNum4\n
printf "11. %05u = %05u / %05u\n", (unsigned char)bAns17, (unsigned char)bNum3, (unsigned char)bNum4
x/ub &bAns17
echo \n

# 12. bAns18 = wNum1 / bNum4
echo 12. bAns18 = wNum1 / bNum4\n
printf "12. %05u = %05u / %05u\n", (unsigned char)bAns18, (unsigned short)wNum1, (unsigned char)bNum4
x/ub &bAns18
echo \n

# 13. bRem18 = wNum1 % bNum4
echo 13. bRem18 = wNum1 % bNum4\n
printf "13. %05u = %05u %% %05u\n", (unsigned char)bAns18, (unsigned short)wNum1, (unsigned char)bNum4
x/ub &bRem18
echo \n
