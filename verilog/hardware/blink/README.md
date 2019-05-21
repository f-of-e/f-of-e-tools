# Blink
Toggle pin `D3` of the iCE40 Ultra Plus.

Instructions
============

This demo blinks LED  `D14` which is connected to pin `D3` of FPGA U4.
You can find this information in the document 
`Schematics iCE40 Ultra Plus Mobile Development Platform MDP.pdf`.

To synthesize the design, run:

	$ yosys -p "synth_ice40 -blif blink.blif" blink.v

To run place and route using Arachne-PNR:

	$ arachne-pnr -d 5k -P uwg30 -p blink.pcf blink.blif -o blink.asc

To convert the output `blink.asc` ASCII file to iCE40 .bin file:

	$ icepack blink.asc blink.bin

To program the configuration RAM on the iCE40 Ultra Plus:

	$ iceprog -S blink.bin

See http://www.clifford.at/icestorm/ for more details about the Icestorm Tools.
