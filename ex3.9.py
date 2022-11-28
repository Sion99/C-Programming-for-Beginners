import numpy as np
import math

# maclaurin 2

x = int(input('e의 지수값을 입력하시오 : '))

sum = 1
term = 1
test = 0
i = 0
while (True):
    if sum == test:
        break
    i += 1
    test = sum
    term = (x**i)/math.factorial(i)
    sum = sum + term
    print("i=", i, " term=", term, " sum=", sum)

print("exact value = ", math.exp(x))
