`timescale 1ns/1ns

module simpleTestbench;
	reg	signalIn, signalOut;

	simple simpleInstance(.inSignal(signalIn), .outSignal(singnalOut));

	initial begin
		/*
	 *	Delay for one time unit (1ns, as defined above), then set singalIn to 0
	 */
	#1	signalIn = 0;

	/*
	 *	Delay for one time unit (1ns, as defined above), then set singalIn to 1
	 */
	#1	signalIn = 1;

	/*
	 *	Delay for 10 time units (10ns, as defined above), then set singalIn to 0
	 */
	#10	signalIn = 0;

	/*
	 *	Delay for one time unit (1ns, as defined above), then set singalIn to 1
	 */
	#1	signalIn = 1;
	end
	initial begin
		$dumpfile("simpleTestbench.vcd");
		$dumpvars;
	end
endmodule
