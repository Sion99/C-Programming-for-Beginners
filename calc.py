def f(x):
    return 4*x**3 - 6*x**2 + 7*x - 2.3

def g(x):
    return 25*x**3 -6*x**2 + 7*x - 88


# print(f(1/2))
# print(f(1/4))
# print(f(3/8))
# print(f(7/16))
# print(f(15/32))
# print(f(29/64))

h = 0.25
x = 1.75
for i in range(10):
    print(x, g(x))
    x += h