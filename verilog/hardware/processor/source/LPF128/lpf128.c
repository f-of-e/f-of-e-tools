#include <stdio.h>
#include "dat.h"

float LowPassFilter(float *in, float *out, int N, double in0)
{
	out[0] = in[0] + in0;
	for (int n=1; n < N ; n++) 
	{
		out[n] =  in[n]  + in[n-1];
	}
	return in[N-1];
}

int
main(void)
{
	volatile unsigned int *		gDebugLedsMemoryMappedRegister = (unsigned int *)0x2000;
	/* Begin Benchmark - Pulse On Off */
	*gDebugLedsMemoryMappedRegister = 0xFF;
	for (int j = 0; j < 400000; j++);
	*gDebugLedsMemoryMappedRegister = 0x00;

	const int	numberOfSamples = NOS;
	int		halfNumberOfSamples = numberOfSamples/2;
	float 		xBuffer[numberOfSamples];
	float 		xBufferOut[numberOfSamples];
	float 		in0 = 0;

	for(int j = 0; j < numberOfSamples; j++)
    	{
    		xBuffer[j] = phonysig[j];
	}	
	
	in0 = LowPassFilter(xBuffer, xBufferOut, halfNumberOfSamples, in0);
	in0 = LowPassFilter(&xBuffer[halfNumberOfSamples], &xBufferOut[halfNumberOfSamples], halfNumberOfSamples, in0);

	/* End Benchmark - Pulse On */
	*gDebugLedsMemoryMappedRegister = 0xFF;
	while(1)
	{
		*gDebugLedsMemoryMappedRegister = 0xFF;

		/*
		 *	Spin
		 */
		for (int j = 0; j < 40000; j++);

		*gDebugLedsMemoryMappedRegister = 0x00;

		/*
		 *	Spin
		 */
		for (int j = 0; j < 40000; j++);		
	}
}
