def f(x):
    return x**3 + 2*x**2 - 1

xl = 0
xu = 1
es = 0.000001
count = 0
while(True):
    count += 1
    xr = (xl+xu)/2
    print(f'{count}회차: xr = {xr}')
    if f(xl)*f(xr) < 0:
        xu = xr
    else:
        if abs((xl - xr)/xr) < es:
            break
        else:
            xl = xr

print(xr)
