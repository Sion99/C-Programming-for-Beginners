def f(x):
    return x**3 + 2*x**2 - 1

xl = 0
xu = 1
es = 0.000001
count = 0
while(True):
    count += 1
    xr = xu - f(xu)*(xl-xu)/(f(xl)-f(xu))
    print(f'{count}회차 : xr = {xr}')
    if f(xr)*f(xu) < 0:
        xl = xr
    else:
        if abs((xl - xr)/xr) < es:
            break
        else:
            xu = xr

print(xr)