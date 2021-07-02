//2018112085 신시온
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	double height, weight;
	printf("키와 몸무게를 순서대로 입력하세요 >>");
	scanf("%lf %lf", &height, &weight);

	double standard = (height - 100) * 0.9;

	if (weight <= standard) {
		printf("정상입니다\n");
	}
	else
		printf("비만입니다\n");
}