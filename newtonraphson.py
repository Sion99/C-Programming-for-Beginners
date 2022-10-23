import numpy as np

def f(x):
    return x**10 - 1
    # return np.exp(-x) - x

def ff(x):
    return 10*x**9
    # return -np.exp(-x) - 1

x = 0.5
es = 10**-6
count = 0
while(True):
    count += 1
    temp = x - f(x)/ff(x)
    print(f'{count}회차 : x = {temp}')
    if abs((temp-x)/temp) < es:
        break
    x = temp