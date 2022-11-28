import numpy as np
import math

print('maclaurin 급수 구하기')
x = int(input('x 숫자를 입력하세요 : '))
es = float(input('es 숫자를 입력하세요 : '))
maxit = int(input("Maxiter 숫자를 입력하세요 : "))

iter = 1
sol = 1
ea = 100
fac = 1

while (True):
    solold = sol
    fac = fac * iter
    sol = sol + x ** iter / fac
    iter += 1
    if sol != 0:
        ea = abs((sol-solold)/sol) * 100
    print("iter=", iter, " ea=", ea, " es=", es, " sol=", sol)
    if ea <= es or iter >= maxit:
        break
