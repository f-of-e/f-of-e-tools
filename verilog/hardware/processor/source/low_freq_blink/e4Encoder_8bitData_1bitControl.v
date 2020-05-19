/*
 *	Authored 2015--2016. Phillip Stanley-Marbell.
 *
 *	This work is based in part on the publications:
 *	*	P. Stanley-Marbell and M. Rinard. "Value-Deviation-
 *		Bounded Serial Data Encoding for Energy-Efficient
 *		Approximate Communication", MIT-CSAIL-TR-2015-022, 2015.
 *
 *	*	P. Stanley-Marbell and M. Rinard. "Efficiency Limits for
 *		Value-Deviation-Bounded Approximate Communication", 
 *		IEEE Embedded Systems Letters Journal, 2015.
 *
 *	*	P. Stanley-Marbell and M. Rinard, "Reducing Serial I/O Power
 *		in Error-Tolerant Applications by Efficient Lossy Encoding",
 *		IEEE/ACM DAC 2016.
 *
 *	All rights reserved.
 *
 *	Redistribution and use in source and binary forms, with or without
 *	modification, are permitted provided that the following conditions
 *	are met:
 *
 *	*	Redistributions of source code must retain the above
 *		copyright notice, this list of conditions and the following
 *		disclaimer.
 *
 *	*	Redistributions in binary form must reproduce the above
 *		copyright notice, this list of conditions and the following
 *		disclaimer in the documentation and/or other materials
 *		provided with the distribution.
 *
 *	*	Neither the name of the author nor the names of its
 *		contributors may be used to endorse or promote products
 *		derived from this software without specific prior written
 *		permission.
 *
 *	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *	"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *	LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *	FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *	COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 *	INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 *	BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *	CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 *	LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 *	ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *	POSSIBILITY OF SUCH DAMAGE.
 */



