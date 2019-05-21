module cmosInverter(inSignal, outSignal);
	input		inSignal;
	output		outSignal;

	supply1		vdd;
	supply0		gnd;

	pmos p1 (outSignal, vdd, inSignal);
	nmos n1 (outSignal, gnd, inSignal);
endmodule

