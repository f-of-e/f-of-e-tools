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
 *		This module implements the register file.
 */



module regfile(clk, write, wrAddr, wrData, rdAddrA, rdDataA, rdAddrB, rdDataB);
	input		clk;
	input		write;
	input [4:0]	wrAddr;
	input [31:0]	wrData;
	input [4:0]	rdAddrA;
	output [31:0]	rdDataA;
	input [4:0]	rdAddrB;
	output [31:0]	rdDataB;

	/*
	 *	register file, 32 x 32-bit registers
	 */
	reg [31:0]	regfile[31:0];

	/*
	 *	buffer to store address at each positive clock edge
	 */
	reg [4:0]	rdAddrA_buf;
	reg [4:0]	rdAddrB_buf;

	/*
	 *	registers for forwarding
	 */
	reg [31:0]	regDatA;
	reg [31:0]	regDatB;
	reg [31:0]	wrAddr_buf;
	reg [31:0]	wrData_buf;
	reg		write_buf;

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

	/*
	 *	Sets register 0 to 0
	 */
	initial begin
		regfile[0] = 32'b0;
	end

	always @(posedge clk) begin
		if (write==1'b1 && wrAddr!=5'b0) begin
			regfile[wrAddr] <= wrData;
		end
		wrAddr_buf	<= wrAddr;
		write_buf	<= write;
		wrData_buf	<= wrData;
		rdAddrA_buf	<= rdAddrA;
		rdAddrB_buf	<= rdAddrB;
		regDatA		<= regfile[rdAddrA];
		regDatB		<= regfile[rdAddrB];
	end

	assign	rdDataA = ((wrAddr_buf==rdAddrA_buf) & write_buf & wrAddr_buf!=32'b0) ? wrData_buf : regDatA;
	assign	rdDataB = ((wrAddr_buf==rdAddrB_buf) & write_buf & wrAddr_buf!=32'b0) ? wrData_buf : regDatB;
endmodule
