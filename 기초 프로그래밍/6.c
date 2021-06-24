#include <stdio.h>
#define myprint(x) printf(x); \
					puts("")
#define MESSAGE "프로그램언어의 학습은 일반언어의 학습과 \
 같이 반복학습이 중요하다"
#define PI 3.141592
#define VOLUME(r) (4*PI*CUBE(r)/3)
#define SQUARE(x) ((x)*(x))
#define CUBE(x) (SQUARE(x)*(x))
#define MULT(x, y) ((x)*(y))

int main(void) {
	myprint("매크로로 출력하기");
	printf("출력함수로 출력하기\n");
	return 0;
}
