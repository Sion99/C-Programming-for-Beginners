#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	float f = 3.1415F;
	double d = 42.3876547;

	printf("%f %lf\n", f, f);
	printf("%f %lf\n", d, d);
	printf("%f %s\n", 123456.789, "\t%f");

	int year, month, day;
	printf("당신의 생년월일은? ");
	scanf_s("%d - %d - %d", &year, &month, &day);
	printf("생년월일: %d-%d-%d\n", year, month, day);

	int snum, credit;
	printf("당신의 학번과 신청학점은? ");
	scanf("%d%d", &snum, &credit);
	printf("학번: %d 신청학점: %d\n", snum, credit);

	float pi; char ch1, ch2;
	printf("원주율을 입력하세요.\n");
	scanf("%f", &pi);
	printf("%f\n", pi);
	printf("구분자를 공백으로 두 문자를 입력하세요.\n");
	scanf(" %c %c", &ch1, &ch2);
	printf("ch1=%c ch2=%c\n", ch1, ch2);

	int a, b, c;
	printf("십진수, 팔진수, 십육진수를 각각 입력하세요.\n");
	scanf("%d %o %x", &a, &b, &c);
	printf("%d %#o %#x\n\n", a, b, c);

	printf("십진수, 팔진수(0리딩 표현), 십육진수(0x리딩 표현)를 각각 입력하세요\n");
	scanf("%i %i %i", &a, &b, &c);
	printf("%d %d %d\n", a, b, c);
}