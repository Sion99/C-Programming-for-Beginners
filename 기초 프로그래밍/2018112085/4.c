//2018112085 �Žÿ�
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	int a, b, c;
	printf("�� ���� �Է��ϼ��� >> ");
	scanf("%d %d %d", &a, &b, &c);
	int max = (a > b && a > c) ? a : (b > c) ? b : c;
	printf("%d\n", max);
}