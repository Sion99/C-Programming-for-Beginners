//2018112085 �Žÿ�
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

#define SQ2(x) ((x)*(x))

int main() {
	double x;
	printf("x�� ���� �Ǽ��� �Է��Ͻÿ� : ");
	scanf("%lf", &x);
	printf("x�� ������ %.1lf�Դϴ�.\n", SQ2(x));
	printf("x�� �������� %.1lf�Դϴ�.\n", SQ2(x)*SQ2(x));
}