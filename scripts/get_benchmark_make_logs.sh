#!/bin/sh

cd ../verilog/hardware/processor

benchmark(){
    cd source/$1
    make install
    cd -
    make Makefile_no_iceprog
    mkdir ../../../processor_makes/$1
    cp processor_yosys_log.txt processor_nextpnr_log.txt processor_ice_log.txt sail.bin ../../../processor_makes/$1/
}

echo "Benchmarking resource usage started"
echo "Benchmarking 0/5"
benchmark bubblesort
echo "Benchmarking 1/5"
benchmark LPF128
echo "Benchmarking 2/5"
benchmark pedometer128
echo "Benchmarking 3/5"
benchmark schlieren128
echo "Benchmarking 4/5"
benchmark softwareblink
echo "Benchmarking resource usage finished"

