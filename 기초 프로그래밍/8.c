#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	float f = 3.1415F;
	double d = 42.3876547;

	printf("%f %lf\n", f, f);
	printf("%f %lf\n", d, d);
	printf("%f %s\n", 123456.789, "\t%f");

	int year, month, day;
	printf("����� ���������? ");
	scanf_s("%d - %d - %d", &year, &month, &day);
	printf("�������: %d-%d-%d\n", year, month, day);

	int snum, credit;
	printf("����� �й��� ��û������? ");
	scanf("%d%d", &snum, &credit);
	printf("�й�: %d ��û����: %d\n", snum, credit);

	float pi; char ch1, ch2;
	printf("�������� �Է��ϼ���.\n");
	scanf("%f", &pi);
	printf("%f\n", pi);
	printf("�����ڸ� �������� �� ���ڸ� �Է��ϼ���.\n");
	scanf(" %c %c", &ch1, &ch2);
	printf("ch1=%c ch2=%c\n", ch1, ch2);

	int a, b, c;
	printf("������, ������, ���������� ���� �Է��ϼ���.\n");
	scanf("%d %o %x", &a, &b, &c);
	printf("%d %#o %#x\n\n", a, b, c);

	printf("������, ������(0���� ǥ��), ��������(0x���� ǥ��)�� ���� �Է��ϼ���\n");
	scanf("%i %i %i", &a, &b, &c);
	printf("%d %d %d\n", a, b, c);
}