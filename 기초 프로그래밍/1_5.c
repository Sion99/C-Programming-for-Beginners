//2018112085 �Žÿ�
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	int d, o, x;
	printf("10���� ���� �Է�>>");
	scanf("%d", &d);
	printf("10����: %d, 8����: %#o, 16����: %#x\n\n", d, d, d);
	printf("8���� ���� �Է� (��: 77)>>");
	scanf("%o", &o);
	printf("10����: %d, 8����: %#o, 16����: %#x\n\n", o, o, o);
	printf("16���� ���� �Է� (��: 1a0)>>");
	scanf("%x", &x);
	printf("10����: %d, 8����: %#o, 16����: %#x\n\n", x, x, x);
	printf("8���� ���� �Է� (��: 077)>>");
	scanf("%o", &o);
	printf("10����: %d, 8����: %o, 16����: %x\n\n", o, o, o);
	printf("16���� ���� �Է� (��: 1a0)>>");
	scanf("%x", &x);
	printf("10����: %d, 8����: %o, 16����: %x\n\n", x, x, x);
}