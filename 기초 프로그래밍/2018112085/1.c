//2018112085 신시온
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	printf("(1) >> %d\n", 3 && 1 || 0);
	printf("(2) >> %d\n", 5 - 1 != sizeof(int));
	printf("(3) >> %d\n", 3 == 4 ? 3 - 5 : 4 % 3);
	printf("(4) >> %d\n", 0 || !2);
	printf("(5) >> %d\n", ~~5 >> 2 << 3 << 1);
	printf("(6) >> %d\n", 3 / 10 == 0);
	printf("(7) >> %d\n", (double)(int)3.4 + 5.5);
	printf("(8) >> %d\n", 1 | 3 & 11);
	printf("(9) >> %d\n", sizeof'a' + sizeof(char));
	int a, b;
	a = 1;
	b = a = 3;
	printf("\n");
	printf("a, b >> %d, %d\n", a, b);
	a = 16;
	a << 2;
	a <<= 2;
	printf("a >> %d\n", a);
}