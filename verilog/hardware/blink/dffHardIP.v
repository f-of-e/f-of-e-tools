module dff(
		input	D,
		input	clk,
		input	rst,
		output	Q
		);

	SB_DFFR SB_DFFR_inst (
		.Q(Q),
		.C(clk),
		.D(D),
		.R(rst)
	);

endmodule
