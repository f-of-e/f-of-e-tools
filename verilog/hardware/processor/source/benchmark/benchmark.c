/*#include <stdio.h>
#include <printf.h>
*/
int main()
{
    int a[8];
    
    for(int repeats = 0; repeats< 2048; ++repeats)
    {
	    a[0] = 512;
	    a[1] = 888;
	    a[2] = 7;
	    a[3] = 1022;
	    a[4] = 97;
	    a[5] = 5;
	    a[6] = 20;
	    a[7] = 256;

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
