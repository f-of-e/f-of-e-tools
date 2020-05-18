#include <stdio.h>
#include <math.h>

//calculates the value of e to precision 1.0e^-15 and loops
//by approximation e = 1 + 1/2! + 1/3! + ...

int main(void) {
    while(1){
   	unsigned long long fact = 1; //stores a 'running' value of 1/n!
   	double e = 2.0, e0;    //e stores current value, e0 stores previous value
    	int n = 2;    
    	do {
		//while absolute improvement in precision is greater than 1.0e^-15
        	e0 = e; 	    //store previous value of e in e0
        	fact *= n++;	    //update n!
        	e += 1.0 / fact;    //add next value of 1/n! to e
    	}
	while(fabs(e-e0) >= 0.000000000000001);
    }
    return 0;
}

