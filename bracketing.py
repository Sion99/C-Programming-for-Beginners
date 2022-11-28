import matplotlib.pyplot as plt


def f(x):
    return x**3+4


def g(x):
    return x**10 - 1


def h(x):
    return (-2*x**3 + 11.7*x**2 + 5)/17.7


def hh(x):
    return (-6*x**2 + 2*11.7*x)/17.7


def bisection():
    iter = 0
    xr = 1
    xrold = 0
    xl = -2
    xu = 2
    es = 0.5
    x1 = [0]
    y1 = [0]
    ea = 0
    while (True):
        xrold = xr
        xr = (xl + xu) / 2
        iter += 1
        test = f(xl) * f(xr)
        if xr != 0:
            ea = abs((xr - xrold) / xr) * 100
        x1.append(iter)
        y1.append(ea)
        if test < 0:
            xu = xr
        else:
            if abs((xr-xrold)/xr)*100 < es:
                break
            else:
                xl = xr

    plt.plot(x1, y1)
    plt.show()
    print(iter, xr)


def modifiedbisect():
    iter = 0
    xl = -2
    xu = 2
    xr = 0
    xrold = 0
    es = 0.5
    fl = f(xl)
    while (True):
        xrold = xr
        xr = (xl+xu)/2
        fr = f(xr)
        iter += 1
        test = fl*fr
        if test < 0:
            xu = xr
        else:
            if abs((xr-xrold)/xr)*100 < es:
                break
            else:
                xl = xr
                fl = fr
    print(iter, xr)


def falseposition():
    iter = 0
    xl = 0
    xu = 1.3
    xrold = 0
    xr = 0
    fl = g(xl)
    fu = g(xu)
    es = 10**-6
    while (True):
        xrold = xr
        xr = xu - fu * (xl - xu) / (fl - fu)
        fr = g(xr)
        iter += 1
        test = fl * fr
        if test < 0:
            xu = xr
            fu = g(xu)
        else:
            if abs((xr - xrold)/xr) < es:
                break
            else:
                xl = xr
                fl = g(xl)
    print(iter, xr)


def modifiedfalse():
    iter = 0
    xl = 0
    xu = 1.3
    es = 10**-6
    il = 0
    iu = 0
    fl = g(xl)
    fu = g(xu)
    xr = 0
    while (True):
        xrold = xr
        xr = xu - fu*(xl-xu)/(fl-fu)
        iter += 1
        ea = abs((xrold-xr)/xr)
        # print(f'{iter}회차 : xr = {xr} f(xr) = {f(xr)}')
        if g(xl)*g(xr) < 0:
            xu = xr
            iu = 0
            il += 1
            if il >= 2:
                fl /= 2
        elif g(xl)*g(xr) > 0:
            xl = xr
            il = 0
            iu += 1
            if iu >= 2:
                fu /= 2
        else:
            ea = 0

        if ea < es:
            break
    print(iter, xr)


def fixedpoint():
    xr = 0
    return 0


def newton():
    # initial guess
    x0 = 0
    iter = 0
    xr = 0
    while (True):
        xrold = xr
        xr = h(xrold)


bisection()
modifiedbisect()
falseposition()
modifiedfalse()
