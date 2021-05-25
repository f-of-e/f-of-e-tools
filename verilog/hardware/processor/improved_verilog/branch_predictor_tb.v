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


module branch_predictor_tb();

reg clk = 0;
reg actual_branch_decision;
reg branch_decode_sig;
reg branch_mem_sig;
reg [31:0] in_addr;
reg [31:0] offset;
wire [31:0] branch_addr;
wire prediction;
/*
wire [1:0] check0;
wire [1:0] check1;
wire [1:0] check2;
wire [1:0] check3;
wire [1:0] check4;
*/
branch_predictor bp(
	.clk(clk),
	.actual_branch_decision(actual_branch_decision),
	.branch_decode_sig(branch_decode_sig),
	.branch_mem_sig(branch_mem_sig),
	.in_addr(in_addr),
	.offset(offset),
	.branch_addr(branch_addr),
	.prediction(prediction)
	/*
	.check0(check0),
	.check1(check1),
	.check2(check2),
	.check3(check3),
	.check4(check4)
	*/
);
localparam period = 2;  //2s

//simulation
always begin
	#1 clk = ~clk;
end
always @(posedge clk) 
begin
	$dumpfile ("branch_predictor.vcd");
	$dumpvars;

	//write bytes
	in_addr = 00000000000000000000000010000100;
	offset = 32'b0;
	branch_decode_sig = 1'b1;
	branch_mem_sig = 1'b1;
	#period;

	actual_branch_decision = 1'b1; //Branch taken

	#period;
	actual_branch_decision = 1'b0; //Branch not taken

	#period;
	actual_branch_decision = 1'b1;

	#period;
	actual_branch_decision = 1'b0;

	#period;
	actual_branch_decision = 1'b1;
	#period;

	actual_branch_decision = 1'b1;
	#period;
	
	actual_branch_decision = 1'b0;
	#period;

	actual_branch_decision = 1'b1;
	#period;
	
	actual_branch_decision = 1'b1;
	#period;
	$finish;

end

endmodule


