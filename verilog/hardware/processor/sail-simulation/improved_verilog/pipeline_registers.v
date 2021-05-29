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
 *	Pipeline registers
 */



/* IF/ID pipeline registers */ 
module if_id (clk, data_in, data_out);
	input			clk;
	input [63:0]		data_in;
	output reg[63:0]	data_out;

	/*
	 *	This uses Yosys's support for nonzero initial values:
	 *
	 *		https://github.com/YosysHQ/yosys/commit/0793f1b196df536975a044a4ce53025c81d00c7f
	 *
	 *	Rather than using this simulation construct (`initial`),
	 *	the design should instead use a reset signal going to
	 *	modules in the design.
	 */
	initial begin
		data_out = 64'b0;
	end

	always @(posedge clk) begin
		data_out <= data_in;
	end
endmodule



/* ID/EX pipeline registers */ 
module id_ex (clk, data_in, data_out);
	input			clk;
	input [177:0]		data_in;
	output reg[177:0]	data_out;

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
	initial begin
		data_out = 178'b0;
	end

	always @(posedge clk) begin
		data_out <= data_in;
	end
endmodule



/* EX/MEM pipeline registers */ 
module ex_mem (clk, data_in, data_out);
	input			clk;
	input [154:0]		data_in;
	output reg[154:0]	data_out;

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
	initial begin
		data_out = 155'b0;
	end

	always @(posedge clk) begin
		data_out <= data_in;
	end
endmodule



/* MEM/WB pipeline registers */ 
module mem_wb (clk, data_in, data_out);
	input			clk;
	input [116:0]		data_in;
	output reg[116:0]	data_out;

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
	initial begin
		data_out = 117'b0;
	end

	always @(posedge clk) begin
		data_out <= data_in;
	end
endmodule
