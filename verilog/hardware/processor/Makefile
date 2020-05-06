DESIGN	= sail

sail-nextpnr:
	cp programs/data.hex verilog/
	cp programs/program.hex verilog/
	yosys -q ../../../yscripts/$(DESIGN).ys
	nextpnr-ice40 --up5k --package uwg30 --json $(DESIGN).json --pcf pcf/$(DESIGN).pcf --asc $(DESIGN).asc
	icetime -p pcf/sail.pcf -P uwg30 -d up5k -t sail.asc
	icepack $(DESIGN).asc $(DESIGN).bin
	sudo iceprog -S $(DESIGN).bin

clean:
	rm -f *.json *.blif *.asc *.bin
