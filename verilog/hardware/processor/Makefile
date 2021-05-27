DESIGN	= sail_improved
# Original design: sail, Improved design: sail_improved
PROGRAM = bsorttry

# Makefile outputs the log file for yosys and nextpnr in .txt files

sail-nextpnr:
	cp programs/data.hex verilog/
	cp programs/program.hex verilog/
	yosys ../../../yscripts/$(DESIGN).ys -l $(DESIGN)_synthesis_$(PROGRAM).txt
	nextpnr-ice40 --timing-allow-fail --up5k --package uwg30 --json $(DESIGN).json --pcf pcf/$(DESIGN).pcf --asc $(DESIGN).asc -l $(DESIGN)_pnr_$(PROGRAM).txt
	icetime -p pcf/$(DESIGN).pcf -P uwg30 -d up5k -t $(DESIGN).asc
	icepack $(DESIGN).asc $(DESIGN).bin

# sudo iceprog -S $(DESIGN).bin

clean:
	rm -f *.json *.blif *.asc *.bin
