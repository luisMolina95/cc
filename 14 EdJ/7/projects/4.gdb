break last
run

# 1. wAns1 = wNum1 + wNum2
echo 1. wAns1 = wNum1 + wNum2\n
printf "1. %05d = %05d + %05d\n", (short)wAns1, (short)wNum1, (short)wNum2
x/dh &wAns1
echo \n

# 2. wAns2 = wNum1 + wNum3
echo 2. wAns2 = wNum1 + wNum3\n
printf "2. %05d = %05d + %05d\n", (short)wAns2, (short)wNum1, (short)wNum3
x/dh &wAns2
echo \n

# 3. wAns3 = wNum3 + wNum4
echo 3. wAns3 = wNum3 + wNum4\n
printf "3. %05d = %05d + %05d\n", (short)wAns3, (short)wNum3, (short)wNum4
x/dh &wAns3
echo \n

# 4. wAns6 = wNum1 - wNum2
echo 4. wAns6 = wNum1 - wNum2\n
printf "4. %05d = %05d - %05d\n", (short)wAns6, (short)wNum1, (short)wNum2
x/dh &wAns6
echo \n

# 5. wAns7 = wNum1 - wNum3
echo 5. wAns7 = wNum1 - wNum3\n
printf "5. %05d = %05d - %05d\n", (short)wAns7, (short)wNum1, (short)wNum3
x/dh &wAns7
echo \n

# 6. wAns8 = wNum2 - wNum4
echo 6. wAns8 = wNum2 - wNum4\n
printf "6. %05d = %05d - %05d\n", (short)wAns8, (short)wNum2, (short)wNum4
x/dh &wAns8
echo \n

# 7. dAns11 = wNum1 * wNum3
echo 7. dAns11 = wNum1 * wNum3\n
printf "7. %06d = %05d * %05d\n", (int)dAns11, (short)wNum1, (short)wNum3
x/dw &dAns11
echo \n

# 8. dAns12 = wNum2 * wNum2
echo 8. dAns12 = wNum2 * wNum2\n
printf "8. %06d = %05d * %05d\n", (int)dAns12, (short)wNum2, (short)wNum2
x/dw &dAns12
echo \n

# 9. dAns13 = wNum2 * wNum4
echo 9. dAns13 = wNum2 * wNum4\n
printf "9. %06d = %05d * %05d\n", (int)dAns13, (short)wNum2, (short)wNum4
x/dw &dAns13
echo \n

# 10. wAns16 = wNum1 / wNum2
echo 10. wAns16 = wNum1 / wNum2\n
printf "10. %06d = %05d / %05d\n", (short)wAns16, (short)wNum1, (short)wNum2
x/dh &wAns16
echo \n

# 11. wAns17 = wNum3 / wNum4
echo 11. wAns17 = wNum3 / wNum4\n
printf "11. %06d = %05d / %05d\n", (short)wAns17, (short)wNum3, (short)wNum4
x/dh &wAns17
echo \n

# 12. wAns18 = dNum1 / wNum4
echo 12. wAns18 = dNum1 / wNum4\n
printf "12. %06d = %05d / %05d\n", (short)wAns18, (int)dNum1, (short)wNum4
x/db &wAns18
echo \n

# 13. wRem18 = dNum1 % wNum4
echo 13. wRem18 = dNum1 % wNum4\n
printf "13. %06d = %05d %% %05d\n", (short)wAns18, (int)dNum1, (short)wNum4
x/db &wRem18
echo \n
