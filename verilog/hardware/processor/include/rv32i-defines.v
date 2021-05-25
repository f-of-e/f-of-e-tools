/*
	Authored 2019, Phillip Stanley-Marbell.

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
 *	7-bit RISC-V opcode field
 */
`define kRV32I_INSTRUCTION_OPCODE_LUI			7'b0110111
`define kRV32I_INSTRUCTION_OPCODE_AUIPC			7'b0010111
`define kRV32I_INSTRUCTION_OPCODE_JAL			7'b1101111
`define kRV32I_INSTRUCTION_OPCODE_JALR			7'b1100111
`define kRV32I_INSTRUCTION_OPCODE_BRANCH		7'b1100011
`define kRV32I_INSTRUCTION_OPCODE_LOAD			7'b0000011
`define kRV32I_INSTRUCTION_OPCODE_STORE			7'b0100011
`define kRV32I_INSTRUCTION_OPCODE_IMMOP			7'b0010011
`define kRV32I_INSTRUCTION_OPCODE_ALUOP			7'b0110011
`define kRV32I_INSTRUCTION_OPCODE_CSRR			7'b1110011
