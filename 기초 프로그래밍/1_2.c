//2018112085 �Žÿ�
#include <stdio.h>

void calander(void) {
	printf("��\t��\tȭ\t��\t��\t��\t��\n");
	printf(" \t \t1\t2\t3\t4\t5\n");
	printf("6\t7\t8\t9\t10\t11\t12\n");
	printf("13\t14\t15\t16\t17\t18\t19\n");
	printf("20\t21\t22\t23\t24\t25\t26\n");
	printf("27\t28\t29\t\30\n");
}

void human(void) {
	printf("\t       ----------      \n");
	printf("\t       | __  __ |      \n");
	printf("\t       |    |   |      \n");
	printf("\t      ------------     \n");
	printf("\t>-----|          |-----<\n");
	printf("\t      |          |     \n");
	printf("\t      ------------     \n");
	printf("\t         |    |        \n");
	printf("\t        --    --       \n");
}

int main() {
	calander();
	human();
}