//2018112085 �Žÿ�
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	int n;
	printf("���� õ�� ������ �ϳ��� ���� �Է� >> ");
	scanf("%d", &n);
	int a, b, c, d, e;
	a = n / 10000;
	b = (n % 10000) /1000;
	c = (n % 1000) / 100;
	d = (n % 100) / 10;
	e = n % 10;
	printf("�Է��� �� %d�� %d�� %dõ %d�� %d�� %d�Դϴ�.\n", n, a, b, c, d, e);
}