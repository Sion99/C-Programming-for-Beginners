import numpy as np

def f(x):
    # return x**10 - 1
    # return np.exp(-x) - x
    return 2*x**3 - 11.7*x**2 + 17.7*x - 5

def ff(x):
    # return 10*x**9
    # return -np.exp(-x) - 1
    return 6*x**2 - 23.4*x + 17.7

x = 3
es = 10**-6
count = 0
while(True):
    count += 1
    temp = x - f(x)/ff(x)
    print(f'{count}회차 : x = {temp}')
    if abs((temp-x)/temp) < es:
        break
    x = temp

print('종료')