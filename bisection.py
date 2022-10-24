def f(x):
    return x**3+4
    

xl = -2
xu = 2
es = 10**-6
count = 0
xr = 0
while(True):
    count += 1
    xrold = xr
    xr = (xl+xu)/2
    print(f'{count}회차: xr = {xr}')
    if f(xl)*f(xr) < 0:
        xu = xr
    else:
        if abs((xr - xrold)/xr) < es:
            break
        else:
            xl = xr

