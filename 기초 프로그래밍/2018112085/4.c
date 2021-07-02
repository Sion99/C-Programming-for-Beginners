//2018112085 신시온
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	int a, b, c;
	printf("세 수를 입력하세요 >> ");
	scanf("%d %d %d", &a, &b, &c);
	int max = (a > b && a > c) ? a : (b > c) ? b : c;
	printf("%d\n", max);
}