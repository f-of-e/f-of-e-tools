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
 *		This module implements the data cache.
 */



module data_mem (clk, addr, write_data, memwrite, memread, sign_mask, read_data, led, clk_stall);
	input			clk;
	input [31:0]		addr;
	input [31:0]		write_data;
	input			memwrite, memread;
	input [3:0]		sign_mask;
	output reg [31:0]	read_data;
	output [7:0]		led;
	output reg		clk_stall; //Sets the clock high

	//led register
	reg [31:0] led_reg;

	//state
	integer state = 0;

	parameter IDLE = 0;
	parameter READ_BUFFER = 1;
	//parameter SETUP_READ = 2;
	//parameter SETUP_WRITE = 3;
	parameter READ = 2;
	parameter WRITE = 3;

	//line buffer
	reg[255:0] line_buf;

	//read buffer
	reg[31:0] read_buf;

	//buffer to identify read or write operation
	reg memread_buf;
	reg memwrite_buf;

	//buffers to store write data
	reg[31:0] write_data_buffer;

	//buffer to store address
	reg[31:0] addr_buf;

	//sign_mas buffer
	reg[3:0] sign_mask_buf;

	//block memory registers
	reg[255:0] data_block[0:127];
	//reg[5:0] tag[0:7];
	//reg valid[0:7];

	//wire assignments
	wire[5:0] addr_buf_tag;
	wire[2:0] addr_buf_index;
	wire[8:0] addr_buf_block_addr;
	wire[2:0] addr_buf_word_offset;
	wire[1:0] addr_buf_byte_offset;
	assign addr_buf_tag = addr_buf[13:8];
	assign addr_buf_index = addr_buf[7:5];
	assign addr_buf_block_addr = addr_buf[13:5];
	assign addr_buf_word_offset = addr_buf[4:2];
	assign addr_buf_byte_offset = addr_buf[1:0];

	//regs for multiplexer output
	reg[7:0] buf0;
	reg[7:0] buf1;
	reg[7:0] buf2;
	reg[7:0] buf3;

	//combinational logic implementing a multiplexer to select word from block
	//put into 4 byte buffers
	always @(*) begin
		case(addr_buf_word_offset)
			3'b000: begin
				buf0 = line_buf[7:0];
				buf1 = line_buf[15:8];
				buf2 = line_buf[23:16];
				buf3 = line_buf[31:24];
			end

			3'b001: begin
				buf0 = line_buf[39:32];
				buf1 = line_buf[47:40];
				buf2 = line_buf[55:48];
				buf3 = line_buf[63:56];
			end

			3'b010: begin
				buf0 = line_buf[71:64];
				buf1 = line_buf[79:72];
				buf2 = line_buf[87:80];
				buf3 = line_buf[95:88];
			end

			3'b011: begin
				buf0 = line_buf[103:96];
				buf1 = line_buf[111:104];
				buf2 = line_buf[119:112];
				buf3 = line_buf[127:120];
			end

			3'b100: begin
				buf0 = line_buf[135:128];
				buf1 = line_buf[143:136];
				buf2 = line_buf[151:144];
				buf3 = line_buf[159:152];
			end

			3'b101: begin
				buf0 = line_buf[167:160];
				buf1 = line_buf[175:168];
				buf2 = line_buf[183:176];
				buf3 = line_buf[191:184];
			end

			3'b110: begin
				buf0 = line_buf[199:192];
				buf1 = line_buf[207:200];
				buf2 = line_buf[215:208];
				buf3 = line_buf[223:216];
			end

			3'b111: begin
				buf0 = line_buf[231:224];
				buf1 = line_buf[239:232];
				buf2 = line_buf[247:240];
				buf3 = line_buf[255:248];
			end
		endcase
	end

	/*
	*combinational logic to modify line for writing
	*/
	//word select decoder
	wire wdec_sig0;
	wire wdec_sig1;
	wire wdec_sig2;
	wire wdec_sig3;
	wire wdec_sig4;
	wire wdec_sig5;
	wire wdec_sig6;
	wire wdec_sig7;
	assign wdec_sig0 = (~addr_buf_word_offset[2]) & (~addr_buf_word_offset[1]) & (~addr_buf_word_offset[0]);
	assign wdec_sig1 = (~addr_buf_word_offset[2]) & (~addr_buf_word_offset[1]) & (addr_buf_word_offset[0]);
	assign wdec_sig2 = (~addr_buf_word_offset[2]) & (addr_buf_word_offset[1]) & (~addr_buf_word_offset[0]);
	assign wdec_sig3 = (~addr_buf_word_offset[2]) & (addr_buf_word_offset[1]) & (addr_buf_word_offset[0]);
	assign wdec_sig4 = (addr_buf_word_offset[2]) & (~addr_buf_word_offset[1]) & (~addr_buf_word_offset[0]);
	assign wdec_sig5 = (addr_buf_word_offset[2]) & (~addr_buf_word_offset[1]) & (addr_buf_word_offset[0]);
	assign wdec_sig6 = (addr_buf_word_offset[2]) & (addr_buf_word_offset[1]) & (~addr_buf_word_offset[0]);
	assign wdec_sig7 = (addr_buf_word_offset[2]) & (addr_buf_word_offset[1]) & (addr_buf_word_offset[0]);

	//byte select decoder
	wire bdec_sig0;
	wire bdec_sig1;
	wire bdec_sig2;
	wire bdec_sig3;
	assign bdec_sig0 = (~addr_buf_byte_offset[1]) & (~addr_buf_byte_offset[0]);
	assign bdec_sig1 = (~addr_buf_byte_offset[1]) & (addr_buf_byte_offset[0]);
	assign bdec_sig2 = (addr_buf_byte_offset[1]) & (~addr_buf_byte_offset[0]);
	assign bdec_sig3 = (addr_buf_byte_offset[1]) & (addr_buf_byte_offset[0]);

	//Constructing the word to be replaced
	//For write byte
	wire[7:0] byte_r0;
	wire[7:0] byte_r1;
	wire[7:0] byte_r2;
	wire[7:0] byte_r3;
	assign byte_r0 = (bdec_sig0==1'b1)?write_data_buffer[7:0]:buf0;
	assign byte_r1 = (bdec_sig1==1'b1)?write_data_buffer[7:0]:buf1;
	assign byte_r2 = (bdec_sig2==1'b1)?write_data_buffer[7:0]:buf2;
	assign byte_r3 = (bdec_sig3==1'b1)?write_data_buffer[7:0]:buf3;

	//For write halfword
	wire[15:0] halfword_r0;
	wire[15:0] halfword_r1;
	assign halfword_r0 = (addr_buf_byte_offset[1]==1'b1)?{buf1, buf0}:write_data_buffer[15:0];
	assign halfword_r1 = (addr_buf_byte_offset[1]==1'b1)?write_data_buffer[15:0]:{buf3, buf2};

	reg[31:0] replacement_word;
	always @(*) begin
		case (sign_mask_buf[2:0])
			3'b001: begin //byte
				replacement_word = {byte_r3, byte_r2, byte_r1, byte_r0};
			end
			3'b011: begin //halfword
				replacement_word = {halfword_r1, halfword_r0};
			end
			3'b111: begin //word
				replacement_word = write_data_buffer;
			end
			default: begin
				//do nothing
			end
		endcase
	end

	//Multiplexers that select which word is replaced
	wire[31:0] w0;
	wire[31:0] w1;
	wire[31:0] w2;
	wire[31:0] w3;
	wire[31:0] w4;
	wire[31:0] w5;
	wire[31:0] w6;
	wire[31:0] w7;
	assign w0 = (wdec_sig0==1'b1)?replacement_word:line_buf[31:0];
	assign w1 = (wdec_sig1==1'b1)?replacement_word:line_buf[63:32];
	assign w2 = (wdec_sig2==1'b1)?replacement_word:line_buf[95:64];
	assign w3 = (wdec_sig3==1'b1)?replacement_word:line_buf[127:96];
	assign w4 = (wdec_sig4==1'b1)?replacement_word:line_buf[159:128];
	assign w5 = (wdec_sig5==1'b1)?replacement_word:line_buf[191:160];
	assign w6 = (wdec_sig6==1'b1)?replacement_word:line_buf[223:192];
	assign w7 = (wdec_sig7==1'b1)?replacement_word:line_buf[255:224];

	/*
	* Combinational logic for generating 32-bit read data
	*/
	always @(*) begin
		case(sign_mask_buf[2:0])
			3'b001: begin //Byte
				case(addr_buf_byte_offset)
					2'b00: begin
						read_buf = (sign_mask_buf[3]==1'b1)?{{24{buf0[7]}}, buf0}:{24'b0, buf0};
					end
					2'b01: begin
						read_buf = (sign_mask_buf[3]==1'b1)?{{24{buf1[7]}}, buf1}:{24'b0, buf1};
					end
					2'b10: begin
						read_buf = (sign_mask_buf[3]==1'b1)?{{24{buf2[7]}}, buf2}:{24'b0, buf2};
					end
					2'b11: begin
						read_buf = (sign_mask_buf[3]==1'b1)?{{24{buf3[7]}}, buf3}:{24'b0, buf3};
					end
				endcase
			end

			3'b011: begin //Halfword
				case(addr_buf_byte_offset[1])
					1'b0: begin
						read_buf = (sign_mask_buf[3]==1'b1)?{{16{buf1[7]}}, buf1, buf0}:{16'b0, buf1, buf0};
					end
					1'b1: begin
						read_buf = (sign_mask_buf[3]==1'b1)?{{16{buf3[7]}}, buf3, buf2}:{16'b0, buf3, buf2};
					end
				endcase
			end

			3'b111: begin //Word
				read_buf = {buf3, buf2, buf1, buf0};
			end

			default: begin
				//do nothing
			end
		endcase
	end

	//LED register interfacing with I/O
	always @(posedge clk) begin
		if(memwrite == 1'b1 && addr == 32'h2000) begin
			led_reg <= write_data;
		end
	end

	//BRAM implementation

	initial begin
		$readmemh("simulation/data.hex", data_block);
		clk_stall = 0;
	end

	always @(posedge clk) begin
		case (state)
			IDLE: begin
				clk_stall <= 0;
				memread_buf <= memread;
				memwrite_buf <= memwrite;
				write_data_buffer <= write_data;
				addr_buf <= addr;
				sign_mask_buf <= sign_mask;
				line_buf <= data_block[addr[13:5]];
				if(memwrite==1'b1 || memread==1'b1) begin
					state <= READ_BUFFER;
					clk_stall <= 1;
				end
			end

			READ_BUFFER: begin
				line_buf <= data_block[addr_buf_block_addr];
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
				data_block[addr_buf_block_addr] <= {w7, w6, w5, w4, w3, w2, w1, w0};
				state <= IDLE;
			end

		endcase
	end

	//test led
	assign led = led_reg[7:0];

endmodule
