#include <stdio.h>
#include <printf.h>
#include "dat.h"

float 
Schlieren(float a, float b) {
	return (a+b)/(a-b);
}

int
main(void)
{
	/*
	 *	Declare arrays to store sensor data and the size of said arrays
	 */
	const int 	samplesPerDistribution = 30; 
	float 		temperatureDistribution[samplesPerDistribution];
	float 		humidityDistribution[samplesPerDistribution];
	/*
	 *	Fill the arrays with sensor readings from Temperature.txt and Humidity.txt
	 */
	for(int i = 0; i < samplesPerDistribution; i++)
	{
		/*
		 *	Delay by 30 us to match up with the sample rate of the sigsrc to avoid reading the same value twice or missing samples
		 */
		//xudelay(30);
		temperatureDistribution[i] = temp[i];
		humidityDistribution[i] = humidity[i];
	}
	/*
	 *	Compute the sum divided by the difference for all pairs of sensor values and print the result
	 */
	for(int i = 0; i < samplesPerDistribution; i++)
	{
		printf("(%f + %f)/(%f - %f) = %f\n", temperatureDistribution[i], humidityDistribution[i], temperatureDistribution[i], humidityDistribution[i], Schlieren(temperatureDistribution[i], humidityDistribution[i]));
	}	
	return 0;
}
