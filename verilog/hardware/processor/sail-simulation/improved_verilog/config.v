// DSP blocks

// `define USE_ADDER_DSP
// `define USE_SUBTRACTOR_DSP

 
// Clock

//`define USE_PLL_CLK
`define CLK_PLL_DIVF 0
`define CLK_PLL_DIVR 1
`define CLK_PLL_DIVQ 0
`define CLK_PLL_DIV_REG 2  // must be undefined or at least 1

`define CLK_NOPLL_DIV "0b11"


// branch prediction

//`define USE_CORRELATING


// memory

`define USE_SMALL_DATA_ADDR
`define USE_MEMORY_OPTIMIZATIONS