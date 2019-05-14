module blink(led);
	output led;

	wire		clk;
	reg		LEDstatus = 1;
	reg [31:0]	count = 0;

	/*
	 *	Creates a 50MHz clock signal from
	 *	internal oscillator of the iCE40
	 */
	SB_LFOSC OSCInst0 (
		.CLKLFPU(1'b1),
		.CLKLFEN(1'b1),
		.CLKLF(clk)
	);

	/*
	 *	Blinks LED at approximately 1Hz
	 */
	always @(posedge clk) begin
		if (count > 500) begin
			LEDstatus <= !LEDstatus;
			count <= 0;
		end
		else begin
			count <= count + 1;
		end
	end

	/*
	 *	Assign output led to value in LEDstatus register
	 */
	assign	led = LEDstatus;
endmodule
