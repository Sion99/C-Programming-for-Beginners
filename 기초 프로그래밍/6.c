#include <stdio.h>
#define myprint(x) printf(x); \
					puts("")
#define MESSAGE "���α׷������ �н��� �Ϲݾ���� �н��� \
 ���� �ݺ��н��� �߿��ϴ�"
#define PI 3.141592
#define VOLUME(r) (4*PI*CUBE(r)/3)
#define SQUARE(x) ((x)*(x))
#define CUBE(x) (SQUARE(x)*(x))
#define MULT(x, y) ((x)*(y))

int main(void) {
	myprint("��ũ�η� ����ϱ�");
	printf("����Լ��� ����ϱ�\n");
	return 0;
}
