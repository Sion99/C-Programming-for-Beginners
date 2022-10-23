def f(x):
    return x**10 - 1


xl = 0
xu = 1.3
es = 10**-6
count = 0
n = int(input('iteration? '))
while(count < n):
    count += 1
    xr = xu - f(xu)*(xl-xu)/(f(xl)-f(xu))
    if f(xr)*f(xu) < 0:
        xl = xr
    else:
        if abs((xl - xr)/xr) <= es:
            break
        else:
            xu = xr
    
    print(f'{count}회차 : xl = {xl} xu = {xu} xr = {xr}')

print(xr)