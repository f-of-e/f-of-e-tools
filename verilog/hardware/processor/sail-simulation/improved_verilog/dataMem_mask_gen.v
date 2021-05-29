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
 *	mask for loads/stores in data memory
 */



module sign_mask_gen(func3, sign_mask);
	input [2:0]	func3;
	output [3:0]	sign_mask;

	reg [2:0]	mask;

	/*
	 *	sign - for LBU and LHU the sign bit is 0, indicating read data should be zero extended, otherwise sign extended
	 *	mask - for determining if the load/store operation is on word, halfword or byte
	 *
	 *	TODO - a Karnaugh map should be able to describe the mask without case, the case is for reading convenience
	*/

	always @(*) begin
		case(func3[1:0])
			2'b00: mask = 3'b001;	// byte only
			2'b01: mask = 3'b011;	// halfword
			2'b10: mask = 3'b111;	// word
			default: mask = 3'b000;	// should not happen for loads/stores
		endcase
	end

	assign sign_mask = {(~func3[2]), mask};
endmodule
