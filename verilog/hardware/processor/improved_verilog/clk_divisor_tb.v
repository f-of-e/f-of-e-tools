
module clk_divisor_tb();
	reg clk_f;
	wire clk;

	clk_divisor pclk(
		.clk_hf(clk_f),
		.clk(clk)
	);

//simulation
initial begin		
	clk_f = 1;
end
always begin
	#1 clk_f = ~clk_f;
end
localparam period = 30; //30s
always @(posedge clk_f) 
	begin
		$dumpfile ("clk_divisor.vcd");
		$dumpvars;
		#period;
		$finish;
	end
endmodule