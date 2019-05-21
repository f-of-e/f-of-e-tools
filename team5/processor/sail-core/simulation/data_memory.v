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
 *		This module implements the data memory using the iCE40UP5K
 *		single-port RAM (SPRAM)
 */



module data_memory (clk, addr, write_data, memwrite, memread, sign_mask, read_data, led);
	input			clk;
	input [31:0]		addr;
	input [31:0]		write_data;
	input			memwrite;
	input			memread;
	input [3:0]		sign_mask;
	output reg [31:0]	read_data;
	output [7:0]		led;
	reg [31:0]		led_reg;



	/*
	 *	Debugging: Writes to memory address 0x2000 set the pins
	 *	connected to the `led` wires.
	 */
	always @(posedge clk) begin
		if ((memwrite == 1'b1) && (addr == 32'h2000)) begin
			led_reg <= write_data;
		end
	end

	reg [31:0]		datamem[8191:0];


	/*
	 *	According to "iCE40 SPRAM Usage Guide" (TN1314 Version 1.0),
	 *	page 5:
	 *
	 *		"SB_SPRAM256KA RAM does not support initialization through device configuration."
	 *
	 *	The only way to have an initializable memory is to use the
	 *	Block RAM.
	 *
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
		$readmemh("simulation/data.hex", datamem);
	end


	always @(posedge clk) begin
		if (memwrite == 1'b1) begin
			datamem[addr] <= write_data;
		end
		if (memread == 1'b1) begin
			read_data <= datamem[addr];
		end
	end


	/*
	 *	Put the test LED register values on the test LED wires.
	 */
	assign led = led_reg[7:0];
endmodule
