DESIGN	= sail

sail-arachnepnr:
	cp programs/data.hex verilog/
	cp programs/program.hex verilog/
	yosys -q ../../../yscripts/$(DESIGN).ys
	arachne-pnr -d 5k -P uwg30 -p pcf/$(DESIGN).pcf $(DESIGN).blif -o $(DESIGN).asc
	icepack $(DESIGN).asc $(DESIGN).bin
	sudo iceprog -S $(DESIGN).bin
	icetime -tmd up5k $(DESIGN).asc

sail-nextpnr:
	cp programs/data.hex verilog/
	cp programs/program.hex verilog/
	yosys -q ../../../yscripts/$(DESIGN).ys
	nextpnr-ice40 --up5k --package uwg30 --json $(DESIGN).json --pcf pcf/$(DESIGN).pcf --asc $(DESIGN).asc
	icepack $(DESIGN).asc $(DESIGN).bin
	sudo iceprog -S $(DESIGN).bin

clean:
	rm -f *.json *.blif *.asc *.bin
