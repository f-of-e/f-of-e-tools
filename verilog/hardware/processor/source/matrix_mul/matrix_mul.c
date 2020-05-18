#include <stdlib.h>

int init = 0;

int
main(void)
{
	// This simple program intorduces a simple matrix inverse and multiplication calculation for two reference matrices. 
	// It is used to evaluate the progress of the improvement of the processor implementation.
	while(1) {
		srand(init);	

		int size = 100;

		int matrixA[size][size];	
		int matrixB[size][size];
		int mult[size][size];

		for(int i=0; i<size; i++){
			for(int j=0; j<size; j++){
				matrixA[i][j] = rand() % 20;
				matrixB[i][j] = rand() % 20;
				mult[i][j] = 0;
			}
		}

		for(int i=0; i<size; i++){
			for(int j=0; j<size; j++){
				for(int k=0; k<size; k++){
					mult[i][j] += matrixA[i][k] * matrixB[k][j]; 
				}
			}
		}
		init++;
	}
	return 0;
}
