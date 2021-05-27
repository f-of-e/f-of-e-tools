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
 *	RISC-V IMMEDIATE GENERATOR
 */



module imm_gen(inst, imm);

	input [31:0]		inst;
	output reg [31:0]	imm;

	initial begin
		imm = 32'b0;
	end

	always @(inst) begin
		case ({inst[6:5], inst[3:2]})
			4'b0000: //I-type
				imm = { {21{inst[31]}}, inst[30:20] };
			4'b1101: //I-type JALR
				imm = { {21{inst[31]}}, inst[30:21], 1'b0 };
			4'b0100: //S-type
				imm = { {21{inst[31]}}, inst[30:25], inst[11:7] };
			4'b0101: //U-type
				imm = { inst[31:12], 12'b0 };
			4'b0001: //U-type
				imm = { inst[31:12], 12'b0 };
			4'b1111: //UJ-type
				imm = { {12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0 };
			4'b1100: //SB-type
				imm = { {20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0 };
			default : imm = { {21{inst[31]}}, inst[30:20] };
		endcase
	end
endmodule
