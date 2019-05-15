int
main(void)
{
	volatile unsigned int *		debugLEDs = (unsigned int *)0x2000;
	int				i = 0;

	enum
	{
		kSpinDelay = 4000,
	};

	while(1)
	{
		/*
		 *	Spin
		 */
		for (int j = 0; j < kSpinDelay; j++);

		/*
		 *	Set the debug LEDs with the lower 8 bits of the
		 *	free-running counter.
		 */
		*debugLEDs = i++ & 0xFF;
	}
}
