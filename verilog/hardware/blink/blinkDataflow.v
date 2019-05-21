module blink(led);
	output		led;

	wire		rst;
	wire		clk;

	/*
	 *	We treat all the Q and notQ signals as a bus, so we can use `generate`
	 *	statements to obtain a more compact implementation.
	 */
	wire [12:0]	Q;
	wire [12:0]	notQ;


	/*
	 *	Creates a 10KHz clock signal from
	 *	internal oscillator of the iCE40.
	 */
	SB_LFOSC OSCInst1 (
		.CLKLFEN(1'b1	/* ENCLKLF */		),
		.CLKLFPU(1'b1	/* CLKLF_POWERUP */	),
		.CLKLF(clk)
	);
 
	/*
	 *	We achieve the ~1Hz blink rate by dividing a higher frequency clock.
	 *	We use the iCE40's low-frequency oscillator so that we don't need
	 *	to do too much dividing.
	 *
	 *	We need to divide the clock Log2(10000) == 13.2877 times, to get 1Hz.
	 *
	 *	Since we use only a clock divider and not a counter, we end up with
	 *	a blink period of 1.2207 Hz (i.e., 10000/(2^13)).
	 */

	/*
	 *	The first DFF in the divider chain takes the clock directly.
	 */
	dff dffInstance0 (
				.D(notQ[0]),
				.clk(clk),
				.rst(rst),
				.Q(Q[0]),
			);

	/*
	 *	We generate the remaining DFFs using a `generate` statement.
	 */
	genvar i;
	generate
		for (i = 1; i < 13; i = i+1) 
		begin: dff_gen_label
			dff dffInstance (
						.D(notQ[i]),
						.clk(Q[i-1]),
						.rst(rst),
						.Q(Q[i])
					);
		end
	endgenerate

	/*
	 *	All the inverters will be inferred implicitly from this.
	 */
	assign notQ = ~Q;

	/*
	 *	Assign output led to value the subdivided clock (Q12):
	 */
	assign	led = Q[12];
endmodule
