/*
	Authored 2018-2019, Ryan Voo.

	All rights reserved.
	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions
	are met:

	*	Redistributions of source code must retain the above
		copyright notice, this list of conditions and the following
		disclaimer.

	*	Redistributions in binary form must reproduce the above
		copyright notice, this list of conditions and the following
		disclaimer in the documentation and/or other materials
		provided with the distribution.

	*	Neither the name of the author nor the names of its
		contributors may be used to endorse or promote products
		derived from this software without specific prior written
		permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
	"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
	LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
	FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
	COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
	INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
	BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
	CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
	LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
	ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
	POSSIBILITY OF SUCH DAMAGE.
*/



/*
 *	Description:
 *
 *		This module implements an adder for use by the branch unit
 *		and program counter increment among other things.
 */


module pll_clk(clk_hf, clk);
	input clk_hf;
	output clk;
	
	`ifdef `CLK_PLL_DIV_REG
		wire[`CLK_PLL_DIV_REG:0] clk_mf;
	`else
		wire[0:0] clk_mf;
	`endif

	// wire RST_i = 1'b0
	
	// assign		out = input1 + input2;

	/* Instantiating DSP module*/
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
	
	`ifdef `CLK_PLL_DIV_REG
		reg[`CLK_PLL_DIV_REG-1:0] divider_regs;
		
		integer i;
		for (i = 0; i < `CLK_PLL_DIV_REG - 1; i = i + 1) begin
			assign clk_mf[i+1] = divider_regs[i];
			
			always @(posedge clk_mf[i]) begin
				divider_regs[i] <= !divider_regs[i];
			end
		end
		assign clk = clk_mf[`CLK_PLL_DIV_REG ];
	`else
		assign clk = clk_mf[0];
	`endif
	

endmodule
