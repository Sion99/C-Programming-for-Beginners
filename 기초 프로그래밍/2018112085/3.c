//2018112085 �Žÿ�
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#define PI 3.14

int main() {
	double r;
	printf("�������� �Է����ּ��� >> ");
	scanf("%lf", &r);
	double v = r * r * r * 4 / 3 * PI;
	double s = 4 * PI * r * r;
	printf("�� ü��: %lf, �� ǥ����: %lf", v, s);
}