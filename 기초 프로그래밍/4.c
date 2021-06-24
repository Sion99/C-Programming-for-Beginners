#include <stdio.h>

int main() {
	enum DAY{SUN, MON, TUE, WED, THU, FRI, SAT};
	printf("일요일 상수: %d\n", SUN);
	printf("수요일 상수: %d\n", WED);

	enum SHAPE{POINT, LINE, TRI=3, RECT, OCTA = 8, CIRCLE};
	printf("LINE: %d, RECT: %d, CIRCLE: %d\n", LINE, RECT, CIRCLE);

	enum bool{ FALSE, TRUE };
	enum pl{c = 1972, cpp = 1983, java = 1995, csharp = 2000};
	printf("false: %d, cpp: %d, csharp: %d\n", FALSE, cpp, csharp);
}