import matplotlib.pyplot as plt
import numpy as np


def f(x):
    ff = np.exp(-x)-x
    return ff


xx = np.linspace(0, 2, 300)
yy = [f(b) for b in xx]

fig = plt.figure()
plt.plot(xx, yy)
plt.show()
