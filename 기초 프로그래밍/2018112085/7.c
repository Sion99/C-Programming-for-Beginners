//2018112085 신시온
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <math.h>

int main() {
	int a, b, c;
	double x1, x2, d, i1, i2;
	printf("2차 방정식의 계수 a b c를 입력하시오 : ");
	scanf("%d %d %d", &a, &b, &c);
	if (a == 0) {
		x1 = -(double)c / (double)b;
		printf("근은 %lf입니다.\n", x1);
	}
	else {
		d = b * b - 4 * a * c;
		x1 = (-b + sqrt(d)) / (2 * (double)a);
		x2 = (-b - sqrt(d)) / (2 * (double)a);
		if (d > 0) {
			printf("근은 %lf, %lf입니다.\n", x1, x2);
		}
		else if (d == 0) {
			printf("근은 중근 %lf입니다.\n", x1);
		}
		else {
			x1 = (-b / (2 * (double)a));
			i1 = sqrt(abs(b * b - 4 * a * c)) / (2 * a);
			i2 = -sqrt(abs(b * b - 4 * a * c)) / (2 * a);
			printf("허근 %lf + %lfi 와 %lf + %lfi입니다.\n", x1, i1, x1, i2);
		}
	}
}