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



`include "../include/rv32i-defines.v"
`include "../include/sail-core-defines.v"



/*
 *	Description:
 *
 *		This module implements the ALU control unit
 */



module ALUControl(FuncCode, ALUCtl, Opcode);
	input [3:0]		FuncCode;
	input [6:0]		Opcode;
	output reg [6:0]	ALUCtl;

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
		ALUCtl = 7'b0;
	end



	/*
	 *	TODO:
	 *
	 *	(1) Please replace the values being assigned to ALUCtl with the corresponding `defines in sail-core-defines.v
	 *	(2) Please replace the FuncCode constants with the corresponding `defines in sail-core-defines.v
	 */



	always @(*) begin
		case (Opcode)
			/*
			 *	LUI, U-Type
			 */
			`kRV32I_INSTRUCTION_OPCODE_LUI:
				ALUCtl = 7'b0000010;

			/*
			 *	AUIPC, U-Type
			 */
			`kRV32I_INSTRUCTION_OPCODE_AUIPC:
				ALUCtl = 7'b0000010;

			/*
			 *	JAL, UJ-Type
			 */
			`kRV32I_INSTRUCTION_OPCODE_JAL:
				ALUCtl = `kSAIL_MICROARCHITECTURE_ALUCTL_6to0_ILLEGAL;

			/*
			 *	JALR, I-Type
			 */
			`kRV32I_INSTRUCTION_OPCODE_JALR:
				ALUCtl = `kSAIL_MICROARCHITECTURE_ALUCTL_6to0_ILLEGAL;

			/*
			 *	Branch, SB-Type
			 */
			`kRV32I_INSTRUCTION_OPCODE_BRANCH:
				case (FuncCode[2:0])
					3'b000:
						ALUCtl = 7'b0010110; //BEQ conditions
					3'b001:
						ALUCtl = 7'b0100110; //BNE conditions
					3'b100:
						ALUCtl = 7'b0110110; //BLT conditions
					3'b101:
						ALUCtl = 7'b1000110; //BGE conditions
					3'b110:
						ALUCtl = 7'b1010110; //BLTU conditions
					3'b111:
						ALUCtl = 7'b1100110; //BGEU conditions
					default:
						ALUCtl = `kSAIL_MICROARCHITECTURE_ALUCTL_6to0_ILLEGAL;
				endcase

			/*
			 *	Loads, I-Type
			 */
			`kRV32I_INSTRUCTION_OPCODE_LOAD:
				case (FuncCode[2:0])
					3'b000:
						ALUCtl = 7'b0000010; //LB
					3'b001:
						ALUCtl = 7'b0000010; //LH
					3'b010:
						ALUCtl = 7'b0000010; //LW
					3'b100:
						ALUCtl = 7'b0000010; //LBU
					3'b101:
						ALUCtl = 7'b0000010; //LHU
					default:
						ALUCtl = `kSAIL_MICROARCHITECTURE_ALUCTL_6to0_ILLEGAL;
				endcase

			/*
			 *	Stores, S-Type
			 */
			`kRV32I_INSTRUCTION_OPCODE_STORE:
				case (FuncCode[2:0])
					3'b000:
						ALUCtl = 7'b0000010; //SB
					3'b001:
						ALUCtl = 7'b0000010; //SH
					3'b010:
						ALUCtl = 7'b0000010; //SW
					default:
						ALUCtl = `kSAIL_MICROARCHITECTURE_ALUCTL_6to0_ILLEGAL;
				endcase

			/*
			 *	Immediate operations, I-Type
			 */
			`kRV32I_INSTRUCTION_OPCODE_IMMOP:
				case (FuncCode[2:0])
					3'b000:
						ALUCtl = 7'b0000010; //ADDI
					3'b010:
						ALUCtl = 7'b0000111; //SLTI
					3'b011:
						ALUCtl = 7'b0000111; //SLTIU
					3'b100:
						ALUCtl = 7'b0001000; //XORI
					3'b110:
						ALUCtl = 7'b0000001; //ORI
					3'b111:
						ALUCtl = 7'b0000000; //ANDI
					3'b001:
						ALUCtl = 7'b0000101; //SLLI
					3'b101:
						case (FuncCode[3])
							1'b0:
								ALUCtl = 7'b0000011; //SRLI
							1'b1:
								ALUCtl = 7'b0000100; //SRAI
							default:
								ALUCtl = `kSAIL_MICROARCHITECTURE_ALUCTL_6to0_ILLEGAL;
						endcase
					default:
						ALUCtl = `kSAIL_MICROARCHITECTURE_ALUCTL_6to0_ILLEGAL;
				endcase

			/*
			 *	ADD SUB & logic shifts, R-Type
			 */
			`kRV32I_INSTRUCTION_OPCODE_ALUOP:
				case (FuncCode[2:0])
					3'b000:
						case(FuncCode[3])
							1'b0:
								ALUCtl = 7'b0000010; //ADD
							1'b1:
								ALUCtl = 7'b0000110; //SUB
							default:
								ALUCtl = `kSAIL_MICROARCHITECTURE_ALUCTL_6to0_ILLEGAL;
						endcase
					3'b001:
						ALUCtl = 7'b0000101; //SLL
					3'b010:
						ALUCtl = 7'b0000111; //SLT
					3'b011:
						ALUCtl = 7'b0000111; //SLTU
					3'b100:
						ALUCtl = 7'b0001000; //XOR
					3'b101:
						case(FuncCode[3])
							1'b0:
								ALUCtl = 7'b0000011; //SRL
							1'b1:
								ALUCtl = 7'b0000100; //SRA untested
							default:
								ALUCtl = `kSAIL_MICROARCHITECTURE_ALUCTL_6to0_ILLEGAL;
						endcase
					3'b110:
						ALUCtl = 7'b0000001; //OR
					3'b111:
						ALUCtl = 7'b0000000; //AND
					default:
						ALUCtl = `kSAIL_MICROARCHITECTURE_ALUCTL_6to0_ILLEGAL;
				endcase

			`kRV32I_INSTRUCTION_OPCODE_CSRR:
				case (FuncCode[1:0]) //use lower 2 bits of FuncCode to determine operation
					2'b01:
						ALUCtl = 7'b0001001; //CSRRW
					2'b10:
						ALUCtl = 7'b0001010; //CSRRS
					2'b11:
						ALUCtl = 7'b0001011; //CSRRC
					default:
						ALUCtl = `kSAIL_MICROARCHITECTURE_ALUCTL_6to0_ILLEGAL;
				endcase

			default:
				ALUCtl = `kSAIL_MICROARCHITECTURE_ALUCTL_6to0_ILLEGAL;
		endcase
	end
endmodule
