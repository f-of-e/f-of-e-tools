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
 *	Forwarding Unit
 */



module ForwardingUnit(rs1, rs2, MEM_RegWriteAddr, WB_RegWriteAddr, MEM_RegWrite, WB_RegWrite, EX_CSRR_Addr, MEM_CSRR_Addr, WB_CSRR_Addr, MEM_CSRR, WB_CSRR, MEM_fwd1, MEM_fwd2, WB_fwd1, WB_fwd2);
	input [4:0]	rs1;
	input [4:0]	rs2;
	input [4:0]	MEM_RegWriteAddr;
	input [4:0]	WB_RegWriteAddr;
	input		MEM_RegWrite;
	input		WB_RegWrite;
	input [11:0]	EX_CSRR_Addr;
	input [11:0]	MEM_CSRR_Addr;
	input [11:0]	WB_CSRR_Addr;
	input		MEM_CSRR;
	input		WB_CSRR;
	output		MEM_fwd1;
	output		MEM_fwd2;
	output		WB_fwd1;
	output		WB_fwd2;

	/*
	 *	if data hazard detected, assign RegWrite to decide if...
	 *	result MEM or WB stage should be rerouted to ALU input
	 */
	assign MEM_fwd1 = (MEM_RegWriteAddr != 5'b0 && MEM_RegWriteAddr ==  rs1)?MEM_RegWrite:1'b0;
	assign MEM_fwd2 = (MEM_RegWriteAddr != 5'b0 && MEM_RegWriteAddr ==  rs2 && MEM_RegWrite == 1'b1) || (EX_CSRR_Addr == MEM_CSRR_Addr && MEM_CSRR == 1'b1)?1'b1:1'b0;

	/*
	 *	from wb stage
	 */
	assign WB_fwd1 = (WB_RegWriteAddr != 5'b0 && WB_RegWriteAddr ==  rs1 && WB_RegWriteAddr != MEM_RegWriteAddr)?WB_RegWrite:1'b0;
	assign WB_fwd2 = (WB_RegWriteAddr != 5'b0 && WB_RegWriteAddr ==  rs2 && WB_RegWrite == 1'b1 && WB_RegWriteAddr != MEM_RegWriteAddr) || (EX_CSRR_Addr == WB_CSRR_Addr && WB_CSRR == 1'b1 && MEM_CSRR_Addr != WB_CSRR_Addr)?1'b1:1'b0;

endmodule
