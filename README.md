# F-of-E Tools
This is the repository for the Foundations of Embedded Systems online tutorials, comprising the University of Cambridge Department of Engineering _GB3: RISC-V Processor Design_ IIA (3rd year undergraduate) project and the University of Cambridge Department of Engineering _4B25: Embedded Systems_ IIB (4th year / M.Sc.) course.

The project is organized and run by the [Physical Computation Laboratory](http://physcomp.eng.cam.ac.uk). This repository includes several other repositories as git submodules, including the [`Sunflower`](https://github.com/physical-computation/sunflower-simulator) processor emulator (RISC-V and SuperH), the [`Narvie`](https://github.com/physical-computation/narvie) RISC-V read-eval-print-loop (REPL) for interactive instruction emulation on the iCE40 FPGA, and the [`yosys`](https://github.com/YosysHQ/yosys), [`ArachnePNR`](https://github.com/YosysHQ/arachne-pnr), and [`NextPNR`](https://github.com/YosysHQ/nextpnr) tools. 

## Cloning the Repository 
The correct way to clone this repository to get the hardware and firmware submodules is:

	git clone --recursive https://github.com/f-of-e/f-of-e-tools.git

*If* you wish to update all submodules, then do

	git pull --recurse-submodules
	git submodule update --remote --recursive

If you forgot to clone with `--recursive` and end up with empty submodule directories, you can remedy this with

	git submodule update --init --recursive

Checkout master branch and take each submodule out of the "Detached HEAD" state:
```bash
	git submodule foreach git checkout master
```

## Acknowledgements
This project is developed with support from a 2019 Technology-Enabled Learning Pilot (TELP) award in cooperation with Cambridge University Press and by a 2017 Teaching and Learning Innovation Fund (TLIF) award from the Cambridge Center for Teaching and Learning.
