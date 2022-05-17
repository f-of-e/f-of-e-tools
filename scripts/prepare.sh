#!/bin/sh

yosys -p "synth_ice40 -blif $1.blif; write_json $1.json" $1.v > $1_yosys_log.txt
nextpnr-ice40 --up5k --package uwg30 --json $1.json --pcf $1.pcf --asc $1.asc > $1_nextpnr_log.txt
icepack $1.asc $1.bin > $1_icepack_log.txt

