# Common verilog source for an RV32I processor.

RV32I_common contains sources files useful for building or customising small RISC-V processors.
These files are currently used by [narvie](https://github.com/physical-computation/narvie) for it's processor.

## TODO
carve out simulation/ into a separate private repository using git filter branch, then include it as a submodule.

## Tests

The verilog modules have a (non-comprehensive) test suite which can be run using [iverilog](http://iverilog.icarus.com/).
