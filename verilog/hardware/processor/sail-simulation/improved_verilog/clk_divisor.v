
module clk_divisor(clk_hf, clk);
	input clk_hf;
	output clk;
	
	wire[`CLK_PLL_DIV_REG:0] clk_mf;

	
	reg[`CLK_PLL_DIV_REG-1:0] divider_regs;
	
	genvar i;
	for (i = 0; i < `CLK_PLL_DIV_REG - 1; i = i + 1) begin
		assign clk_mf[i+1] = divider_regs[i];
		
		always @(posedge clk_mf[i]) begin
			divider_regs[i] <= !divider_regs[i];
		end
	end
	assign clk = clk_mf[`CLK_PLL_DIV_REG ];


endmodule
