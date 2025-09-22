break last
run

# 1. dAns1 = dNum1 + dNum2
echo 1. dAns1 = dNum1 + dNum2\n
printf "1. %05u = %05u + %05u\n", (unsigned int)dAns1, (unsigned int)dNum1, (unsigned int)dNum2
x/uw &dAns1
echo \n

# 2. dAns2 = dNum1 + dNum3
echo 2. dAns2 = dNum1 + dNum3\n
printf "2. %05u = %05u + %05u\n", (unsigned int)dAns2, (unsigned int)dNum1, (unsigned int)dNum3
x/uw &dAns2
echo \n

# 3. dAns3 = dNum3 + dNum4
echo 3. dAns3 = dNum3 + dNum4\n
printf "3. %05u = %05u + %05u\n", (unsigned int)dAns3, (unsigned int)dNum3, (unsigned int)dNum4
x/uw &dAns3
echo \n

# 4. dAns6 = dNum1 - dNum2
echo 4. dAns6 = dNum1 - dNum2\n
printf "4. %05u = %05u - %05u\n", (unsigned int)dAns6, (unsigned int)dNum1, (unsigned int)dNum2
x/uw &dAns6
echo \n

# 5. dAns7 = dNum1 - dNum3
echo 5. dAns7 = dNum1 - dNum3\n
printf "5. %05u = %05u - %05u\n", (unsigned int)dAns7, (unsigned int)dNum1, (unsigned int)dNum3
x/uw &dAns7
echo \n

# 6. dAns8 = dNum2 - dNum4
echo 6. dAns8 = dNum2 - dNum4\n
printf "6. %05u = %05u - %05u\n", (unsigned int)dAns8, (unsigned int)dNum2, (unsigned int)dNum4
x/uw &dAns8
echo \n

# 7. qAns11 = dNum1 * dNum3
echo 7. qAns11 = dNum1 * dNum3\n
printf "7. %06u = %05u * %05u\n", (unsigned int)qAns11, (unsigned int)dNum1, (unsigned int)dNum3
x/uw &qAns11
echo \n

# 8. qAns12 = dNum2 * dNum2
echo 8. qAns12 = dNum2 * dNum2\n
printf "8. %06u = %05u * %05u\n", (unsigned int)qAns12, (unsigned int)dNum2, (unsigned int)dNum2
x/uw &qAns12
echo \n

# 9. qAns13 = dNum2 * dNum4
echo 9. qAns13 = dNum2 * dNum4\n
printf "9. %06u = %05u * %05u\n", (unsigned int)qAns13, (unsigned int)dNum2, (unsigned int)dNum4
x/uw &qAns13
echo \n

# 10. dAns16 = dNum1 / dNum2
echo 10. dAns16 = dNum1 / dNum2\n
printf "10. %06u = %05u / %05u\n", (unsigned int)dAns16, (unsigned int)dNum1, (unsigned int)dNum2
x/uw &dAns16
echo \n

# 11. dAns17 = dNum3 / dNum4
echo 11. dAns17 = dNum3 / dNum4\n
printf "11. %06u = %05u / %05u\n", (unsigned int)dAns17, (unsigned int)dNum3, (unsigned int)dNum4
x/uw &dAns17
echo \n

# 12. dAns18 = qNum1 / dNum4
echo 12. dAns18 = qNum1 / dNum4\n
printf "12. %06u = %05lu / %05u\n", (unsigned int)dAns18, (unsigned long int)qNum1, (unsigned int)dNum4
x/ub &dAns18
echo \n

# 13. dRem18 = qNum1 % dNum4
echo 13. dRem18 = qNum1 % dNum4\n
printf "13. %06u = %05lu %% %05u\n", (unsigned int)dRem18, (unsigned long int)qNum1, (unsigned int)dNum4
x/ub &dRem18
echo \n
