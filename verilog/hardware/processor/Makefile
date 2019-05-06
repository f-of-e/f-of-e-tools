DESIGN	= sail

psa-nextpnr:
	yosys -q ../../../yscripts/$(DESIGN).ys
	nextpnr-ice40 --up5k --json $(DESIGN).json --pcf pcf/$(DESIGN).pcf --asc $(DESIGN).asc
	icepack $(DESIGN).asc $(DESIGN).bin
	iceprog -S $(DESIGN).bin

clean:
	rm *.blif *.asc *.bin
