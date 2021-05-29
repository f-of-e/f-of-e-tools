// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VTOP_SIM_H_
#define _VTOP_SIM_H_  // guard

#include "verilated_heavy.h"

//==========

class Vtop_sim__Syms;
class Vtop_sim_VerilatedVcd;


//----------

VL_MODULE(Vtop_sim) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clk,0,0);
    VL_OUT8(led,7,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    CData/*0:0*/ top_sim__DOT__clk_proc;
    CData/*0:0*/ top_sim__DOT__data_clk_stall;
    CData/*0:0*/ top_sim__DOT__processor__DOT__pcsrc;
    CData/*0:0*/ top_sim__DOT__processor__DOT__Fence_signal;
    CData/*0:0*/ top_sim__DOT__processor__DOT__CSRR_signal;
    CData/*0:0*/ top_sim__DOT__processor__DOT__CSRRI_signal;
    CData/*6:0*/ top_sim__DOT__processor__DOT__alu_ctl;
    CData/*0:0*/ top_sim__DOT__processor__DOT__alu_branch_enable;
    CData/*0:0*/ top_sim__DOT__processor__DOT__predict;
    CData/*0:0*/ top_sim__DOT__processor__DOT__actual_branch_decision;
    CData/*0:0*/ top_sim__DOT__processor__DOT__mistake_trigger;
    CData/*4:0*/ top_sim__DOT__processor__DOT__register_files__DOT__rdAddrA_buf;
    CData/*4:0*/ top_sim__DOT__processor__DOT__register_files__DOT__rdAddrB_buf;
    CData/*0:0*/ top_sim__DOT__processor__DOT__register_files__DOT__write_buf;
    CData/*2:0*/ top_sim__DOT__processor__DOT__sign_mask_gen_inst__DOT__mask;
    CData/*1:0*/ top_sim__DOT__processor__DOT__branch_predictor_FSM__DOT__s;
    CData/*0:0*/ top_sim__DOT__processor__DOT__branch_predictor_FSM__DOT__branch_mem_sig_reg;
    CData/*0:0*/ top_sim__DOT__data_mem_inst__DOT__memread_buf;
    CData/*0:0*/ top_sim__DOT__data_mem_inst__DOT__memwrite_buf;
    CData/*3:0*/ top_sim__DOT__data_mem_inst__DOT__sign_mask_buf;
    CData/*0:0*/ top_sim__DOT__data_mem_inst__DOT__select0;
    CData/*0:0*/ top_sim__DOT__data_mem_inst__DOT__select1;
    SData/*13:0*/ top_sim__DOT__data_mem_inst__DOT__addr_buf;
    SData/*9:0*/ top_sim__DOT__data_mem_inst__DOT__addr_buf_block_addr;
    IData/*31:0*/ top_sim__DOT__data_out;
    IData/*31:0*/ top_sim__DOT__processor__DOT__pc_out;
    IData/*31:0*/ top_sim__DOT__processor__DOT__inst_mux_out;
    WData/*177:0*/ top_sim__DOT__processor__DOT__id_ex_out[6];
    WData/*154:0*/ top_sim__DOT__processor__DOT__ex_mem_out[5];
    WData/*116:0*/ top_sim__DOT__processor__DOT__mem_wb_out[4];
    IData/*31:0*/ top_sim__DOT__processor__DOT__cont_mux_out;
    IData/*31:0*/ top_sim__DOT__processor__DOT__imm_out;
    IData/*31:0*/ top_sim__DOT__processor__DOT__rdValOut_CSR;
    IData/*31:0*/ top_sim__DOT__processor__DOT__ex_cont_mux_out;
    IData/*31:0*/ top_sim__DOT__processor__DOT__alu_mux_out;
    IData/*31:0*/ top_sim__DOT__processor__DOT__alu_result;
    IData/*31:0*/ top_sim__DOT__processor__DOT__lui_result;
    IData/*31:0*/ top_sim__DOT__processor__DOT__mem_csrr_mux_out;
    IData/*31:0*/ top_sim__DOT__processor__DOT__wb_mux_out;
    IData/*31:0*/ top_sim__DOT__processor__DOT__reg_dat_mux_out;
    IData/*31:0*/ top_sim__DOT__processor__DOT__dataMemOut_fwd_mux_out;
    IData/*31:0*/ top_sim__DOT__processor__DOT__wb_fwd1_mux_out;
    IData/*31:0*/ top_sim__DOT__processor__DOT__wb_fwd2_mux_out;
    IData/*31:0*/ top_sim__DOT__processor__DOT__branch_predictor_mux_out;
    IData/*31:0*/ top_sim__DOT__processor__DOT__register_files__DOT__regDatA;
    IData/*31:0*/ top_sim__DOT__processor__DOT__register_files__DOT__regDatB;
    IData/*31:0*/ top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf;
    IData/*31:0*/ top_sim__DOT__processor__DOT__register_files__DOT__wrData_buf;
    IData/*31:0*/ top_sim__DOT__processor__DOT__alu_main__DOT__add_output;
    IData/*31:0*/ top_sim__DOT__processor__DOT__alu_main__DOT__sub_output;
    IData/*31:0*/ top_sim__DOT__data_mem_inst__DOT__led_reg;
    IData/*31:0*/ top_sim__DOT__data_mem_inst__DOT__state;
    IData/*31:0*/ top_sim__DOT__data_mem_inst__DOT__word_buf;
    IData/*31:0*/ top_sim__DOT__data_mem_inst__DOT__read_buf;
    IData/*31:0*/ top_sim__DOT__data_mem_inst__DOT__write_data_buffer;
    IData/*31:0*/ top_sim__DOT__data_mem_inst__DOT__replacement_word;
    IData/*31:0*/ top_sim__DOT__data_mem_inst__DOT__write_out1;
    QData/*63:0*/ top_sim__DOT__processor__DOT__if_id_out;
    IData/*31:0*/ top_sim__DOT__processor__DOT__register_files__DOT__regfile[32];
    IData/*31:0*/ top_sim__DOT__processor__DOT__ControlAndStatus_registers__DOT__csr_file[1024];
    IData/*31:0*/ top_sim__DOT__inst_mem__DOT__instruction_memory[4096];
    IData/*31:0*/ top_sim__DOT__data_mem_inst__DOT__data_block[1024];
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    CData/*2:0*/ __Vtableidx2;
    CData/*0:0*/ __VinpClk__TOP__top_sim__DOT__clk_proc;
    CData/*0:0*/ __Vclklast__TOP____VinpClk__TOP__top_sim__DOT__clk_proc;
    CData/*0:0*/ __Vclklast__TOP__clk;
    CData/*0:0*/ __Vchglast__TOP__top_sim__DOT__clk_proc;
    SData/*10:0*/ __Vtableidx1;
    IData/*31:0*/ top_sim__DOT__processor__DOT____Vcellinp__cont_mux__input0;
    WData/*177:0*/ __Vdly__top_sim__DOT__processor__DOT__id_ex_out[6];
    IData/*31:0*/ __Vm_traceActivity;
    static CData/*6:0*/ __Vtable1_top_sim__DOT__processor__DOT__alu_ctl[2048];
    static CData/*2:0*/ __Vtable2_top_sim__DOT__processor__DOT__sign_mask_gen_inst__DOT__mask[8];
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Vtop_sim__Syms* __VlSymsp;  // Symbol table
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vtop_sim);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    Vtop_sim(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vtop_sim();
    /// Trace signals in the model; called by application code
    void trace(VerilatedVcdC* tfp, int levels, int options = 0);
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vtop_sim__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vtop_sim__Syms* symsp, bool first);
  private:
    static QData _change_request(Vtop_sim__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__7(Vtop_sim__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(Vtop_sim__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif  // VL_DEBUG
  public:
    static void _eval_initial(Vtop_sim__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(Vtop_sim__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _initial__TOP__1(Vtop_sim__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _multiclk__TOP__8(Vtop_sim__Syms* __restrict vlSymsp);
    static void _sequent__TOP__2(Vtop_sim__Syms* __restrict vlSymsp);
    static void _sequent__TOP__3(Vtop_sim__Syms* __restrict vlSymsp);
    static void _sequent__TOP__4(Vtop_sim__Syms* __restrict vlSymsp);
    static void _sequent__TOP__6(Vtop_sim__Syms* __restrict vlSymsp);
    static void _settle__TOP__5(Vtop_sim__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void traceChgThis(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__10(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__11(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__12(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__13(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__14(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__2(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__3(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__4(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__5(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__6(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__7(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__8(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__9(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceFullThis__1(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis__1(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
