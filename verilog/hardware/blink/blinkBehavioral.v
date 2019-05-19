module blink(led);
	output		led;

	wire		clk;
	reg		LEDstatus = 1;
	reg [31:0]	count = 0;

	/*
	 *	Creates a 48MHz clock signal from
	 *	internal oscillator of the iCE40
	 */
	SB_HFOSC OSCInst0 (
		.CLKHFPU(1'b1),
		.CLKHFEN(1'b1),
		.CLKHF(clk)
	);

	/*
	 *	Blinks LED at approximately 1Hz
	 */
	always @(posedge clk) begin
		if (count > 25000000) begin
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
