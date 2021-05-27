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
 *		Branch Predictor FSM
 */

module branch_predictor(
		clk,
		actual_branch_decision,
		branch_decode_sig,
		branch_mem_sig,
		in_addr,
		offset,
		branch_addr,
		prediction
	);

	/*
	 *	inputs
	 */
	input		clk;
	input		actual_branch_decision;
	input		branch_decode_sig;
	input		branch_mem_sig;
	input [31:0]	in_addr;
	input [31:0]	offset;


	/*
	 *	outputs
	 */
	output [31:0]	branch_addr;
	output		prediction;
    /*
	output [1:0]	check0;
	output [1:0]	check1;
	output [1:0]	check2;
	output [1:0]	check3;
	output [1:0]	check4;
    */


	/*
	 *	internal state (2,2) branch predictor
	 */
	reg [1:0]	LHT[0:4 - 1];
	reg [1:0]	LPT[0:4 - 1];
	reg		branch_mem_sig_reg;

	/*
	 *	The `initial` statement below uses Yosys's support for nonzero
	 *	initial values:
	 *
	 *		https://github.com/YosysHQ/yosys/commit/0793f1b196df536975a044a4ce53025c81d00c7f
	 *
	 *	Rather than using this simulation construct (`initial`),
	 *	the design should instead use a reset signal going to
	 *	modules in the design and to thereby set the values.
	 */
	integer k;
	initial begin	 
	for (k = 0; k < 4 ; k = k + 1) // Initialise Local History Table to all 0s (no previous branches have been taken)
	begin 
		LHT[k] = 2'b0;
		LPT[k] = 2'b0;
	end 
	branch_mem_sig_reg = 1'b0; // 0
	end

	always @(negedge clk) begin
		branch_mem_sig_reg <= branch_mem_sig;
	end

	/*
	 *	Using this microarchitecture, branches can't occur consecutively
	 *	therefore can use branch_mem_sig as every branch is followed by
	 *	a bubble, so a 0 to 1 transition
	 */
	/*
	assign check0 = LPT[2'b0_0];
	assign check1 = LPT[2'b0_1];
	assign check2 = LPT[2'b1_0];
	assign check3 = LPT[2'b1_1];
	assign check4 = LPT[LHT[branch_addr[1:0]]];
	*/
	always @(posedge clk) begin
		if (branch_mem_sig_reg) begin
			// 2-bit branch predictor
			LPT[LHT[branch_addr[1:0]]][1] <= (LPT[LHT[branch_addr[1:0]]][1]&LPT[LHT[branch_addr[1:0]]][0]) | (LPT[LHT[branch_addr[1:0]]][0]&actual_branch_decision) | (LPT[LHT[branch_addr[1:0]]][1]&actual_branch_decision);
			LPT[LHT[branch_addr[1:0]]][0] <= (LPT[LHT[branch_addr[1:0]]][1]&(!LPT[LHT[branch_addr[1:0]]][0])) | ((!LPT[LHT[branch_addr[1:0]]][0])&actual_branch_decision) | (LPT[LHT[branch_addr[1:0]]][1]&actual_branch_decision);
			// Now update the LHT table (counter)
			LHT[branch_addr[1:0]][1] <= actual_branch_decision;
			LHT[branch_addr[1:0]][0] <= LHT[branch_addr[1:0]][1];
		end
	end
	assign prediction = LPT[LHT[branch_addr[1:0]]][1] & branch_decode_sig;
	assign branch_addr = in_addr + offset;
endmodule
