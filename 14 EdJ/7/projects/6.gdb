break last
run

# 1. dAns1 = dNum1 + dNum2
echo 1. dAns1 = dNum1 + dNum2\n
printf "1. %05d = %05d + %05d\n", (int)dAns1, (int)dNum1, (int)dNum2
x/dw &dAns1
echo \n

# 2. dAns2 = dNum1 + dNum3
echo 2. dAns2 = dNum1 + dNum3\n
printf "2. %05d = %05d + %05d\n", (int)dAns2, (int)dNum1, (int)dNum3
x/dw &dAns2
echo \n

# 3. dAns3 = dNum3 + dNum4
echo 3. dAns3 = dNum3 + dNum4\n
printf "3. %05d = %05d + %05d\n", (int)dAns3, (int)dNum3, (int)dNum4
x/dw &dAns3
echo \n

# 4. dAns6 = dNum1 - dNum2
echo 4. dAns6 = dNum1 - dNum2\n
printf "4. %05d = %05d - %05d\n", (int)dAns6, (int)dNum1, (int)dNum2
x/dw &dAns6
echo \n

# 5. dAns7 = dNum1 - dNum3
echo 5. dAns7 = dNum1 - dNum3\n
printf "5. %05d = %05d - %05d\n", (int)dAns7, (int)dNum1, (int)dNum3
x/dw &dAns7
echo \n

# 6. dAns8 = dNum2 - dNum4
echo 6. dAns8 = dNum2 - dNum4\n
printf "6. %05d = %05d - %05d\n", (int)dAns8, (int)dNum2, (int)dNum4
x/dw &dAns8
echo \n

# 7. qAns11 = dNum1 * dNum3
echo 7. qAns11 = dNum1 * dNum3\n
printf "7. %06ld = %05d * %05d\n", (long int)qAns11, (int)dNum1, (int)dNum3
x/dg &qAns11
echo \n

# 8. qAns12 = dNum2 * dNum2
echo 8. qAns12 = dNum2 * dNum2\n
printf "8. %06ld = %05d * %05d\n", (long int)qAns12, (int)dNum2, (int)dNum2
x/dg &qAns12
echo \n

# 9. qAns13 = dNum2 * dNum4
echo 9. qAns13 = dNum2 * dNum4\n
printf "9. %06ld = %05d * %05d\n", (long int)qAns13, (int)dNum2, (int)dNum4
x/dg &qAns13
echo \n

# 10. dAns16 = dNum1 / dNum2
echo 10. dAns16 = dNum1 / dNum2\n
printf "10. %06d = %05d / %05d\n", (int)dAns16, (int)dNum1, (int)dNum2
x/dw &dAns16
echo \n

# 11. dAns17 = dNum3 / dNum4
echo 11. dAns17 = dNum3 / dNum4\n
printf "11. %06d = %05d / %05d\n", (int)dAns17, (int)dNum3, (int)dNum4
x/dw &dAns17
echo \n

# 12. dAns18 = qNum1 / dNum4
echo 12. dAns18 = qNum1 / dNum4\n
printf "12. %06d = %05ld / %05d\n", (int)dAns18, (long int)qNum1, (int)dNum4
x/db &dAns18
echo \n

# 13. dRem18 = qNum1 % dNum4
echo 13. dRem18 = qNum1 % dNum4\n
printf "13. %06d = %05ld %% %05d\n", (int)dRem18, (long int)qNum1, (int)dNum4
x/db &dRem18
echo \n
