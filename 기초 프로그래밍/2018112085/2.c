//2018112085 신시온
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	int n;
	printf("정수 천만 이하의 하나의 수를 입력 >> ");
	scanf("%d", &n);
	int a, b, c, d, e;
	a = n / 10000;
	b = (n % 10000) /1000;
	c = (n % 1000) / 100;
	d = (n % 100) / 10;
	e = n % 10;
	printf("입력한 수 %d는 %d만 %d천 %d백 %d십 %d입니다.\n", n, a, b, c, d, e);
}