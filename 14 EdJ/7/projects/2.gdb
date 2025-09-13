break last
run

# 1. bAns1 = bNum1 + bNum2
echo 1. bAns1 = bNum1 + bNum2\n
printf "1. %05d = %05d + %05d\n", (char)bAns1, (char)bNum1, (char)bNum2
x/db &bAns1
echo \n

# 2. bAns2 = bNum1 + bNum3
echo 2. bAns2 = bNum1 + bNum3\n
printf "2. %05d = %05d + %05d\n", (char)bAns2, (char)bNum1, (char)bNum3
x/db &bAns2
echo \n

# 3. bAns3 = bNum3 + bNum4
echo 3. bAns3 = bNum3 + bNum4\n
printf "3. %05d = %05d + %05d\n", (char)bAns3, (char)bNum3, (char)bNum4
x/db &bAns3
echo \n

# 4. bAns6 = bNum1 - bNum2
echo 4. bAns6 = bNum1 - bNum2\n
printf "4. %05d = %05d - %05d\n", (char)bAns6, (char)bNum1, (char)bNum2
x/db &bAns6
echo \n

# 5. bAns7 = bNum1 - bNum3
echo 5. bAns7 = bNum1 - bNum3\n
printf "5. %05d = %05d - %05d\n", (char)bAns7, (char)bNum1, (char)bNum3
x/db &bAns7
echo \n

# 6. bAns8 = bNum2 - bNum4
echo 6. bAns8 = bNum2 - bNum4\n
printf "6. %05d = %05d - %05d\n", (char)bAns8, (char)bNum2, (char)bNum4
x/db &bAns8
echo \n

# 7. wAns11 = bNum1 * bNum3
echo 7. wAns11 = bNum1 * bNum3\n
printf "7. %05d = %05d * %05d\n", (short)wAns11, (char)bNum1, (char)bNum3
x/dh &wAns11
echo \n

# 8. wAns12 = bNum2 * bNum2
echo 8. wAns12 = bNum2 * bNum2\n
printf "8. %05d = %05d * %05d\n", (short)wAns12, (char)bNum2, (char)bNum2
x/dh &wAns12
echo \n

# 9. wAns13 = bNum2 * bNum4
echo 9. wAns13 = bNum2 * bNum4\n
printf "9. %05d = %05d * %05d\n", (short)wAns13, (char)bNum2, (char)bNum4
x/dh &wAns13
echo \n

# 10. bAns16 = bNum1 / bNum2
echo 10. bAns16 = bNum1 / bNum2\n
printf "10. %05d = %05d / %05d\n", (char)bAns16, (char)bNum1, (char)bNum2
x/db &bAns16
echo \n

# 11. bAns17 = bNum3 / bNum4
echo 11. bAns17 = bNum3 / bNum4\n
printf "11. %05d = %05d / %05d\n", (char)bAns17, (char)bNum3, (char)bNum4
x/db &bAns17
echo \n

# 12. bAns18 = wNum1 / bNum4
echo 12. bAns18 = wNum1 / bNum4\n
printf "12. %05d = %05d / %05d\n", (char)bAns18, (short)wNum1, (char)bNum4
x/db &bAns18
echo \n

# 13. bRem18 = wNum1 % bNum4
echo 13. bRem18 = wNum1 % bNum4\n
printf "13. %05d = %05d %% %05d\n", (char)bAns18, (short)wNum1, (char)bNum4
x/db &bRem18
echo \n
