//2018112085 �Žÿ�
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	double height, weight;
	printf("Ű�� �����Ը� ������� �Է��ϼ��� >>");
	scanf("%lf %lf", &height, &weight);

	double standard = (height - 100) * 0.9;

	if (weight <= standard) {
		printf("�����Դϴ�\n");
	}
	else
		printf("���Դϴ�\n");
}