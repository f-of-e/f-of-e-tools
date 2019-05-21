module instruction_cache_tb();
	reg clk = 0;
	reg[31:0] addr;
	wire[31:0] out;
	wire clk_stall;

	//cache-memory interface
	wire[8:0] block_addr;
	wire[255:0] new_line_read;
	wire readmem;

	instruction_cache instr_cache_inst(
		.clk(clk),
		.addr(addr),
		.out(out),
		.clk_stall(clk_stall),
		.mem_block_addr(block_addr),
		.new_line(new_line_read),
		.readmem(readmem)
	);

	main_memory main_mem(
		.clk(clk),
		.block_addr(block_addr),
		.readmem(readmem),
		.writemem(1'b0),
		.data_write(256'b0),
		.data_read(new_line_read)
	);


	//simulation
	always
	 #1 clk = ~clk;

	initial begin
		$dumpfile ("instruction_cache.vcd");
	 	$dumpvars;

	 	#5

	 	//write byte
	 	addr = 32'b0;

	 	#2

	 	//rest
	 	addr = 32'b1;

	 	#20

	 	//read signed byte
	 	addr = 32'b10;

	 	#2

	 	//rest
	 	addr = 32'b11;

	 	#20

	 	//read unsigned byte
	 	addr = 32'b100;

		#2

	 	//rest
	 	addr = 32'b101;

	 	#20

	 	//write halfword
	 	addr = 32'b110;

		#2

	 	//rest
	 	addr = 32'b111;

		#20

	 	//read signed halfword
	 	addr = 32'b1000;

		#2

	 	//rest
	 	addr = 32'b1001;

		#20

	 	//read unsigned halfword
	 	addr = 32'b1010;

		#2

	 	//rest
	 	addr = 32'b1011;

	 	#20

	 	//write word
	 	addr = 32'b1100;

		#2

	 	//rest
	 	addr = 32'b1101;

		#20

	 	//read word
	 	addr = 32'b1110;

		#2

	 	//rest
	 	addr = 32'b1111;

		#40

	 	$finish;
	end

endmodule
