import numpy as np

def g(x):
    # return np.exp(-x)
    # return x**10-x-1
    return (-2*x**3 + 11.7*x**2 + 5)/17.7

x = 3
es = 10**-6
count = 0

while(True):
    count += 1
    temp = g(x)
    x = temp
    print(f'{count}회차 : x = {x} g(x) = {g(x)}')
    if abs((g(x) - x)/g(x)) < es:
        break