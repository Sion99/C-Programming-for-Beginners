//2018112085 신시온
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	int d, o, x;
	printf("10진수 정수 입력>>");
	scanf("%d", &d);
	printf("10진수: %d, 8진수: %#o, 16진수: %#x\n\n", d, d, d);
	printf("8진수 정수 입력 (예: 77)>>");
	scanf("%o", &o);
	printf("10진수: %d, 8진수: %#o, 16진수: %#x\n\n", o, o, o);
	printf("16진수 정수 입력 (예: 1a0)>>");
	scanf("%x", &x);
	printf("10진수: %d, 8진수: %#o, 16진수: %#x\n\n", x, x, x);
	printf("8진수 정수 입력 (예: 077)>>");
	scanf("%o", &o);
	printf("10진수: %d, 8진수: %o, 16진수: %x\n\n", o, o, o);
	printf("16진수 정수 입력 (예: 1a0)>>");
	scanf("%x", &x);
	printf("10진수: %d, 8진수: %o, 16진수: %x\n\n", x, x, x);
}