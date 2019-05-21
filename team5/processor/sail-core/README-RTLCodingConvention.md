# RTL Coding Convention
This document outlines the notational conventions we follow in all our RTL implementations in the Physical Computation Laboratory. Where relevant, the descriptions below state the motivation for chosing these particular conventions.

## 1.   Authorship Notice
Include this at the start of each file.
```verilog
/*
	Authored 2019, <Author Name Here>.

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
```

## 2.   Signal Names
   i. Signal names lowercase. I see an aesthetic argument in favor of underscores in the hardware case, as opposed to camelCase in the software case.

   ii. Use the suffix `_register` for signals that are single-bit registers (flip-flops) or multi-bit registers.

   iii. Use the suffix `_latch` for signals that you really intend to be non-clocke, level-sensitive, memory elements (latches).

   iv. Use suffix `_N` for active-low signals.


## 3.   Signal Declarations

   i. One type specifier per signal and end the line with a comment on the signal's use where appropriate. So,
   ```verilog
   wire  ipsa_spi_cs_N;	/*  SPI chip select, at Ipsa module interface.          */
   wire  ipsa_spi_miso;    /*  SPI master out slave in, at Ipsa module interface.  */
   ```
   but not
   ```verilog
   wire  ipsa_spi_cs_N, ipsa_spi_miso;
   ```
   ii. Keep all port definitions and variable definitions at the top of the module, grouped by type (e.g., `input`, `output`, and `inout` grouped together, followed by `wire`, then `reg`.

   iii. Use the following convention for ordering the signal arguments of a module<sup>1</sup>: `inout` signals first, followed by `output` signals, with `input` signals last.

## 4.   Indentation
Indent with tabs, not spaces. Identing with tabs allows you to convey semantic information about the level of indentation; indenting with spaces does not let you provide as clear semantic intent. Set editor to render tabs as 8-spaces-wide.

## 5.   Width of content per line and wrapping
Keep the length of lines short. One reasonable guide is to stick to less than 100 characters per line and manually break lines rather than requiring the editor to automatically visually wrap them.

## 6.   Comments
```verilog
/*
 *  C-style block comments with the comment text offset from the asterisk by a tab.
 */
```

## 7.   Constants and `define`s
All constants begin with `k<namespace>`. So, e.g., in Ipsa design constants which are conceptually part of the overall Ipsa design are `kIpsaXXX`.

## 8.   Type names and alignment
Type names (along with any width specification) in the first column, with instance names aligned in second column.

```verilog
  wire                                barrier_done_wire;
  wire [(`kIpsaWireWidth-1):0]        i2c_address;
```

## 9. Newlines, carriage returns, and whitespace

   i. Line endings are Unix line endings (newline only, no carriage return).

   ii. A newline should never come after whitespace (space or tab).


## 10.   Files

   i. One module per file.

   ii. The file name should mirror the name of the module it contains.

   iii. All constants in a separate file to be included from other design files.
   
   iv. File name extensions should match file type: shell scripts should have the `.sh` suffix, Verilog files the `.v` suffix, etc.

----
<sup>1</sup> This convention is specifically borrowed from Monty Dalrymple's Z80 RTL design.
