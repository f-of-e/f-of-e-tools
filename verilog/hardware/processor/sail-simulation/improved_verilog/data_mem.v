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



//Data cache

module data_mem (clk, addr, write_data, memwrite, memread, sign_mask, read_data, led, clk_stall);
	input			clk;
	/* 
	addr is used only to assign bits to addr_buff, which in turn assigns bits to addr_buf_block_addr and addr_buf_byte_offset
	which require bits 11 to 0 only. Instruction memory substraction in FSM is unaffected by reducing address size bus. 
	*/
	//input [31:0]		addr;
	input [13:0]		addr;
	input [31:0]		write_data;
	input			memwrite;
	input			memread;
	input [3:0]		sign_mask;
	output reg [31:0]	read_data;
	output [7:0]		led;
	output reg		clk_stall;	//Sets the clock high

	/*
	 *	led register
	 */
	reg [31:0]		led_reg;

	/*
	 *	Current state
	 */
	integer			state = 0;

	/*
	 *	Possible states
	 */
	parameter		IDLE = 0;
	parameter		READ_BUFFER = 1;
	parameter		READ = 2;
	parameter		WRITE = 3;

	/*
	 *	Line buffer
	 */
	reg [31:0]		word_buf;

	/*
	 *	Read buffer
	 */
	wire [31:0]		read_buf;

	/*
	 *	Buffer to identify read or write operation
	 */
	reg			memread_buf;
	reg			memwrite_buf;

	/*
	 *	Buffers to store write data
	 */
	reg [31:0]		write_data_buffer;

	/*
	 *	Buffer to store address
	 */
	// Reflect changes in addr size
	//reg [31:0]		addr_buf;
	reg [13:0]			addr_buf;

	/*
	 *	Sign_mask buffer
	 */
	reg [3:0]		sign_mask_buf;

	/*
	 *	Block memory registers
	 *
	 *	(Bad practice: The constant for the size should be a `define).
	 */
	 //`define memsize = 1024;
	reg [31:0]		data_block[0:1024 - 1];

	/*
	 *	wire assignments
	 */
	wire [9:0]		addr_buf_block_addr;
	wire [1:0]		addr_buf_byte_offset;
	
	wire [31:0]		replacement_word;

	assign			addr_buf_block_addr	= addr_buf[11:2];
	assign			addr_buf_byte_offset	= addr_buf[1:0];

	/*
	 *	Regs for multiplexer output
	 */
	wire [7:0]		buf0;
	wire [7:0]		buf1;
	wire [7:0]		buf2;
	wire [7:0]		buf3;

	assign 			buf0	= word_buf[7:0];
	assign 			buf1	= word_buf[15:8];
	assign 			buf2	= word_buf[23:16];
	assign 			buf3	= word_buf[31:24];

	/*
	 *	Byte select decoder
	 */
	wire bdec_sig0;
	wire bdec_sig1;
	wire bdec_sig2;
	wire bdec_sig3;

	// Select byte 0 if both address buffer offset positions are 0
	assign bdec_sig0 = (~addr_buf_byte_offset[1]) & (~addr_buf_byte_offset[0]);
	// Select byte 1 if  address buffer offset is 01
	assign bdec_sig1 = (~addr_buf_byte_offset[1]) & (addr_buf_byte_offset[0]);
	// Select byte 2 if  address buffer offset is 10
	assign bdec_sig2 = (addr_buf_byte_offset[1]) & (~addr_buf_byte_offset[0]);
	// Select byte 3 if  address buffer offset is 11
	assign bdec_sig3 = (addr_buf_byte_offset[1]) & (addr_buf_byte_offset[0]);


	/*
	 *	Constructing the word to be replaced for write byte
	 */
	wire[7:0] byte_r0;
	wire[7:0] byte_r1;
	wire[7:0] byte_r2;
	wire[7:0] byte_r3;
 
	// Assign byte in write_data_buffer if that relevant byte is selected
	assign byte_r0 = (bdec_sig0==1'b1) ? write_data_buffer[7:0] : buf0;
	assign byte_r1 = (bdec_sig1==1'b1) ? write_data_buffer[7:0] : buf1;
	assign byte_r2 = (bdec_sig2==1'b1) ? write_data_buffer[7:0] : buf2;
	assign byte_r3 = (bdec_sig3==1'b1) ? write_data_buffer[7:0] : buf3;

	/*
	 *	For write halfword
	 */
	
	wire[15:0] halfword_r0;
	wire[15:0] halfword_r1;

	// Assign data in write_data_buffer to halfword if relevant halfword is selected
	assign halfword_r0 = (addr_buf_byte_offset[1]==1'b1) ? {buf1, buf0} : write_data_buffer[15:0];
	assign halfword_r1 = (addr_buf_byte_offset[1]==1'b1) ? write_data_buffer[15:0] : {buf3, buf2};

	/* a is sign_mask_buf[2], b is sign_mask_buf[1], c is sign_mask_buf[0] */
	// I.e., b= 1 if byte or halfword, c = 1 unless loading/storing, a = 1 if word

	// Select halfword
	wire write_select0;
	// Select fullword
	wire write_select1;
	
	wire[31:0] write_out1;
	// Replace write_out2 directly with the write_data_buffer to reduce wiring -> reduce power ?
		//wire[31:0] write_out2;
	
	assign write_select0 = ~sign_mask_buf[2] & sign_mask_buf[1];
	assign write_select1 = sign_mask_buf[2];
	
	assign write_out1 = (write_select0) ? {halfword_r1, halfword_r0} : {byte_r3, byte_r2, byte_r1, byte_r0};
	//assign write_out2 = (write_select0) ? 32'b0 : write_data_buffer;
	
	// Replacement word is write_out2 if we selected to write entire word
	// assign replacement_word = (write_select1) ? write_out2 : write_out1;
	assign replacement_word = (write_select1) ? write_data_buffer : write_out1;

	/*
	 *	Combinational logic for generating 32-bit read data
	 */
	
	wire select0;
	wire select1;
	wire select2;
	
	wire[31:0] out1;
	wire[31:0] out2;
	wire[31:0] out3;
	// Same as above, out4 seems to just hold {buf3, buf2, buf1, buf0} or else be 0; remove to reduce wiring -> reduce power?
		//wire[31:0] out4;
	wire[31:0] out5;
	wire[31:0] out6;

	/* a is sign_mask_buf[2], b is sign_mask_buf[1], c is sign_mask_buf[0]
	 * d is addr_buf_byte_offset[1], e is addr_buf_byte_offset[0]
	 */
	
	//~a~b~de + ~ade + ~abd
	assign select0 = (~sign_mask_buf[2] & ~sign_mask_buf[1] & ~addr_buf_byte_offset[1] & addr_buf_byte_offset[0]) | (~sign_mask_buf[2] & addr_buf_byte_offset[1] & addr_buf_byte_offset[0]) | (~sign_mask_buf[2] & sign_mask_buf[1] & addr_buf_byte_offset[1]);
	
	// ~a~bd + ab 
	// sign_mask_buf[2] = 1 only iff sign_mask_buf[1] = 1 -> sign_mask_buf[2] & sign_mask_buf[1] = sign_mask_buf[2] -> ~a~bd + a
	assign select1 = (~sign_mask_buf[2] & ~sign_mask_buf[1] & addr_buf_byte_offset[1]) | sign_mask_buf[2];
	
	// 1 when we are reading halfword or word
	assign select2 = sign_mask_buf[1]; // b
	
	assign out1 = (select0) ? ((sign_mask_buf[3]==1'b1) ? {{24{buf1[7]}}, buf1} : {24'b0, buf1}) : ((sign_mask_buf[3]==1'b1) ? {{24{buf0[7]}}, buf0} : {24'b0, buf0});
	assign out2 = (select0) ? ((sign_mask_buf[3]==1'b1) ? {{24{buf3[7]}}, buf3} : {24'b0, buf3}) : ((sign_mask_buf[3]==1'b1) ? {{24{buf2[7]}}, buf2} : {24'b0, buf2}); 
	assign out3 = (select0) ? ((sign_mask_buf[3]==1'b1) ? {{16{buf3[7]}}, buf3, buf2} : {16'b0, buf3, buf2}) : ((sign_mask_buf[3]==1'b1) ? {{16{buf1[7]}}, buf1, buf0} : {16'b0, buf1, buf0});
	//assign out4 = (select0) ? 32'b0 : {buf3, buf2, buf1, buf0};
	
	assign out5 = (select1) ? out2 : out1;
	// If out4 = 0, and select0 = select1 = 1, then out6 is 0 -> effectively OFF -> out4 only has an effect when it is non-zero
	assign out6 = (select1) ? {buf3, buf2, buf1, buf0} : out3;
	
	assign read_buf = (select2) ? out6 : out5;
	
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
		$readmemh("programs/data.hex", data_block);
		clk_stall = 0;
	end

	/*
	 *	LED register interfacing with I/O
	 */
	always @(posedge clk) begin
		if(memwrite == 1'b1 && addr == 32'h2000) begin
			led_reg <= write_data;
		end
	end

	/*
	 *	State machine
	 */
	always @(posedge clk) begin
		case (state)
			IDLE: begin
				clk_stall <= 0;
				memread_buf <= memread;
				memwrite_buf <= memwrite;
				write_data_buffer <= write_data;
				addr_buf <= addr;
				sign_mask_buf <= sign_mask;
				
				if(memwrite==1'b1 || memread==1'b1) begin
					state <= READ_BUFFER;
					clk_stall <= 1;
				end
			end

			READ_BUFFER: begin
				/*
				 *	Subtract out the size of the instruction memory.
				 *	(Bad practice: The constant should be a `define).
				 */
				//`define instruction_mem_size = 32'h1000;
				word_buf <= data_block[addr_buf_block_addr - 32'h1000];
				if(memread_buf==1'b1) begin
					state <= READ;
				end
				else if(memwrite_buf == 1'b1) begin
					state <= WRITE;
				end
			end

			READ: begin
				clk_stall <= 0;
				read_data <= read_buf;
				state <= IDLE;
			end

			WRITE: begin
				clk_stall <= 0;

				/*
				 *	Subtract out the size of the instruction memory.
				 *	(Bad practice: The constant should be a `define).
				 */
				//`define instruction_mem_size = 32'h1000;
				data_block[addr_buf_block_addr - 32'h1000] <= replacement_word;
				state <= IDLE;
			end

		endcase
	end

	/*
	 *	Test led
	 */
	assign led = led_reg[7:0];
endmodule
