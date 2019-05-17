int
main(void)
{
	/*
	 *	Reading from the special address 0x2000 will cause sail to
	 *	set the value of 8 of the FPGA's pins to the byte written
	 *	to the address. See the PCF file for how those 8 pins are
	 *	mapped.
	 */
	volatile unsigned int *		debugLEDs = (unsigned int *)0x2000;

	enum
	{
		kSpinDelay = 400000,
	};

	while(1)
	{
		*debugLEDs = 0xFF;

		/*
		 *	Spin
		 */
		for (int j = 0; j < kSpinDelay; j++);

		*debugLEDs = 0x00;

		/*
		 *	Spin
		 */
		for (int j = 0; j < kSpinDelay; j++);		
	}
}
