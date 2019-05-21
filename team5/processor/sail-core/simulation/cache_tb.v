module cache_tb();
	reg clk = 0;

	reg[31:0] addr;
	reg[31:0] write_val;
	wire[31:0] read_val;
	reg memwrite;
	reg memread;
	reg [3:0] sign_mask;
	wire [7:0] led;
	wire clk_stall;

	cache cache_inst(
		.clk(clk),
		.addr(addr),
		.write_data(write_val),
		.memwrite(memwrite),
		.memread(memread),
		.sign_mask(sign_mask),
		.read_data(read_val),
		.led(led),
		.clk_stall(clk_stall)
	);


	//simulation
	always
	 #1 clk = ~clk;

	initial begin
		$dumpfile ("cache.vcd");
	 	$dumpvars;

	 	#5

	 	//write byte
	 	addr = 32'b10000000000;
		write_val = 32'b101010101010;
		memwrite = 1'b1;
		memread = 1'b0;
		sign_mask = 4'b0001;

	 	#2

	 	//rest
	 	addr = 32'b10000000000;
		write_val = 32'b101010101010;
		memwrite = 1'b0;
		memread = 1'b0;
		sign_mask = 4'b0001;

	 	#20

	 	//read signed byte
	 	addr = 32'b10000000000;
		write_val = 32'b101010101010;
		memwrite = 1'b0;
		memread = 1'b1;
		sign_mask = 4'b1001;

	 	#2

	 	//rest
	 	addr = 32'b10000000000;
		write_val = 32'b101010101010;
		memwrite = 1'b0;
		memread = 1'b0;
		sign_mask = 4'b1001;

	 	#20

	 	//read unsigned byte
	 	addr = 32'b10000000000;
		write_val = 32'b101010101010;
		memwrite = 1'b0;
		memread = 1'b1;
		sign_mask = 4'b0001;

		#2

	 	//rest
	 	addr = 32'b10000000000;
		write_val = 32'b101010101010;
		memwrite = 1'b0;
		memread = 1'b0;
		sign_mask = 4'b0001;

	 	#20

	 	//write halfword
	 	addr = 32'b100000000;
		write_val = 32'b101010101010101010;
		memwrite = 1'b1;
		memread = 1'b0;
		sign_mask = 4'b0011;

		#2

	 	//rest
	 	addr = 32'b100000000;
		write_val = 32'b101010101010101010;
		memwrite = 1'b0;
		memread = 1'b0;
		sign_mask = 4'b0011;

		#20

	 	//read signed halfword
	 	addr = 32'b100000000;
		write_val = 32'b101010101010101010;
		memwrite = 1'b0;
		memread = 1'b1;
		sign_mask = 4'b1011;

		#2

	 	//rest
	 	addr = 32'b100000000;
		write_val = 32'b101010101010101010;
		memwrite = 1'b0;
		memread = 1'b0;
		sign_mask = 4'b1011;

		#20

	 	//read unsigned halfword
	 	addr = 32'b100000000;
		write_val = 32'b101010101010101010;
		memwrite = 1'b0;
		memread = 1'b1;
		sign_mask = 4'b0011;

		#2

	 	//rest
	 	addr = 32'b100000000;
		write_val = 32'b101010101010101010;
		memwrite = 1'b0;
		memread = 1'b0;
		sign_mask = 4'b0011;

	 	#20

	 	//write word
	 	addr = 32'b1000000;
		write_val = 32'b10101010101010101010101010101010;
		memwrite = 1'b1;
		memread = 1'b0;
		sign_mask = 4'b0111;

		#2

	 	//rest
	 	addr = 32'b1000000;
		write_val = 32'b10101010101010101010101010101010;
		memwrite = 1'b0;
		memread = 1'b0;
		sign_mask = 4'b0111;

		#20

	 	//read word
	 	addr = 32'b1000000;
		write_val = 32'b10101010101010101010101010101010;
		memwrite = 1'b0;
		memread = 1'b1;
		sign_mask = 4'b0111;

		#2

	 	//rest
	 	addr = 32'b1000000;
		write_val = 32'b10101010101010101010101010101010;
		memwrite = 1'b0;
		memread = 1'b0;
		sign_mask = 4'b0111;

		#40

	 	$finish;
	end

endmodule
