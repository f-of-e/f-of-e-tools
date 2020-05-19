/*
 *	Verilog uses C-style comments
 */
module simple(
		/*
		 *	The identifiers listed here are known
		 *	as the "ports" of the Verilog module
		 *	and this part of the module (in parenthesis)
		 *	is known as the "port list".
		 *
		 *	We will follow a number of conventions
		 *	for the stylistic layout of Verilog code.
		 *	You can find the list of conventions here:
		 *
		 *	github.com/physical-computation/conventions/README-RTLCodingConvention.md
		 */
			inSignal,
			outSignal
		);
	/*
	 *	The first component in the module is typically the input/output (I/O) declarations.
	 */
	input		inSignal;
	output		outSignal;

	/*
	 *	And finally the module's implementation.
	 */
	assign		outSignal = inSignal;
endmodule
