// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef _VTOP_SIM__SYMS_H_
#define _VTOP_SIM__SYMS_H_  // guard

#include "verilated_heavy.h"

// INCLUDE MODULE CLASSES
#include "Vtop_sim.h"

// SYMS CLASS
class Vtop_sim__Syms : public VerilatedSyms {
  public:
    
    // LOCAL STATE
    const char* __Vm_namep;
    bool __Vm_activity;  ///< Used by trace routines to determine change occurred
    bool __Vm_didInit;
    
    // SUBCELL STATE
    Vtop_sim*                      TOPp;
    
    // CREATORS
    Vtop_sim__Syms(Vtop_sim* topp, const char* namep);
    ~Vtop_sim__Syms() {}
    
    // METHODS
    inline const char* name() { return __Vm_namep; }
    inline bool getClearActivity() { bool r=__Vm_activity; __Vm_activity=false; return r; }
    
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
