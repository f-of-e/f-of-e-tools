all: blink blinkDataflow dffDataflow dffHardIP blinkBehavioral blinkGate dffBehavioral dffGate simple simpleAlternative

blink:
	yosys -p "synth_ice40 -blif blink.blif; write_json blink.json" blink.v
	nextpnr-ice40 --freq 12 --up5k --package uwg30 --json blink.json --pcf blink.pcf --asc blink.asc
	icepack blink.asc blink.bin

blink-install:
	sudo iceprog -S blink.bin



blinkBehavioral:
	yosys -p "synth_ice40 -blif blinkBehavioral.blif; write_json blinkBehavioral.json" blinkBehavioral.v
	nextpnr-ice40 --freq 12 --up5k --package uwg30 --json blinkBehavioral.json --pcf blink.pcf --asc blinkBehavioral.asc
	icepack blinkBehavioral.asc blinkBehavioral.bin

blinkBehavioral-install:
	sudo iceprog -S blinkBehavioral.bin



blinkDataflow:
	yosys -p "synth_ice40 -blif blinkDataflow.blif; write_json blinkDataflow.json" dffHardIP.v blinkDataflow.v
	nextpnr-ice40 --freq 12 --up5k --package uwg30 --json blinkDataflow.json --pcf blink.pcf --asc blinkDataflow.asc
	icepack blinkDataflow.asc blinkDataflow.bin

blinkDataflow-install:
	sudo iceprog -S blinkDataflow.bin



blinkGate:
	yosys -p "synth_ice40 -blif blinkGate.blif; write_json blinkGate.json" blinkGate.v dffHardIP.v
	nextpnr-ice40 --freq 12 --up5k --package uwg30 --json blinkGate.json --pcf blink.pcf --asc blinkGate.asc
	icepack blinkGate.asc blinkGate.bin

blinkGate-install:
	sudo iceprog -S blinkGate.bin



dffBehavioral:
	yosys -p "synth_ice40 -blif dffBehavioral.blif; write_json dffBehavioral.json" dffBehavioral.v
	nextpnr-ice40 --freq 12 --up5k --package uwg30 --json dffBehavioral.json --asc dffBehavioral.asc
	icepack dffBehavioral.asc dffBehavioral.bin

dffBehavioral-install:
	sudo iceprog -S dffBehavioral.bin



dffDataflow:
	yosys -p "synth_ice40 -blif dffDataflow.blif; write_json dffDataflow.json" dffDataflow.v
	nextpnr-ice40 --freq 12 --force --up5k --package uwg30 --json dffDataflow.json --asc dffDataflow.asc
	icepack dffDataflow.asc dffDataflow.bin

dffDataflow-install:
	sudo iceprog -S dffDataflow.bin



dffGate:
	yosys -p "synth_ice40 -blif dffGate.blif; write_json dffGate.json" dffGate.v
	nextpnr-ice40 --freq 12 --force --up5k --package uwg30 --json dffGate.json --asc dffGate.asc
	icepack dffGate.asc dffGate.bin

dffGate-install:
	sudo iceprog -S dffGate.bin



dffHardIP:
	yosys -p "synth_ice40 -blif dffHardIP.blif; write_json dffHardIP.json" dffHardIP.v
	nextpnr-ice40 --freq 12 --up5k --package uwg30 --json dffHardIP.json --asc dffHardIP.asc
	icepack dffHardIP.asc dffHardIP.bin

dffHardIP-install:
	sudo iceprog -S dffHardIP.bin



simple:
	yosys -p "synth_ice40 -blif simple.blif; write_json simple.json" simple.v
	nextpnr-ice40 --freq 12 --up5k --package uwg30 --json simple.json --asc simple.asc
	icepack simple.asc simple.bin

simple-simulate:
	iverilog -o simpleTestbench simple.v simpleTestbench.v
	./simpleTestbench
	gtkwave simpleTestbench.vcd

simple-install:
	sudo iceprog -S simple.bin



simpleAlternative:
	yosys -p "synth_ice40 -blif simpleAlternative.blif; write_json simpleAlternative.json" simpleAlternative.v
	nextpnr-ice40 --freq 12 --up5k --package uwg30 --json simple.json --asc simpleAlternative.asc
	icepack simpleAlternative.asc simpleAlternative.bin

simple-install:
	sudo iceprog -S simpleAlternative.bin

clean:
	rm -f *.blif *.json *.bin *.asc *.vcd
