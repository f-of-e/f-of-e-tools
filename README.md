# CUED-GB3-RISC-V-2019
This is the repository for the the University of Cambridge Department of Engineering _GB3: RISC-V Processor Design_ IIA project.

The project is organized and run by the [Physical Computation Laboratory](http://physcomp.eng.cam.ac.uk). Several other repositories, [`Warp-fpga`](https://github.com/physical-computation/Warp-fpga), [`Sunflower`](https://github.com/phillipstanleymarbell/sunflower-simulator) and [`Narvie`](https://github.com/physical-computation/narvie), contain the FPGA tools, processor emulator, and RISC-V read-eval-print-loop (REPL) tools, respectively. These repositories are included here as git submodules.

## Cloning the Repository 
The correct way to clone this repository to get the hardware and firmware submodules is:

	git clone --recursive https://github.com/physical-computation/CUED-GB3-RISC-V-2019.git

To update all submodules

	git pull --recurse-submodules
	git submodule update --remote --recursive

If you forgot to clone with `--recursive`, and end up with empty submodule directories, you can remedy this with

	git submodule update --init --recursive

Checkout master branch and take each submodule out of the "Detached HEAD" state:
```bash
	git submodule foreach git checkout master
```

## Acknowledgements
This project is developed with support from a 2019 Technology-Enabled Learning Pilot (TELP) award in cooperation with Cambridge University Press.
