#include <stdio.h>
#include "dat.h"


float Schlieren(float a, float b) {
	return (a+b)/(a-b);
}

int main(void)
{
	volatile unsigned int *		gDebugLedsMemoryMappedRegister = (unsigned int *)0x2000;
	/* Begin Benchmark - Pulse On Off */
	*gDebugLedsMemoryMappedRegister = 0xFF;
	for (int j = 0; j < 400000; j++);
	*gDebugLedsMemoryMappedRegister = 0x00;

		const int 	samplesPerDistribution = NOS; 

	for(int i = 0; i < samplesPerDistribution; i++)
	{
		float x = Schlieren(temp[i], humidity[i]);
	}

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
