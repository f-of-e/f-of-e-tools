
module pll_clk(clk_hf, clk);
	input clk_hf;
	output clk;
	
	`ifdef CLK_PLL_DIV_REG
		wire[`CLK_PLL_DIV_REG:0] clk_mf;
	`else
		wire[0:0] clk_mf;
	`endif
	
	wire locked;
	
	SB_PLL40_CORE #(
		.FEEDBACK_PATH("SIMPLE"),
		.DIVR(`CLK_PLL_DIVR),		// DIVR =  2
		.DIVF(`CLK_PLL_DIVF),	// DIVF = 63
		.DIVQ(`CLK_PLL_DIVQ),		// DIVQ =  6
		.FILTER_RANGE(3'b001)	// FILTER_RANGE = 1
	) pll40_i (
		.LOCK(locked),
		.RESETB(1'b1),
		.BYPASS(1'b0),
		.REFERENCECLK(clk_hf),
		.PLLOUTCORE(clk_mf[0])
	);
	
	
	`ifdef CLK_PLL_DIV_REG
		reg[`CLK_PLL_DIV_REG-1:0] divider_regs;
		
		genvar i;
		for (i = 0; i < `CLK_PLL_DIV_REG; i = i + 1) begin
			assign clk_mf[i+1] = divider_regs[i];
			
			always @(posedge clk_mf[i]) begin
				divider_regs[i] <= !divider_regs[i];
			end
		end
		assign clk = clk_mf[`CLK_PLL_DIV_REG];
	`else
		assign clk = clk_mf[0];
	`endif
	

endmodule
