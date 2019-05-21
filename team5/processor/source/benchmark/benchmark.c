/*#include <stdio.h>
#include <printf.h>
*/
int main()
{
    int a[8];
    
    //while(1)
    for(int repeats = 0; repeats< 2048; ++repeats)
    {
    a[0] = 6;
    a[1] = 8;
    a[2] = 9;
    a[3] = 7;
    a[4] = 1;
    a[5] = 5;
    a[6] = 2;
    a[7] = 3;

    int tmp = 0;

    for(int i = 0; i < 7; ++i)
    {
	for(int j = 0; j+i < 7; ++j)
	{
	    if(a[j] > a[j+1])
	    {
		tmp = a[j];
		a[j] = a[j+1];
		a[j+1] = tmp;
		//printf("%i",a[j]);
	    }
	}
    }
    }
    //printf("done\n");
    
return 0;
}
