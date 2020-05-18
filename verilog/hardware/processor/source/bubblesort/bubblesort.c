#include <stdio.h>
#include <stdlib.h>

void swap(int *xp, int *yp) 
{ 
    int temp = *xp; 
    *xp = *yp; 
    *yp = temp; 
} 
  
// A function to implement bubble sort 
void bubbleSort(int arr[], int n) 
{ 
   int i, j; 
   for (i = 0; i < n-1; i++)       
  
       // Last i elements are already in place    
       for (j = 0; j < n-i-1; j++)  
           if (arr[j] > arr[j+1]) 
              swap(&arr[j], &arr[j+1]); 
} 
main(void)
{
 int myarray[] = {19,20,77,21,90,74,31,39,14,76,97,32,12,33,86,79,34,40,13,58,60,68,99,85,55,71,30,18,3,75,62,26,8,48,54,28,27,35,94,70,38,9,23,57,69,52,53,59,36,43,22,98,4,50,6,24,91,56,65,96,72,45,92,15,87,66,82,10,49,46,2,47,100,17,67,84,41,11,81,83,95,61,78,51,29,89,44,73,42,64,1,80,16,5,37,25,7,63,93,88};
	int n = sizeof(myarray)/sizeof(myarray[0]); 
	while(1){ 
    		bubbleSort(myarray, n); 
		return 0;
	}
}
