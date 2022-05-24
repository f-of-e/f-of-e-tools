#!/bin/sh


generate_rtl(){
    yosys -p "read_verilog $1.v; proc; opt; fsm; opt; show -format pdf -prefix $1_rtl -colors 33 -width -stretch"
    mv $1_rtl.dot ../../../../../processor_rtl/dot_files/
    mv $1_rtl.pdf ../../../../../processor_rtl/
}

echo "Generating RTL for processor"

# Have to handle toplevel.v separately
cd ../verilog/hardware/processor
yosys -p "read_verilog toplevel.v; proc; opt; fsm; opt; show -format pdf -prefix toplevel_rtl -colors 33 -width -stretch"
mv toplevel_rtl.dot ../../../processor_rtl/dot_files/
mv toplevel_rtl.pdf ../../../processor_rtl/

cd verilog
generate_rtl adder
generate_rtl alu_control
generate_rtl alu
generate_rtl branch_decide
generate_rtl branch_predictor
generate_rtl control_unit
generate_rtl cpu
generate_rtl CSR
generate_rtl dataMem_mask_gen
generate_rtl data_mem
generate_rtl forwarding_unit
generate_rtl imm_gen
generate_rtl instruction_mem
generate_rtl mux2to1
generate_rtl pipeline_registers
generate_rtl program_counter
generate_rtl register_file

echo "RTL generation finished"

