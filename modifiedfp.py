def f(x):
    return x**10 - 1

iter = 0
xl = 0
xu = 1.3
es = 10**-6
il = 0
iu = 0
fl = f(xl)
fu = f(xu)
xr = 0
while(True):
    xrold = xr
    xr = xu - fu*(xl-xu)/(fl-fu)
    iter += 1
    ea = abs((xrold-xr)/xr)
    print(f'{iter}회차 : xr = {xr} f(xr) = {f(xr)}')
    if f(xl)*f(xr) < 0:
        xu = xr
        iu = 0
        il += 1
        if il >= 2:
            fl /= 2
    elif f(xl)*f(xr) > 0:
        xl = xr
        il = 0
        iu += 1
        if iu >= 2:
            fu /= 2
    else:
        ea = 0
    
    if ea<es:
        break

