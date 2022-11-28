import matplotlib.pyplot as plt
import numpy as np
import math


# 직선 그리기
x = [1, 2, 3]
y = [1, 2, 3]
plt.plot(x, y)
plt.title("My Plot")
plt.xlabel("X")
plt.ylabel("Y")
plt.show()

# sin, cos 그리기
x = np.linspace(0, np.pi * 10, 500)
fig, axes = plt.subplots(2, 1)
axes[0].plot(x, np.sin(x))
axes[1].plot(x, np.cos(x))
plt.show()

# 2차함수 그리기
x = np.arange(-9, 10)
print(x)
y = x**2
plt.plot(x, y, linestyle=':', marker='*')
plt.show()

# cos 근사치 구하기


def func_cos(x, n):
    cos_approx = 0
    for i in range(n):
        coef = (-1)**i
        num = x**(2*i)
        denom = math.factorial(2*i)
        cos_approx += (coef)*num/denom
    return cos_approx


angles = np.arange(-2*np.pi, 2*np.pi, 0.1)
p_cos = np.cos(angles)
t_cos = [func_cos(angle, 3) for angle in angles]

fig, ax = plt.subplots()
ax.plot(angles, p_cos)
ax.plot(angles, t_cos)
ax.set_ylim([-5, 5])
ax.legend(['cos() function', 'Taylor Series - 3 terms'])

plt.show()

# -2pi ~ 2pi, 0.1 간격으로
angles = np.arange(-2*np.pi, 2*np.pi, 0.1)
p_cos = np.cos(angles)

fig, ax = plt.subplots()
ax.plot(angles, p_cos)

for i in range(1, 9):
    t_cos = [func_cos(angle, i) for angle in angles]
    ax.plot(angles, t_cos)

ax.set_ylim([-7, 4])
legend_lst = ['cos() function']
for i in range(1, 6):
    legend_lst.append(f'Taylor Series - {i} terms')
ax.legend(legend_lst, loc=3)

plt.show()
