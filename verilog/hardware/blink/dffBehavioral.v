module dff(
		input	D,
		input	clk,
		input	rst,
		output	Q
	);

	always @ (posedge(clk), posedge(rst))
	begin
		if (rst == 1)
			Q <= 1'b0;
		else
			Q <= D;
	end
endmodule
