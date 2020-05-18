#include <stdlib.h>

const int size = 9;
int determinant(int matrix[size][size], int k);
void mnr(int matrix[size][size], int intermidiate[size][size], int row, int column, int k);
void inverse(int matrix[size][size], int det);
int init = 0;

int
main(void)
{
	while(1) {
		srand(init);	
		int matrixA[size][size];	
		
		for(int i=0; i<size; i++){
			for(int j=0; j<size; j++){
				matrixA[i][j] = rand() % 9;
			}
		}

		int det = determinant(matrixA, size);
		if (abs(det) > 1) {
			inverse(matrixA, det);
		}
		init++;
	}
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
	float inv[size][size];
	int intermidiate[size][size];
	int sign = 1;
	
	for(int i=0; i < size; i++) {
		for(int j=0; j < size; j++) {
			mnr(matrix, intermidiate, i, j, size);
			inv[j][i] = (float)sign * (float)determinant(intermidiate, size-1) / (float)det;
			sign *= -1;
		}
	}
}
