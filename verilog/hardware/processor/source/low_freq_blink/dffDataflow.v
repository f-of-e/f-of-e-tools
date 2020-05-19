module dff(
		input	D,
		input	clk,
		input	rst,
		output	Q,
	);

		wire	net0;
		wire	net1;
		wire	net2;
		wire	net3;
		wire	net4;
		wire	net5;
		wire	net6;
		wire	net7;
		wire	net8;

		assign net1 = ~(D & net0);
		assign net2 = ~(net1 & net0);
		assign net5 = ~(net1 & net4);
		assign net4 = ~(net5 & net2);
		assign net6 = ~(net5 & net3);
		assign net7 = ~(net6 & net3);
		assign Q = ~(net6 & net8);
		assign net8 = ~(Q & net7);
		assign net0 = ~clk;
		assign net3 = ~net0;
endmodule