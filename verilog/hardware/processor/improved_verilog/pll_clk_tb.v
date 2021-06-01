
module pll_clk_tb();
	reg clk_hf;
	reg clk;

	
	pll_clk pclk(
		.clk_hf(clk_hf),
		.clk(clk)
	);

//simulation
always begin
	#1 clk_hf = ~clk_hf;
end
always @(posedge clk) 
begin
	$dumpfile ("pll_clk.vcd");
	$dumpvars;
end
endmodule