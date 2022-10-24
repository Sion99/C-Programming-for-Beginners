def f(x):
    return x**3.5-80


xl = 2
xu = 5
es = 10**-6
count = 0
xrold = 0
xr = 0
n = int(input('iteration? '))
while(count < n):
    count += 1
    xrold = xr
    xr = xu - f(xu)*(xl-xu)/(f(xl)-f(xu))
    if f(xr)*f(xu) < 0:
        xl = xr
    else:
        if abs((xrold - xr)/xr) < es:
            break
        else:
            xu = xr
    
    print(f'{count}회차 : xl = {xl} xu = {xu} xr = {xr}')

print(xr)