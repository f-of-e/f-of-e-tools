//#include <stdio.h>
#include <stdlib.h>
#include <time.h>

const int size = 8;
int determinant(int matrix[size][size], int k);
void mnr(int matrix[size][size], int intermidiate[size][size], int row, int column, int k);
void inverse(int matrix[size][size], int det);

int
main(void)
{
	srand(time(0));	
	int matrixA[size][size];	
	
	for(int i=0; i<size; i++){
		for(int j=0; j<size; j++){
			matrixA[i][j] = rand() % 10;
		}
	}

	int det = determinant(matrixA, size);
	//printf("%d\n", det);
	if (abs(det) < 1) {
		//printf("We have failed");
	} else {
		inverse(matrixA, det);
	}
	// print the array
	//for(int i=0; i<size; i++){
	//	for(int j=0; j<size; j++){
	//		printf("%d ", matrixA[i][j]);	
	//		if(j==size-1) {
	//			printf("\n");
	//		}
	//	}
	//}

	return 0;
}

// Calculate the determinant of a matrix
int determinant(int matrix[size][size], int k) {
	int det = 0, sign = 1;
	int intermediate[size][size];

	if(k==1) {
		return matrix[0][0];
	} else {
		det = 0;
		for(int z=0; z < k; z++) {
			mnr(matrix, intermediate, 0, z, k);
			det += sign * matrix[0][z] * determinant(intermediate, k-1);
			sign *= -1;
		}
		return det;
	}
	return det;
}

// Provides the minor of matrix by altering the intermidiate matrix
void mnr(int matrix[size][size], int intermidiate[size][size], int row, int column, int k) {
	int m = 0;
	int n = 0;

	for(int i=0; i < k; i++) {
		for(int j=0; j < k; j++) {
			intermidiate[i][j] = 0;
			if(i != row && j != column) {
				intermidiate[m][n] = matrix[i][j];
				if(n < k - 2) {
					n++;
				} else {
					n = 0;
					m++;
				}
			}
		}
	}
}

// Calculate the cofactor matrix, transpose it and print the inverse
void inverse(int matrix[size][size], int det) {
	int inv[size][size];
	int intermidiate[size][size];
	int sign = 1;
	
	for(int i=0; i < size; i++) {
		for(int j=0; j < size; j++) {
			mnr(matrix, intermidiate, i, j, size);
			inv[j][i] = sign * determinant(intermidiate, size-1); // Note: for efficiency we could do dividion here
			sign *= -1;
		}
	}
	
	
	// print the array
	//for(int i=0; i<size; i++){
	//	for(int j=0; j<size; j++){
	//		printf("%f ", (float)inv[i][j]/ (float)det);	
	//		if(j==size-1) {
	//			printf("\n");
	//		}
	//	}
	//}
}
