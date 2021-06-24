#include <stdio.h>

int main() {
	int x = 16391;

	printf("%6d, %08x\n", x, x);
	printf("%6d, %08x\n", x >> 1, x >> 1);
	printf("%6d, %08x\n", x >> 2, x >> 2);
	printf("%6d, %08x\n", x >> 3, x >> 3);
	printf("%6d, %08x\n", x << 2, x << 2);
	printf("%6d, %08x\n", x << 3, x << 3);

	printf("%d\n", (x = 3 + 4, 2 * 3));

	int m = 5, n = 10;

	printf("%d ", n += m /= 3);
	m = 5; n = 10;
	printf("%d\n", (n += (m /= 3)));
	
	printf("%d ", 10 * 3 / 2);
	printf("%d\n", 10 * (3 / 2));

	printf("%d ", 3 > 4 ? 3 - 4 : 3 > 4 ? 3 + 4 : 3 * 4);
	printf("%d\n", 3 > 4 ? 3 - 4 : (3 > 4 ? 3 + 4 : 3 * 4));

}