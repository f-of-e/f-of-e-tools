DESIGN	= sail

sail-nextpnr:
	cp programs/data.hex verilog/
	cp programs/program.hex verilog/
	yosys ../../../yscripts/$(DESIGN).ys > processor_yosys_log.txt 2>&1
	nextpnr-ice40 --up5k --package uwg30 --json $(DESIGN).json --pcf pcf/$(DESIGN).pcf --asc $(DESIGN).asc > processor_nextpnr_log.txt 2>&1
	echo "icetime:" > processor_ice_log.txt
	icetime -p pcf/sail.pcf -P uwg30 -d up5k -t sail.asc >> processor_ice_log.txt 2>&1
	echo "icepack:" >> processor_ice_log.txt
	icepack $(DESIGN).asc $(DESIGN).bin >> processor_ice_log.txt 2>&1
	echo "iceprog:" >> processor_ice_log.txt
	sudo iceprog -S $(DESIGN).bin >> processor_ice_log.txt 2>&1

clean:
	rm -f *.json *.blif *.asc *.bin
