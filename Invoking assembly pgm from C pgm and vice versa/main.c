#include <stdint.h>

extern unsigned int add_fun(int num1, int num2);
extern unsigned int sub_fun(int num1, int num2);
extern unsigned int str_cpy(char *src1, char *dst2);
extern unsigned int str_len(char *src1);
extern unsigned int cal_asm(int a,int b);
extern unsigned int str_cat(char *src1, char *dst2);
extern unsigned int str_cmp(char *src1, char *dst2);


unsigned int fun(int arg1, int arg2)
{
	return arg1 + arg2;
}


int main(void)
{

	uint32_t num1=5, num2=5;
	char src1[25] = "Today is Monday";
	char dst2[15] = {0};

	num1 = add_fun(num1, num2);

	sub_fun(num1, num2);

	cal_asm(5,10);

	str_cpy(src1,dst2);

	int len = str_len("HELLO HOW ARE YOU");
	str_cat(src1,"hi");
	int check = str_cmp("HI","HIl");


	while(1);
}
