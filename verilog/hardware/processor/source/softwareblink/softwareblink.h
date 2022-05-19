enum
{
	kSpinDelay = 400000, // 400000
};

/*
 *	Reading from the special address 0x2000 will cause sail to
 *	set the value of 8 of the FPGA's pins to the byte written
 *	to the address. See the PCF file for how those 8 pins are
 *	mapped.
 */
volatile unsigned char *		gDebugLedsMemoryMappedRegister = (unsigned int *)0x2000;
