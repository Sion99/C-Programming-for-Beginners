//2018112085 �Žÿ�
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <math.h>

int main() {
	int a, b, c;
	double x1, x2, d, i1, i2;
	printf("2�� �������� ��� a b c�� �Է��Ͻÿ� : ");
	scanf("%d %d %d", &a, &b, &c);
	if (a == 0) {
		x1 = -(double)c / (double)b;
		printf("���� %lf�Դϴ�.\n", x1);
	}
	else {
		d = b * b - 4 * a * c;
		x1 = (-b + sqrt(d)) / (2 * (double)a);
		x2 = (-b - sqrt(d)) / (2 * (double)a);
		if (d > 0) {
			printf("���� %lf, %lf�Դϴ�.\n", x1, x2);
		}
		else if (d == 0) {
			printf("���� �߱� %lf�Դϴ�.\n", x1);
		}
		else {
			x1 = (-b / (2 * (double)a));
			i1 = sqrt(abs(b * b - 4 * a * c)) / (2 * a);
			i2 = -sqrt(abs(b * b - 4 * a * c)) / (2 * a);
			printf("��� %lf + %lfi �� %lf + %lfi�Դϴ�.\n", x1, i1, x1, i2);
		}
	}
}