module e4Encoder_8bitData_1bitControl(dataIn, worstCaseDeviationCode, encoderOut);
	input		[7:0]	dataIn;
	input		[0:0]	worstCaseDeviationCode;
	output reg	[7:0]	encoderOut;

	reg		[7:0]	M1encoderOut;

	reg		[7:0]	M1dataIn;



	always @ (*)
	begin
		case (worstCaseDeviationCode)
			1'b0:
			begin
				M1dataIn = 8'h00;
			end

			1'b1:
			begin
				M1dataIn = dataIn;
			end
		endcase



		/*
		 *	M1dataIn => worst-case deviation is '10'
		 */
		case (M1dataIn)
			8'h00,8'h01,8'h02,8'h03,
			8'h04,8'h05,8'h06,8'h07,
			8'h08,8'h09,8'h0A	: M1encoderOut = 8'h00;
			8'h0B			: M1encoderOut = 8'h01;
			8'h0C,8'h0D		: M1encoderOut = 8'h03;
			8'h0E,8'h10,8'h11	: M1encoderOut = 8'h07;
			8'h0F,8'h12,8'h13,8'h14,
			8'h15,8'h16,8'h17,8'h18,
			8'h19			: M1encoderOut = 8'h0F;
			8'h1A,8'h1B,8'h1C,8'h1D,
			8'h1E,8'h1F,8'h20,8'h21,
			8'h22,8'h23,8'h24,8'h25,
			8'h26,8'h27,8'h28,8'h29	: M1encoderOut = 8'h1F;
			8'h2A			: M1encoderOut = 8'h20;
			8'h2B,8'h2C,8'h2D,8'h2E,
			8'h2F,8'h30,8'h31,8'h32,
			8'h33,8'h34		: M1encoderOut = 8'h30;
			8'h35,8'h36,8'h37,8'h38,
			8'h39,8'h3A,8'h3B,8'h3C,
			8'h3D,8'h3E,8'h3F,8'h40,
			8'h41,8'h42,8'h43,8'h44,
			8'h45,8'h46,8'h47,8'h48,
			8'h49			: M1encoderOut = 8'h3F;
			8'h4A			: M1encoderOut = 8'h40;
			8'h4B			: M1encoderOut = 8'h41;
			8'h4C,8'h4D		: M1encoderOut = 8'h43;
			8'h4E,8'h50,8'h51	: M1encoderOut = 8'h47;
			8'h4F,8'h52,8'h53,8'h54,
			8'h55			: M1encoderOut = 8'h4F;
			8'h56,8'h57,8'h58,8'h59,
			8'h5A,8'h5B,8'h5C,8'h5D,
			8'h5E,8'h5F,8'h60,8'h61,
			8'h62,8'h63,8'h64,8'h65,
			8'h66,8'h67,8'h68,8'h69,
			8'h6A			: M1encoderOut = 8'h60;
			8'h6B,8'h6C,8'h6D,8'h6E,
			8'h6F,8'h70,8'h71,8'h72,
			8'h73,8'h74		: M1encoderOut = 8'h70;
			8'h75,8'h76,8'h77,8'h78,
			8'h79,8'h7A,8'h7B,8'h7C,
			8'h7D,8'h7E,8'h7F,8'h81,
			8'h82,8'h83,8'h84,8'h85,
			8'h86,8'h87,8'h88,8'h89	: M1encoderOut = 8'h7F;
			8'h80,8'h8A		: M1encoderOut = 8'h80;
			8'h8B			: M1encoderOut = 8'h81;
			8'h8C,8'h8D		: M1encoderOut = 8'h83;
			8'h8E,8'h90,8'h91	: M1encoderOut = 8'h87;
			8'h8F,8'h92,8'h93,8'h94,
			8'h95,8'h96,8'h97,8'h98,
			8'h99			: M1encoderOut = 8'h8F;
			8'h9A,8'h9B,8'h9C,8'h9D,
			8'h9E,8'h9F,8'hA0,8'hA1,
			8'hA2,8'hA3,8'hA4,8'hA5,
			8'hA6,8'hA7,8'hA8,8'hA9	: M1encoderOut = 8'h9F;
			8'hAA			: M1encoderOut = 8'hA0;
			8'hAB,8'hAC,8'hAD,8'hAE,
			8'hAF,8'hB0,8'hB1,8'hB2,
			8'hB3,8'hB4		: M1encoderOut = 8'hB0;
			8'hB5			: M1encoderOut = 8'hBF;
			8'hB6,8'hB7,8'hB8,8'hB9,
			8'hBA,8'hBB,8'hBC,8'hBD,
			8'hBE,8'hBF,8'hC0,8'hC1,
			8'hC2,8'hC3,8'hC4,8'hC5,
			8'hC6,8'hC7,8'hC8,8'hC9,
			8'hCA			: M1encoderOut = 8'hC0;
			8'hCB			: M1encoderOut = 8'hC1;
			8'hCC,8'hCD		: M1encoderOut = 8'hC3;
			8'hCE,8'hD0,8'hD1	: M1encoderOut = 8'hC7;
			8'hCF,8'hD2,8'hD3,8'hD4,
			8'hD5			: M1encoderOut = 8'hCF;
			8'hD6,8'hD7,8'hD8,8'hD9,
			8'hDA,8'hDB,8'hDC,8'hDD,
			8'hDE,8'hDF,8'hE0,8'hE1,
			8'hE2,8'hE3,8'hE4,8'hE5,
			8'hE6,8'hE7,8'hE8,8'hE9,
			8'hEA			: M1encoderOut = 8'hE0;
			8'hEB,8'hEC,8'hED,8'hEE,
			8'hEF,8'hF0,8'hF1,8'hF2,
			8'hF3,8'hF4		: M1encoderOut = 8'hF0;
			8'hF5,8'hF6,8'hF7,8'hF8,
			8'hF9,8'hFA,8'hFB,8'hFC,
			8'hFD,8'hFE,8'hFF	: M1encoderOut = 8'hFF;
			default			: M1encoderOut = 8'h00;
		endcase /* M1dataIn */



		/*
		 *	Select the final output from amongst the sub-encoder blocks.
		 */
		case (worstCaseDeviationCode)
			1'b0: encoderOut = dataIn;
			1'b1: encoderOut = M1encoderOut;
			default	: encoderOut = dataIn;
		endcase
	end /* always @ (*) */
endmodule /* e4Encoder_8bitData_1bitControl */

