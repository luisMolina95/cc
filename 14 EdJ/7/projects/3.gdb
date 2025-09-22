break last
run

# 1. wAns1 = wNum1 + wNum2
echo 1. wAns1 = wNum1 + wNum2\n
printf "1. %05u = %05u + %05u\n", (unsigned short)wAns1, (unsigned short)wNum1, (unsigned short)wNum2
x/uh &wAns1
echo \n

# 2. wAns2 = wNum1 + wNum3
echo 2. wAns2 = wNum1 + wNum3\n
printf "2. %05u = %05u + %05u\n", (unsigned short)wAns2, (unsigned short)wNum1, (unsigned short)wNum3
x/uh &wAns2
echo \n

# 3. wAns3 = wNum3 + wNum4
echo 3. wAns3 = wNum3 + wNum4\n
printf "3. %05u = %05u + %05u\n", (unsigned short)wAns3, (unsigned short)wNum3, (unsigned short)wNum4
x/uh &wAns3
echo \n

# 4. wAns6 = wNum1 - wNum2
echo 4. wAns6 = wNum1 - wNum2\n
printf "4. %05u = %05u - %05u\n", (unsigned short)wAns6, (unsigned short)wNum1, (unsigned short)wNum2
x/uh &wAns6
echo \n

# 5. wAns7 = wNum1 - wNum3
echo 5. wAns7 = wNum1 - wNum3\n
printf "5. %05u = %05u - %05u\n", (unsigned short)wAns7, (unsigned short)wNum1, (unsigned short)wNum3
x/uh &wAns7
echo \n

# 6. wAns8 = wNum2 - wNum4
echo 6. wAns8 = wNum2 - wNum4\n
printf "6. %05u = %05u - %05u\n", (unsigned short)wAns8, (unsigned short)wNum2, (unsigned short)wNum4
x/uh &wAns8
echo \n

# 7. dAns11 = wNum1 * wNum3
echo 7. dAns11 = wNum1 * wNum3\n
printf "7. %06u = %05u * %05u\n", (unsigned int)dAns11, (unsigned short)wNum1, (unsigned short)wNum3
x/uw &dAns11
echo \n

# 8. dAns12 = wNum2 * wNum2
echo 8. dAns12 = wNum2 * wNum2\n
printf "8. %06u = %05u * %05u\n", (unsigned int)dAns12, (unsigned short)wNum2, (unsigned short)wNum2
x/uw &dAns12
echo \n

# 9. dAns13 = wNum2 * wNum4
echo 9. dAns13 = wNum2 * wNum4\n
printf "9. %06u = %05u * %05u\n", (unsigned int)dAns13, (unsigned short)wNum2, (unsigned short)wNum4
x/uw &dAns13
echo \n

# 10. wAns16 = wNum1 / wNum2
echo 10. wAns16 = wNum1 / wNum2\n
printf "10. %06u = %05u / %05u\n", (unsigned short)wAns16, (unsigned short)wNum1, (unsigned short)wNum2
x/uh &wAns16
echo \n

# 11. wAns17 = wNum3 / wNum4
echo 11. wAns17 = wNum3 / wNum4\n
printf "11. %06u = %05u / %05u\n", (unsigned short)wAns17, (unsigned short)wNum3, (unsigned short)wNum4
x/uh &wAns17
echo \n

# 12. wAns18 = dNum1 / wNum4
echo 12. wAns18 = dNum1 / wNum4\n
printf "12. %06u = %05u / %05u\n", (unsigned short)wAns18, (unsigned int)dNum1, (unsigned short)wNum4
x/ub &wAns18
echo \n

# 13. wRem18 = dNum1 % wNum4
echo 13. wRem18 = dNum1 % wNum4\n
printf "13. %06u = %05u %% %05u\n", (unsigned short)wAns18, (unsigned int)dNum1, (unsigned short)wNum4
x/ub &wRem18
echo \n
