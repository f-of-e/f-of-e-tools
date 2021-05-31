#include <stdio.h>
#include <verilated.h>
#include "Vtop_sim.h"
#include "verilated_vcd_c.h"

#include <iostream>
#include <string>
#include <cstdlib>
#include <cstdio>
enum
{
    kSimulationCycles = 300000,
};

vluint64_t vtime = 0;
bool clk = false;
int led = 255;

double
sc_time_stamp ()
{
    return vtime;
}

int main(int argc, char** argv, char** env)
{
    Verilated::commandArgs(argc, argv);
    Vtop_sim* top = new Vtop_sim;
    
    bool vcdTrace = true;
    VerilatedVcdC* tfp = NULL;
    
    top->eval();
    top->eval();
    
    if (vcdTrace)
    {
        Verilated::traceEverOn(true);
        
        tfp = new VerilatedVcdC;
        top->trace(tfp, 99);
        
        std::string vcdName = argv[0];
        vcdName += ".vcd";
        std::cout << vcdName << std::endl;
        tfp->open(vcdName.c_str());
    }
    
    while (!Verilated::gotFinish())
    {
        clk = not clk;
        top->clk = int(clk);
        top->eval();
        if (tfp != NULL)
            {
                tfp->dump (vtime);
            }
        if (led != int(top->led))
        {
            led = int(top->led);
            printf("%i\n", led);
        }
        vtime++;
        if(vtime == kSimulationCycles)
        {
            break;
        }
    }
    top->final();
    
    if (tfp != NULL)
    {
        tfp->close();
        delete tfp;
    }

    delete top;
    exit(0);
}
