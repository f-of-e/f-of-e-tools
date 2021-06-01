
module pll_clk(clk_hf, clk);
	input clk_hf;
	output clk;
	
	`ifdef CLK_PLL_DIV_REG
		wire[`CLK_PLL_DIV_REG:0] clk_mf;
	`else
		wire[0:0] clk_mf;
	`endif
	
	/*
	SB_PLL40_CORE pll40_i(
		.REFERENCECLK(clk_hf),
		.BYPASS(1'b0),
		.EXTFEEDBACK(1'b0),
		.DYNAMICDELAY(8'b0),
		.LATCHINPUTVALUE(1'b0),
		.RESETB(1'b1),
		.PLLOUTGLOBAL(),
		.PLLOUTCORE(clk_mf[0]),
		.LOCK(),
		.SDO(),
		.SCLK(),
		.SDI()
	);
	
	defparam pll40_i.FEEDBACK_PATH = "SIMPLE";
	defparam pll40_i.DELAY_ADJUSTMENT_MODE_FEEDBACK = "FIXED";
	defparam pll40_i.DELAY_ADJUSTMENT_MODE_RELATIVE = "FIXED";
	defparam pll40_i.SHIFTREG_DIV_MODE = 1'b0;
	defparam pll40_i.FDA_FEEDBACK = 4'b0000;
	defparam pll40_i.FDA_RELATIVE = 4'b0000;
	defparam pll40_i.PLLOUT_SELECT = "GENCLK";
	defparam pll40_i.DIVR = `CLK_PLL_DIVR;
	defparam pll40_i.DIVF = `CLK_PLL_DIVF;
	defparam pll40_i.DIVQ = `CLK_PLL_DIVQ;
	defparam pll40_i.FILTER_RANGE = 3'b000;
	defparam pll40_i.ENABLE_ICEGATE = 1'b0;
	defparam pll40_i.TEST_MODE = 1'b0;
	defparam pll40_i.EXTERNAL_DIVIDE_FACTOR = 1;
	*/
	
	wire locked;
	assign locked = 1'b0;
	
	SB_PLL40_CORE #(
		.FEEDBACK_PATH("SIMPLE"),
		.DIVR(4'b0010),		// DIVR =  2
		.DIVF(7'b0111111),	// DIVF = 63
		.DIVQ(3'b110),		// DIVQ =  6
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
		for (i = 0; i < `CLK_PLL_DIV_REG - 1; i = i + 1) begin
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
