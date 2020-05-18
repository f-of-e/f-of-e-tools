#include <stdlib.h>

int main(void)
{
	// This simple program intorduces a simple matrix inverse and multiplication calculation for two reference matrices. 
	// It is used to evaluate the progress of the improvement of the processor implementation.
	
		srand(0);	

		int size =50;

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
		

	return 0;
}
