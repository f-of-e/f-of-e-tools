
module clk_divisor(clk_hf, clk);
	input clk_hf;
	output clk;
	reg[`CLK_PLL_DIV_REG-1:0] divider_regs;
	wire[`CLK_PLL_DIV_REG:0] clk_mf;
	
	/* FOLLOWING CODE ASSUMES `CLK_PLL_DIV_REG = 2 */
	initial begin
		divider_regs[0] = 0;
		divider_regs[1] = 0;
		//divider_regs[2] = 0;
	end
	
	always @(posedge clk_mf[0]) begin
		divider_regs[0] <= !divider_regs[0];
	end
	always @(posedge clk_mf[1]) begin
		divider_regs[1] <= !divider_regs[1];
	end
	/*
	always @(posedge clk_mf[2]) begin
		divider_regs[2] <= !divider_regs[2];
	end
	*/
	assign clk_mf[0] = clk_hf;
	assign clk_mf[1] = divider_regs[0];
	assign clk_mf[2] = divider_regs[1];
	//assign clk_mf[3] = divider_regs[2];

	assign clk = clk_mf[`CLK_PLL_DIV_REG];


endmodule
