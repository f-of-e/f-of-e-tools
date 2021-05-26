DESIGN	= sail_improved
# Original design: sail, Improved design: sail_improved
PROGRAM = bsorttry

# Makefile outputs the log file for yosys and nextpnr in .txt files

sail-nextpnr:
	cp programs/data.hex verilog/
	cp programs/program.hex verilog/
	yosys ../../../yscripts/$(DESIGN).ys -l $(DESIGN)_synthesis_$(PROGRAM).txt
<<<<<<< HEAD
	nextpnr-ice40 --up5k --package uwg30 --json $(DESIGN).json --pcf pcf/$(DESIGN).pcf --asc $(DESIGN).asc -l $(DESIGN)_pnr_$(PROGRAM).txt
	icetime -p pcf/sail.pcf -P uwg30 -d up5k -t sail.asc
=======
	nextpnr-ice40 -q --up5k --package uwg30 --json $(DESIGN).json --pcf pcf/$(DESIGN).pcf --asc $(DESIGN).asc -l $(DESIGN)_pnr_$(PROGRAM).txt
	icetime -p pcf/sail.pcf -P uwg30 -d up5k -t sail.asc > $(DESIGN)_icetime_$(PROGRAM).txt
>>>>>>> resource-stuffs
	icepack $(DESIGN).asc $(DESIGN).bin

# sudo iceprog -S $(DESIGN).bin

clean:
	rm -f *.json *.blif *.asc *.bin
