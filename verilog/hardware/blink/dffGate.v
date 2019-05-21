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

		nand	nand0 (net1, D, net0);
		nand	nand1 (net2, net1, net0);
		nand	nand2 (net5, net1, net4);
		nand	nand3 (net4, net5, net2);
		nand	nand4 (net6, net5, net3);
		nand	nand5 (net7, net6, net3);
		nand	nand6 (Q, net6, net8);
		nand	nand7 (net8, Q, net7);
		not	not0 (net0, clk);
		not	not1 (net3, net0);
endmodule
