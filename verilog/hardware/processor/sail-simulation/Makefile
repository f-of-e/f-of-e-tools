DESIGN	= sail_improved

sail-nextpnr:
	cp programs/data.hex improved_verilog/
	cp programs/program.hex improved_verilog/
	yosys -q ../../../yscripts/$(DESIGN).ys
	nextpnr-ice40 --up5k --package uwg30 --json $(DESIGN).json --pcf pcf/$(DESIGN).pcf --asc $(DESIGN).asc
	icetime -p pcf/sail.pcf -P uwg30 -d up5k -t sail.asc
	icepack $(DESIGN).asc $(DESIGN).bin
	sudo iceprog -S $(DESIGN).bin

sail-simulation:
	verilator -Wall -Wno-UNOPTFLAT --cc -f required_modules.txt config.vlt -Isail-core/include improved_verilog/config.v --trace --top-module top_sim --exe top_sim.cpp -Mdir verilator_sim -CFLAGS "-g -O3"
	make -j -C verilator_sim -f Vtop_sim.mk
	verilator_sim/Vtop_sim

clean:
	rm -f *.json *.blif *.asc *.bin
