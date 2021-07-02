//2018112085 신시온
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#define PI 3.14

int main() {
	double r;
	printf("반지름을 입력해주세요 >> ");
	scanf("%lf", &r);
	double v = r * r * r * 4 / 3 * PI;
	double s = 4 * PI * r * r;
	printf("구 체적: %lf, 구 표면적: %lf", v, s);
}