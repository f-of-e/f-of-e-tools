// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vtop_sim__Syms.h"


//======================

void Vtop_sim::traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vtop_sim* t = (Vtop_sim*)userthis;
    Vtop_sim__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (vlSymsp->getClearActivity()) {
        t->traceChgThis(vlSymsp, vcdp, code);
    }
}

//======================


void Vtop_sim::traceChgThis(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtop_sim* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 1U))))) {
            vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & ((vlTOPp->__Vm_traceActivity 
                                | (vlTOPp->__Vm_traceActivity 
                                   >> 1U)) | (vlTOPp->__Vm_traceActivity 
                                              >> 3U))))) {
            vlTOPp->traceChgThis__3(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & ((vlTOPp->__Vm_traceActivity 
                                | (vlTOPp->__Vm_traceActivity 
                                   >> 1U)) | (vlTOPp->__Vm_traceActivity 
                                              >> 4U))))) {
            vlTOPp->traceChgThis__4(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (((vlTOPp->__Vm_traceActivity 
                                 | (vlTOPp->__Vm_traceActivity 
                                    >> 1U)) | (vlTOPp->__Vm_traceActivity 
                                               >> 4U)) 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 6U))))) {
            vlTOPp->traceChgThis__5(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 2U))))) {
            vlTOPp->traceChgThis__6(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 3U))))) {
            vlTOPp->traceChgThis__7(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 4U))))) {
            vlTOPp->traceChgThis__8(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & ((vlTOPp->__Vm_traceActivity 
                                | (vlTOPp->__Vm_traceActivity 
                                   >> 4U)) | (vlTOPp->__Vm_traceActivity 
                                              >> 6U))))) {
            vlTOPp->traceChgThis__9(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 5U))))) {
            vlTOPp->traceChgThis__10(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 6U))))) {
            vlTOPp->traceChgThis__11(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((2U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__12(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((8U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__13(vlSymsp, vcdp, code);
        }
        vlTOPp->traceChgThis__14(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vtop_sim::traceChgThis__2(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtop_sim* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Variables
    WData/*159:0*/ __Vtemp42[5];
    WData/*191:0*/ __Vtemp45[6];
    // Body
    {
        vcdp->chgBus(c+1,(vlTOPp->top_sim__DOT__processor__DOT__pc_out),32);
        vcdp->chgBus(c+9,(vlTOPp->top_sim__DOT__inst_mem__DOT__instruction_memory
                          [(0xfffU & (vlTOPp->top_sim__DOT__processor__DOT__pc_out 
                                      >> 2U))]),32);
        vcdp->chgBit(c+17,(vlTOPp->top_sim__DOT__processor__DOT__pcsrc));
        vcdp->chgBus(c+25,(vlTOPp->top_sim__DOT__processor__DOT__inst_mux_out),32);
        vcdp->chgBus(c+33,(((IData)(vlTOPp->top_sim__DOT__processor__DOT__Fence_signal)
                             ? vlTOPp->top_sim__DOT__processor__DOT__pc_out
                             : ((IData)(4U) + vlTOPp->top_sim__DOT__processor__DOT__pc_out))),32);
        vcdp->chgQuad(c+41,(vlTOPp->top_sim__DOT__processor__DOT__if_id_out),64);
        vcdp->chgArray(c+57,(vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out),155);
        vcdp->chgArray(c+97,(vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out),117);
        vcdp->chgBit(c+129,((1U & ((((~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                 >> 0x25U))) 
                                     & (~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                   >> 0x24U)))) 
                                    & (~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                  >> 0x23U)))) 
                                   & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                              >> 0x20U))))));
        vcdp->chgBit(c+137,((1U & ((((~ ((IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                  >> 0x24U)) 
                                         | (IData)(
                                                   (vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                    >> 0x25U)))) 
                                     | (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                >> 0x22U))) 
                                    | (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                               >> 0x24U))) 
                                   & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                              >> 0x20U))))));
        vcdp->chgBit(c+145,((1U & (((~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                >> 0x26U))) 
                                    & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                               >> 0x25U))) 
                                   & (~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                 >> 0x24U)))))));
        vcdp->chgBit(c+153,((1U & ((((~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                 >> 0x25U))) 
                                     & (~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                   >> 0x24U)))) 
                                    & (~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                  >> 0x23U)))) 
                                   & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                              >> 0x21U))))));
        vcdp->chgBit(c+161,((1U & (((IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                             >> 0x26U)) 
                                    & (~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                  >> 0x24U)))) 
                                   & (~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                 >> 0x22U)))))));
        vcdp->chgBit(c+169,((1U & ((((IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                              >> 0x26U)) 
                                     & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                >> 0x25U))) 
                                    & (~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                  >> 0x24U)))) 
                                   & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                              >> 0x22U))))));
        vcdp->chgBit(c+177,((1U & (((((IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                               >> 0x26U)) 
                                      & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                 >> 0x25U))) 
                                     & (~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                   >> 0x24U)))) 
                                    & (~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                  >> 0x23U)))) 
                                   & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                              >> 0x22U))))));
        vcdp->chgBit(c+185,((1U & ((~ ((IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                >> 0x26U)) 
                                       | (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                  >> 0x24U)))) 
                                   | (~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                 >> 0x25U)))))));
        vcdp->chgBit(c+193,((1U & (((((~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                  >> 0x26U))) 
                                      & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                 >> 0x25U))) 
                                     & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                >> 0x24U))) 
                                    & (~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                  >> 0x23U)))) 
                                   & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                              >> 0x22U))))));
        vcdp->chgBit(c+201,((1U & (((((~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                  >> 0x26U))) 
                                      & (~ (IData)(
                                                   (vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                    >> 0x25U)))) 
                                     & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                >> 0x24U))) 
                                    & (~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                  >> 0x23U)))) 
                                   & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                              >> 0x22U))))));
        vcdp->chgBit(c+209,(vlTOPp->top_sim__DOT__processor__DOT__Fence_signal));
        vcdp->chgBit(c+217,(vlTOPp->top_sim__DOT__processor__DOT__CSRR_signal));
        vcdp->chgBit(c+225,(vlTOPp->top_sim__DOT__processor__DOT__CSRRI_signal));
        vcdp->chgBus(c+233,(vlTOPp->top_sim__DOT__processor__DOT__cont_mux_out),32);
        vcdp->chgBus(c+241,(vlTOPp->top_sim__DOT__processor__DOT__imm_out),32);
        vcdp->chgBus(c+249,(((IData)(vlTOPp->top_sim__DOT__processor__DOT__CSRRI_signal)
                              ? (0x1fU & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                  >> 0x2fU)))
                              : ((((vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf 
                                    == (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__rdAddrA_buf)) 
                                   & (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__write_buf)) 
                                  & (0U != vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf))
                                  ? vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrData_buf
                                  : vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regDatA))),32);
        vcdp->chgBus(c+257,(((IData)(vlTOPp->top_sim__DOT__processor__DOT__CSRR_signal)
                              ? vlTOPp->top_sim__DOT__processor__DOT__rdValOut_CSR
                              : ((((vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf 
                                    == (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__rdAddrB_buf)) 
                                   & (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__write_buf)) 
                                  & (0U != vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf))
                                  ? vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrData_buf
                                  : vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regDatB))),32);
        vcdp->chgBus(c+265,(((IData)(vlTOPp->top_sim__DOT__processor__DOT__CSRRI_signal)
                              ? 0U : (0x1fU & (IData)(
                                                      (vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                       >> 0x2fU))))),32);
        vcdp->chgBus(c+273,(((IData)(vlTOPp->top_sim__DOT__processor__DOT__CSRR_signal)
                              ? 0U : (0x1fU & (IData)(
                                                      (vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                       >> 0x34U))))),32);
        vcdp->chgBus(c+281,(((8U & ((~ (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                >> 0x2eU))) 
                                    << 3U)) | (IData)(vlTOPp->top_sim__DOT__processor__DOT__sign_mask_gen_inst__DOT__mask))),4);
        vcdp->chgBus(c+289,(vlTOPp->top_sim__DOT__processor__DOT__alu_ctl),7);
        vcdp->chgBus(c+297,(((0x100U & vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U])
                              ? ((vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[2U] 
                                  << 0x17U) | (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[1U] 
                                               >> 9U))
                              : ((vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[3U] 
                                  << 0x16U) | (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[2U] 
                                               >> 0xaU)))),32);
        vcdp->chgBus(c+305,(vlTOPp->top_sim__DOT__processor__DOT__mem_csrr_mux_out),32);
        vcdp->chgBus(c+313,(vlTOPp->top_sim__DOT__processor__DOT__wb_mux_out),32);
        vcdp->chgBus(c+321,(((IData)(4U) + vlTOPp->top_sim__DOT__processor__DOT__pc_out)),32);
        vcdp->chgBus(c+329,(((IData)(vlTOPp->top_sim__DOT__processor__DOT__if_id_out) 
                             + vlTOPp->top_sim__DOT__processor__DOT__imm_out)),32);
        vcdp->chgBit(c+337,(vlTOPp->top_sim__DOT__processor__DOT__predict));
        vcdp->chgBus(c+345,(((IData)(vlTOPp->top_sim__DOT__processor__DOT__predict)
                              ? ((IData)(vlTOPp->top_sim__DOT__processor__DOT__if_id_out) 
                                 + vlTOPp->top_sim__DOT__processor__DOT__imm_out)
                              : ((IData)(vlTOPp->top_sim__DOT__processor__DOT__Fence_signal)
                                  ? vlTOPp->top_sim__DOT__processor__DOT__pc_out
                                  : ((IData)(4U) + vlTOPp->top_sim__DOT__processor__DOT__pc_out)))),32);
        vcdp->chgBit(c+353,(vlTOPp->top_sim__DOT__processor__DOT__actual_branch_decision));
        vcdp->chgBit(c+361,(vlTOPp->top_sim__DOT__processor__DOT__mistake_trigger));
        vcdp->chgBit(c+369,(((IData)(vlTOPp->top_sim__DOT__processor__DOT__pcsrc) 
                             | (IData)(vlTOPp->top_sim__DOT__processor__DOT__mistake_trigger))));
        vcdp->chgBit(c+377,(((((IData)(vlTOPp->top_sim__DOT__processor__DOT__pcsrc) 
                               | (IData)(vlTOPp->top_sim__DOT__processor__DOT__predict)) 
                              | (IData)(vlTOPp->top_sim__DOT__processor__DOT__mistake_trigger)) 
                             | (IData)(vlTOPp->top_sim__DOT__processor__DOT__Fence_signal))));
        vcdp->chgBus(c+385,(((vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[2U] 
                              << 0x17U) | (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[1U] 
                                           >> 9U))),32);
        vcdp->chgQuad(c+393,((((QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__inst_mux_out)) 
                               << 0x20U) | (QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__pc_out)))),64);
        vcdp->chgBus(c+409,((0x7fU & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                              >> 0x20U)))),7);
        vcdp->chgBus(c+417,(vlTOPp->top_sim__DOT__processor__DOT____Vcellinp__cont_mux__input0),32);
        vcdp->chgBit(c+425,((1U & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U] 
                                   >> 2U))));
        vcdp->chgBus(c+433,((0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                      >> 0xaU))),5);
        vcdp->chgBus(c+441,((0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__inst_mux_out 
                                      >> 0xfU))),5);
        vcdp->chgBus(c+449,((0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__inst_mux_out 
                                      >> 0x14U))),5);
        vcdp->chgBus(c+457,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[0]),32);
        vcdp->chgBus(c+458,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[1]),32);
        vcdp->chgBus(c+459,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[2]),32);
        vcdp->chgBus(c+460,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[3]),32);
        vcdp->chgBus(c+461,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[4]),32);
        vcdp->chgBus(c+462,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[5]),32);
        vcdp->chgBus(c+463,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[6]),32);
        vcdp->chgBus(c+464,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[7]),32);
        vcdp->chgBus(c+465,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[8]),32);
        vcdp->chgBus(c+466,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[9]),32);
        vcdp->chgBus(c+467,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[10]),32);
        vcdp->chgBus(c+468,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[11]),32);
        vcdp->chgBus(c+469,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[12]),32);
        vcdp->chgBus(c+470,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[13]),32);
        vcdp->chgBus(c+471,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[14]),32);
        vcdp->chgBus(c+472,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[15]),32);
        vcdp->chgBus(c+473,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[16]),32);
        vcdp->chgBus(c+474,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[17]),32);
        vcdp->chgBus(c+475,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[18]),32);
        vcdp->chgBus(c+476,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[19]),32);
        vcdp->chgBus(c+477,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[20]),32);
        vcdp->chgBus(c+478,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[21]),32);
        vcdp->chgBus(c+479,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[22]),32);
        vcdp->chgBus(c+480,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[23]),32);
        vcdp->chgBus(c+481,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[24]),32);
        vcdp->chgBus(c+482,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[25]),32);
        vcdp->chgBus(c+483,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[26]),32);
        vcdp->chgBus(c+484,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[27]),32);
        vcdp->chgBus(c+485,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[28]),32);
        vcdp->chgBus(c+486,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[29]),32);
        vcdp->chgBus(c+487,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[30]),32);
        vcdp->chgBus(c+488,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regfile[31]),32);
        vcdp->chgBus(c+713,((IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                     >> 0x20U))),32);
        vcdp->chgBus(c+721,(((8U & ((IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                             >> 0x3eU)) 
                                    << 3U)) | (7U & (IData)(
                                                            (vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                             >> 0x2cU))))),4);
        vcdp->chgBus(c+729,((7U & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                           >> 0x2cU)))),3);
        vcdp->chgBus(c+737,(vlTOPp->top_sim__DOT__processor__DOT__sign_mask_gen_inst__DOT__mask),3);
        vcdp->chgBit(c+745,((1U & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[0U] 
                                   >> 3U))));
        vcdp->chgBus(c+753,((0xfffU & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[3U] 
                                       >> 9U))),12);
        vcdp->chgBus(c+761,(((vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[1U] 
                              << 0x1cU) | (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[0U] 
                                           >> 4U))),32);
        vcdp->chgBus(c+769,((0xfffU & (vlTOPp->top_sim__DOT__processor__DOT__inst_mux_out 
                                       >> 0x14U))),12);
        vcdp->chgBus(c+777,((0x1fU & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                              >> 0x2fU)))),32);
        vcdp->chgBus(c+785,((0x1fU & (IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                              >> 0x34U)))),32);
        __Vtemp42[4U] = ((0xf800000U & ((IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                 >> 0x27U)) 
                                        << 0x17U)) 
                         | ((0xfff80000U & ((0x400000U 
                                             & ((~ (IData)(
                                                           (vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                            >> 0x2eU))) 
                                                << 0x16U)) 
                                            | ((IData)(vlTOPp->top_sim__DOT__processor__DOT__sign_mask_gen_inst__DOT__mask) 
                                               << 0x13U))) 
                            | ((0xfffff000U & ((IData)(vlTOPp->top_sim__DOT__processor__DOT__alu_ctl) 
                                               << 0xcU)) 
                               | (0xfffU & ((IData)(
                                                    ((((QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__imm_out)) 
                                                       << 0x20U) 
                                                      | (QData)((IData)(
                                                                        ((IData)(vlTOPp->top_sim__DOT__processor__DOT__CSRR_signal)
                                                                          ? vlTOPp->top_sim__DOT__processor__DOT__rdValOut_CSR
                                                                          : 
                                                                         ((((vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf 
                                                                             == (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__rdAddrB_buf)) 
                                                                            & (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__write_buf)) 
                                                                           & (0U 
                                                                              != vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf))
                                                                           ? vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrData_buf
                                                                           : vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regDatB))))) 
                                                     >> 0x20U)) 
                                            >> 0x14U)))));
        __Vtemp45[0U] = ((0xfffff000U & ((IData)(vlTOPp->top_sim__DOT__processor__DOT__if_id_out) 
                                         << 0xcU)) 
                         | ((0xf00U & (vlTOPp->top_sim__DOT__processor__DOT__cont_mux_out 
                                       << 1U)) | (((IData)(vlTOPp->top_sim__DOT__processor__DOT__predict) 
                                                   << 7U) 
                                                  | (0x7fU 
                                                     & vlTOPp->top_sim__DOT__processor__DOT__cont_mux_out))));
        __Vtemp45[1U] = ((0xfffU & ((IData)(vlTOPp->top_sim__DOT__processor__DOT__if_id_out) 
                                    >> 0x14U)) | (0xfffff000U 
                                                  & (((IData)(vlTOPp->top_sim__DOT__processor__DOT__CSRRI_signal)
                                                       ? 
                                                      (0x1fU 
                                                       & (IData)(
                                                                 (vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                                  >> 0x2fU)))
                                                       : 
                                                      ((((vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf 
                                                          == (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__rdAddrA_buf)) 
                                                         & (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__write_buf)) 
                                                        & (0U 
                                                           != vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf))
                                                        ? vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrData_buf
                                                        : vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regDatA)) 
                                                     << 0xcU)));
        __Vtemp45[2U] = ((0xfffU & (((IData)(vlTOPp->top_sim__DOT__processor__DOT__CSRRI_signal)
                                      ? (0x1fU & (IData)(
                                                         (vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                          >> 0x2fU)))
                                      : ((((vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf 
                                            == (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__rdAddrA_buf)) 
                                           & (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__write_buf)) 
                                          & (0U != vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf))
                                          ? vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrData_buf
                                          : vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regDatA)) 
                                    >> 0x14U)) | (0xfffff000U 
                                                  & ((IData)(
                                                             (((QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__imm_out)) 
                                                               << 0x20U) 
                                                              | (QData)((IData)(
                                                                                ((IData)(vlTOPp->top_sim__DOT__processor__DOT__CSRR_signal)
                                                                                 ? vlTOPp->top_sim__DOT__processor__DOT__rdValOut_CSR
                                                                                 : 
                                                                                ((((vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf 
                                                                                == (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__rdAddrB_buf)) 
                                                                                & (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__write_buf)) 
                                                                                & (0U 
                                                                                != vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf))
                                                                                 ? vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrData_buf
                                                                                 : vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regDatB)))))) 
                                                     << 0xcU)));
        __Vtemp45[3U] = ((0xfffU & ((IData)((((QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__imm_out)) 
                                              << 0x20U) 
                                             | (QData)((IData)(
                                                               ((IData)(vlTOPp->top_sim__DOT__processor__DOT__CSRR_signal)
                                                                 ? vlTOPp->top_sim__DOT__processor__DOT__rdValOut_CSR
                                                                 : 
                                                                ((((vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf 
                                                                    == (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__rdAddrB_buf)) 
                                                                   & (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__write_buf)) 
                                                                  & (0U 
                                                                     != vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf))
                                                                  ? vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrData_buf
                                                                  : vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regDatB)))))) 
                                    >> 0x14U)) | (0xfffff000U 
                                                  & ((IData)(
                                                             ((((QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__imm_out)) 
                                                                << 0x20U) 
                                                               | (QData)((IData)(
                                                                                ((IData)(vlTOPp->top_sim__DOT__processor__DOT__CSRR_signal)
                                                                                 ? vlTOPp->top_sim__DOT__processor__DOT__rdValOut_CSR
                                                                                 : 
                                                                                ((((vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf 
                                                                                == (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__rdAddrB_buf)) 
                                                                                & (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__write_buf)) 
                                                                                & (0U 
                                                                                != vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf))
                                                                                 ? vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrData_buf
                                                                                 : vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regDatB))))) 
                                                              >> 0x20U)) 
                                                     << 0xcU)));
        __Vtemp45[4U] = ((0xf0000000U & (((IData)(vlTOPp->top_sim__DOT__processor__DOT__CSRRI_signal)
                                           ? 0U : (0x1fU 
                                                   & (IData)(
                                                             (vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                              >> 0x2fU)))) 
                                         << 0x1cU)) 
                         | __Vtemp42[4U]);
        __Vtemp45[5U] = ((0x3ffc0U & ((IData)((vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                               >> 0x34U)) 
                                      << 6U)) | ((0xfffffffeU 
                                                  & (((IData)(vlTOPp->top_sim__DOT__processor__DOT__CSRR_signal)
                                                       ? 0U
                                                       : 
                                                      (0x1fU 
                                                       & (IData)(
                                                                 (vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                                  >> 0x34U)))) 
                                                     << 1U)) 
                                                 | (0xfffffffU 
                                                    & (((IData)(vlTOPp->top_sim__DOT__processor__DOT__CSRRI_signal)
                                                         ? 0U
                                                         : 
                                                        (0x1fU 
                                                         & (IData)(
                                                                   (vlTOPp->top_sim__DOT__processor__DOT__if_id_out 
                                                                    >> 0x2fU)))) 
                                                       >> 4U))));
        vcdp->chgArray(c+793,(__Vtemp45),178);
        vcdp->chgBit(c+841,((1U & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U] 
                                   >> 6U))));
        vcdp->chgBit(c+849,((1U & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U] 
                                   >> 7U))));
        vcdp->chgBit(c+857,((1U & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[2U] 
                                   >> 9U))));
        vcdp->chgBit(c+865,((1U & vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U])));
        vcdp->chgBus(c+873,(((vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[3U] 
                              << 0x16U) | (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[2U] 
                                           >> 0xaU))),32);
        vcdp->chgBit(c+881,((1U & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U] 
                                   >> 8U))));
        vcdp->chgBus(c+889,(((vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                              << 0x16U) | (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[3U] 
                                           >> 0xaU))),32);
        vcdp->chgBit(c+897,((1U & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U] 
                                   >> 3U))));
        vcdp->chgBus(c+905,(((vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[2U] 
                              << 0x1cU) | (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[1U] 
                                           >> 4U))),32);
        vcdp->chgBus(c+913,(((vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[3U] 
                              << 0x1cU) | (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[2U] 
                                           >> 4U))),32);
        vcdp->chgBit(c+921,((1U & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[0U] 
                                   >> 1U))));
        vcdp->chgBus(c+929,((0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[3U] 
                                      >> 4U))),5);
        vcdp->chgBit(c+937,((1U & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[0U] 
                                   >> 2U))));
        vcdp->chgBus(c+945,((0xfffU & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                       >> 0xfU))),12);
        vcdp->chgBit(c+953,((1U & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U] 
                                   >> 1U))));
        vcdp->chgBit(c+961,((1U & (vlTOPp->top_sim__DOT__processor__DOT__cont_mux_out 
                                   >> 6U))));
        vcdp->chgBus(c+969,((IData)(vlTOPp->top_sim__DOT__processor__DOT__if_id_out)),32);
        vcdp->chgBus(c+977,(vlTOPp->top_sim__DOT__processor__DOT__branch_predictor_FSM__DOT__s),2);
    }
}

void Vtop_sim::traceChgThis__3(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtop_sim* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Variables
    WData/*127:0*/ __Vtemp48[4];
    // Body
    {
        vcdp->chgBus(c+985,(((2U & vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U])
                              ? vlTOPp->top_sim__DOT__data_out
                              : vlTOPp->top_sim__DOT__processor__DOT__mem_csrr_mux_out)),32);
        __Vtemp48[0U] = ((0xfffffff0U & ((vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[3U] 
                                          << 0x1aU) 
                                         | (0x3fffff0U 
                                            & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[2U] 
                                               >> 6U)))) 
                         | (0xfU & vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U]));
        __Vtemp48[1U] = ((0xfU & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[3U] 
                                  >> 6U)) | (0xfffffff0U 
                                             & ((IData)(
                                                        (((QData)((IData)(vlTOPp->top_sim__DOT__data_out)) 
                                                          << 0x20U) 
                                                         | (QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__mem_csrr_mux_out)))) 
                                                << 4U)));
        __Vtemp48[2U] = ((0xfU & ((IData)((((QData)((IData)(vlTOPp->top_sim__DOT__data_out)) 
                                            << 0x20U) 
                                           | (QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__mem_csrr_mux_out)))) 
                                  >> 0x1cU)) | (0xfffffff0U 
                                                & ((IData)(
                                                           ((((QData)((IData)(vlTOPp->top_sim__DOT__data_out)) 
                                                              << 0x20U) 
                                                             | (QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__mem_csrr_mux_out))) 
                                                            >> 0x20U)) 
                                                   << 4U)));
        __Vtemp48[3U] = ((0x1ffff0U & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                       >> 6U)) | (0xfU 
                                                  & ((IData)(
                                                             ((((QData)((IData)(vlTOPp->top_sim__DOT__data_out)) 
                                                                << 0x20U) 
                                                               | (QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__mem_csrr_mux_out))) 
                                                              >> 0x20U)) 
                                                     >> 0x1cU)));
        vcdp->chgArray(c+993,(__Vtemp48),117);
    }
}

void Vtop_sim::traceChgThis__4(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtop_sim* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+1025,(((IData)(vlTOPp->top_sim__DOT__processor__DOT__mistake_trigger)
                               ? ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[1U] 
                                   << 0x14U) | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                                >> 0xcU))
                               : ((IData)(vlTOPp->top_sim__DOT__processor__DOT__predict)
                                   ? ((IData)(vlTOPp->top_sim__DOT__processor__DOT__if_id_out) 
                                      + vlTOPp->top_sim__DOT__processor__DOT__imm_out)
                                   : ((IData)(vlTOPp->top_sim__DOT__processor__DOT__Fence_signal)
                                       ? vlTOPp->top_sim__DOT__processor__DOT__pc_out
                                       : ((IData)(4U) 
                                          + vlTOPp->top_sim__DOT__processor__DOT__pc_out))))),32);
        vcdp->chgBus(c+1033,(((IData)(vlTOPp->top_sim__DOT__processor__DOT__pcsrc)
                               ? ((vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[2U] 
                                   << 0x17U) | (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[1U] 
                                                >> 9U))
                               : ((IData)(vlTOPp->top_sim__DOT__processor__DOT__mistake_trigger)
                                   ? ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[1U] 
                                       << 0x14U) | 
                                      (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                       >> 0xcU)) : 
                                  ((IData)(vlTOPp->top_sim__DOT__processor__DOT__predict)
                                    ? ((IData)(vlTOPp->top_sim__DOT__processor__DOT__if_id_out) 
                                       + vlTOPp->top_sim__DOT__processor__DOT__imm_out)
                                    : ((IData)(vlTOPp->top_sim__DOT__processor__DOT__Fence_signal)
                                        ? vlTOPp->top_sim__DOT__processor__DOT__pc_out
                                        : ((IData)(4U) 
                                           + vlTOPp->top_sim__DOT__processor__DOT__pc_out)))))),32);
        vcdp->chgBit(c+1041,((((0U != (0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                                >> 0xaU))) 
                               & ((0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                            >> 0xaU)) 
                                  == (0x1fU & ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                                << 4U) 
                                               | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[4U] 
                                                  >> 0x1cU))))) 
                              & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U] 
                                 >> 2U))));
        vcdp->chgBit(c+1049,(((((0U != (0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                                 >> 0xaU))) 
                                & ((0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                             >> 0xaU)) 
                                   == (0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                                >> 1U)))) 
                               & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U] 
                                  >> 2U)) | (((0xfffU 
                                               & (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                                  >> 6U)) 
                                              == (0xfffU 
                                                  & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                                     >> 0xfU))) 
                                             & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U] 
                                                >> 3U)))));
        vcdp->chgBit(c+1057,(((((0U != (0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[3U] 
                                                 >> 4U))) 
                                & ((0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[3U] 
                                             >> 4U)) 
                                   == (0x1fU & ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                                 << 4U) 
                                                | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[4U] 
                                                   >> 0x1cU))))) 
                               & ((0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[3U] 
                                            >> 4U)) 
                                  != (0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                               >> 0xaU)))) 
                              & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[0U] 
                                 >> 2U))));
        vcdp->chgBit(c+1065,((((((0U != (0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[3U] 
                                                  >> 4U))) 
                                 & ((0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[3U] 
                                              >> 4U)) 
                                    == (0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                                 >> 1U)))) 
                                & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[0U] 
                                   >> 2U)) & ((0x1fU 
                                               & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[3U] 
                                                  >> 4U)) 
                                              != (0x1fU 
                                                  & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                                     >> 0xaU)))) 
                              | ((((0xfffU & (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                              >> 6U)) 
                                   == (0xfffU & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[3U] 
                                                 >> 9U))) 
                                  & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[0U] 
                                     >> 3U)) & ((0xfffU 
                                                 & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                                    >> 0xfU)) 
                                                != 
                                                (0xfffU 
                                                 & (vlTOPp->top_sim__DOT__processor__DOT__mem_wb_out[3U] 
                                                    >> 9U)))))));
    }
}

void Vtop_sim::traceChgThis__5(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtop_sim* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+1073,(((((0U != (0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                                 >> 0xaU))) 
                                & ((0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                             >> 0xaU)) 
                                   == (0x1fU & ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                                 << 4U) 
                                                | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[4U] 
                                                   >> 0x1cU))))) 
                               & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U] 
                                  >> 2U)) ? vlTOPp->top_sim__DOT__processor__DOT__dataMemOut_fwd_mux_out
                               : ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[2U] 
                                   << 0x14U) | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[1U] 
                                                >> 0xcU)))),32);
        vcdp->chgBus(c+1081,((((((0U != (0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                                  >> 0xaU))) 
                                 & ((0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                              >> 0xaU)) 
                                    == (0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                                 >> 1U)))) 
                                & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U] 
                                   >> 2U)) | (((0xfffU 
                                                & (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                                   >> 6U)) 
                                               == (0xfffU 
                                                   & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[4U] 
                                                      >> 0xfU))) 
                                              & (vlTOPp->top_sim__DOT__processor__DOT__ex_mem_out[0U] 
                                                 >> 3U)))
                               ? vlTOPp->top_sim__DOT__processor__DOT__dataMemOut_fwd_mux_out
                               : ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[3U] 
                                   << 0x14U) | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[2U] 
                                                >> 0xcU)))),32);
    }
}

void Vtop_sim::traceChgThis__6(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtop_sim* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+1089,(vlTOPp->top_sim__DOT__processor__DOT__branch_predictor_FSM__DOT__branch_mem_sig_reg));
    }
}

void Vtop_sim::traceChgThis__7(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtop_sim* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+1097,(vlTOPp->top_sim__DOT__data_clk_stall));
        vcdp->chgBus(c+1105,(vlTOPp->top_sim__DOT__data_mem_inst__DOT__state),32);
        vcdp->chgBus(c+1113,(vlTOPp->top_sim__DOT__data_mem_inst__DOT__read_buf),32);
        vcdp->chgBus(c+1121,(((4U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf))
                               ? vlTOPp->top_sim__DOT__data_mem_inst__DOT__write_data_buffer
                               : vlTOPp->top_sim__DOT__data_mem_inst__DOT__write_out1)),32);
        vcdp->chgBus(c+1129,(vlTOPp->top_sim__DOT__data_mem_inst__DOT__write_out1),32);
        vcdp->chgBit(c+1137,(vlTOPp->top_sim__DOT__data_mem_inst__DOT__select0));
        vcdp->chgBit(c+1145,(vlTOPp->top_sim__DOT__data_mem_inst__DOT__select1));
        vcdp->chgBus(c+1153,(((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__select0)
                               ? ((8U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf))
                                   ? ((0xffffff00U 
                                       & (VL_NEGATE_I((IData)(
                                                              (1U 
                                                               & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                                  >> 0xfU)))) 
                                          << 8U)) | 
                                      (0xffU & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                >> 8U)))
                                   : (0xffU & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                               >> 8U)))
                               : ((8U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf))
                                   ? ((0xffffff00U 
                                       & (VL_NEGATE_I((IData)(
                                                              (1U 
                                                               & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                                  >> 7U)))) 
                                          << 8U)) | 
                                      (0xffU & vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf))
                                   : (0xffU & vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf)))),32);
        vcdp->chgBus(c+1161,(((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__select0)
                               ? ((8U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf))
                                   ? ((0xffffff00U 
                                       & (VL_NEGATE_I((IData)(
                                                              (1U 
                                                               & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                                  >> 0x1fU)))) 
                                          << 8U)) | 
                                      (0xffU & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                >> 0x18U)))
                                   : (0xffU & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                               >> 0x18U)))
                               : ((8U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf))
                                   ? ((0xffffff00U 
                                       & (VL_NEGATE_I((IData)(
                                                              (1U 
                                                               & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                                  >> 0x17U)))) 
                                          << 8U)) | 
                                      (0xffU & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                >> 0x10U)))
                                   : (0xffU & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                               >> 0x10U))))),32);
        vcdp->chgBus(c+1169,(((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__select0)
                               ? ((8U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf))
                                   ? ((0xffff0000U 
                                       & (VL_NEGATE_I((IData)(
                                                              (1U 
                                                               & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                                  >> 0x1fU)))) 
                                          << 0x10U)) 
                                      | (0xffffU & 
                                         (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                          >> 0x10U)))
                                   : ((0xff00U & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                  >> 0x10U)) 
                                      | (0xffU & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                  >> 0x10U))))
                               : ((8U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf))
                                   ? ((0xffff0000U 
                                       & (VL_NEGATE_I((IData)(
                                                              (1U 
                                                               & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                                  >> 0xfU)))) 
                                          << 0x10U)) 
                                      | (0xffffU & vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf))
                                   : (0xffffU & vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf)))),32);
        vcdp->chgBus(c+1177,(((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__select1)
                               ? ((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__select0)
                                   ? ((8U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf))
                                       ? ((0xffffff00U 
                                           & (VL_NEGATE_I((IData)(
                                                                  (1U 
                                                                   & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                                      >> 0x1fU)))) 
                                              << 8U)) 
                                          | (0xffU 
                                             & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                >> 0x18U)))
                                       : (0xffU & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                   >> 0x18U)))
                                   : ((8U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf))
                                       ? ((0xffffff00U 
                                           & (VL_NEGATE_I((IData)(
                                                                  (1U 
                                                                   & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                                      >> 0x17U)))) 
                                              << 8U)) 
                                          | (0xffU 
                                             & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                >> 0x10U)))
                                       : (0xffU & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                   >> 0x10U))))
                               : ((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__select0)
                                   ? ((8U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf))
                                       ? ((0xffffff00U 
                                           & (VL_NEGATE_I((IData)(
                                                                  (1U 
                                                                   & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                                      >> 0xfU)))) 
                                              << 8U)) 
                                          | (0xffU 
                                             & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                >> 8U)))
                                       : (0xffU & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                   >> 8U)))
                                   : ((8U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf))
                                       ? ((0xffffff00U 
                                           & (VL_NEGATE_I((IData)(
                                                                  (1U 
                                                                   & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                                      >> 7U)))) 
                                              << 8U)) 
                                          | (0xffU 
                                             & vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf))
                                       : (0xffU & vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf))))),32);
        vcdp->chgBus(c+1185,(((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__select1)
                               ? vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf
                               : ((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__select0)
                                   ? ((8U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf))
                                       ? ((0xffff0000U 
                                           & (VL_NEGATE_I((IData)(
                                                                  (1U 
                                                                   & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                                      >> 0x1fU)))) 
                                              << 0x10U)) 
                                          | (0xffffU 
                                             & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                >> 0x10U)))
                                       : ((0xff00U 
                                           & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                              >> 0x10U)) 
                                          | (0xffU 
                                             & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                >> 0x10U))))
                                   : ((8U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf))
                                       ? ((0xffff0000U 
                                           & (VL_NEGATE_I((IData)(
                                                                  (1U 
                                                                   & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                                                      >> 0xfU)))) 
                                              << 0x10U)) 
                                          | (0xffffU 
                                             & vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf))
                                       : (0xffffU & vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf))))),32);
    }
}

void Vtop_sim::traceChgThis__8(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtop_sim* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+1193,((1U & (vlTOPp->top_sim__DOT__processor__DOT__ex_cont_mux_out 
                                    >> 4U))));
        vcdp->chgBit(c+1201,((1U & (vlTOPp->top_sim__DOT__processor__DOT__ex_cont_mux_out 
                                    >> 5U))));
        vcdp->chgBus(c+1209,((0xfU & ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                       << 0xdU) | (
                                                   vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[4U] 
                                                   >> 0x13U)))),4);
        vcdp->chgArray(c+1217,(vlTOPp->top_sim__DOT__processor__DOT__id_ex_out),178);
        vcdp->chgBus(c+1265,(vlTOPp->top_sim__DOT__processor__DOT__ex_cont_mux_out),32);
        vcdp->chgBus(c+1273,((0x1ffU & vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U])),32);
        vcdp->chgBus(c+1281,(((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[1U] 
                               << 0x14U) | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                            >> 0xcU))),32);
        vcdp->chgBit(c+1289,((1U & (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                    >> 0xbU))));
        vcdp->chgBus(c+1297,(((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[4U] 
                               << 0x14U) | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[3U] 
                                            >> 0xcU))),32);
        vcdp->chgBit(c+1305,((1U & (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                    >> 0xaU))));
        vcdp->chgBus(c+1313,((0x7fU & ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                        << 0x14U) | 
                                       (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[4U] 
                                        >> 0xcU)))),7);
        vcdp->chgBit(c+1321,((1U & (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                    >> 9U))));
        vcdp->chgBus(c+1329,((0x1fU & ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                        << 4U) | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[4U] 
                                                  >> 0x1cU)))),5);
        vcdp->chgBus(c+1337,((0x1fU & (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                       >> 1U))),5);
        vcdp->chgBus(c+1345,((0xfffU & (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                        >> 6U))),12);
        vcdp->chgBus(c+1353,(((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[2U] 
                               << 0x14U) | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[1U] 
                                            >> 0xcU))),32);
        vcdp->chgBus(c+1361,(((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[3U] 
                               << 0x14U) | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[2U] 
                                            >> 0xcU))),32);
    }
}

void Vtop_sim::traceChgThis__9(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtop_sim* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Variables
    WData/*95:0*/ __Vtemp49[3];
    WData/*159:0*/ __Vtemp51[5];
    WData/*159:0*/ __Vtemp53[5];
    // Body
    {
        vcdp->chgBus(c+1369,(((0x800U & vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U])
                               ? vlTOPp->top_sim__DOT__processor__DOT__wb_fwd1_mux_out
                               : ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[1U] 
                                   << 0x14U) | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                                >> 0xcU)))),32);
        vcdp->chgBus(c+1377,((((0x800U & vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U])
                                ? vlTOPp->top_sim__DOT__processor__DOT__wb_fwd1_mux_out
                                : ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[1U] 
                                    << 0x14U) | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                                 >> 0xcU))) 
                              + ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[4U] 
                                  << 0x14U) | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[3U] 
                                               >> 0xcU)))),32);
        __Vtemp49[1U] = ((0x1ffU & ((IData)((((QData)((IData)(
                                                              (((0x800U 
                                                                 & vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U])
                                                                 ? vlTOPp->top_sim__DOT__processor__DOT__wb_fwd1_mux_out
                                                                 : 
                                                                ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[1U] 
                                                                  << 0x14U) 
                                                                 | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                                                    >> 0xcU))) 
                                                               + 
                                                               ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[4U] 
                                                                 << 0x14U) 
                                                                | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[3U] 
                                                                   >> 0xcU))))) 
                                              << 0x20U) 
                                             | (QData)((IData)(
                                                               ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[1U] 
                                                                 << 0x14U) 
                                                                | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                                                   >> 0xcU)))))) 
                                    >> 0x17U)) | (0xfffffe00U 
                                                  & ((IData)(
                                                             ((((QData)((IData)(
                                                                                (((0x800U 
                                                                                & vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U])
                                                                                 ? vlTOPp->top_sim__DOT__processor__DOT__wb_fwd1_mux_out
                                                                                 : 
                                                                                ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[1U] 
                                                                                << 0x14U) 
                                                                                | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                                                                >> 0xcU))) 
                                                                                + 
                                                                                ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[4U] 
                                                                                << 0x14U) 
                                                                                | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[3U] 
                                                                                >> 0xcU))))) 
                                                                << 0x20U) 
                                                               | (QData)((IData)(
                                                                                ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[1U] 
                                                                                << 0x14U) 
                                                                                | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                                                                >> 0xcU))))) 
                                                              >> 0x20U)) 
                                                     << 9U)));
        __Vtemp51[2U] = ((0xfffffc00U & ((IData)((((QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__wb_fwd2_mux_out)) 
                                                   << 0x20U) 
                                                  | (QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__lui_result)))) 
                                         << 0xaU)) 
                         | ((0xfffffe00U & ((IData)(vlTOPp->top_sim__DOT__processor__DOT__alu_branch_enable) 
                                            << 9U)) 
                            | (0x1ffU & ((IData)(((
                                                   ((QData)((IData)(
                                                                    (((0x800U 
                                                                       & vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U])
                                                                       ? vlTOPp->top_sim__DOT__processor__DOT__wb_fwd1_mux_out
                                                                       : 
                                                                      ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[1U] 
                                                                        << 0x14U) 
                                                                       | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                                                          >> 0xcU))) 
                                                                     + 
                                                                     ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[4U] 
                                                                       << 0x14U) 
                                                                      | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[3U] 
                                                                         >> 0xcU))))) 
                                                    << 0x20U) 
                                                   | (QData)((IData)(
                                                                     ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[1U] 
                                                                       << 0x14U) 
                                                                      | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                                                         >> 0xcU))))) 
                                                  >> 0x20U)) 
                                         >> 0x17U))));
        __Vtemp53[0U] = ((0xfffffe00U & ((IData)((((QData)((IData)(
                                                                   (((0x800U 
                                                                      & vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U])
                                                                      ? vlTOPp->top_sim__DOT__processor__DOT__wb_fwd1_mux_out
                                                                      : 
                                                                     ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[1U] 
                                                                       << 0x14U) 
                                                                      | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                                                         >> 0xcU))) 
                                                                    + 
                                                                    ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[4U] 
                                                                      << 0x14U) 
                                                                     | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[3U] 
                                                                        >> 0xcU))))) 
                                                   << 0x20U) 
                                                  | (QData)((IData)(
                                                                    ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[1U] 
                                                                      << 0x14U) 
                                                                     | (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[0U] 
                                                                        >> 0xcU)))))) 
                                         << 9U)) | 
                         (0x1ffU & vlTOPp->top_sim__DOT__processor__DOT__ex_cont_mux_out));
        __Vtemp53[1U] = __Vtemp49[1U];
        __Vtemp53[2U] = __Vtemp51[2U];
        __Vtemp53[3U] = ((0x3ffU & ((IData)((((QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__wb_fwd2_mux_out)) 
                                              << 0x20U) 
                                             | (QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__lui_result)))) 
                                    >> 0x16U)) | (0xfffffc00U 
                                                  & ((IData)(
                                                             ((((QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__wb_fwd2_mux_out)) 
                                                                << 0x20U) 
                                                               | (QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__lui_result))) 
                                                              >> 0x20U)) 
                                                     << 0xaU)));
        __Vtemp53[4U] = ((0x7ff8000U & (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                        << 9U)) | (
                                                   (0x7c00U 
                                                    & ((vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[5U] 
                                                        << 0x13U) 
                                                       | (0x7fc00U 
                                                          & (vlTOPp->top_sim__DOT__processor__DOT__id_ex_out[4U] 
                                                             >> 0xdU)))) 
                                                   | (0x3ffU 
                                                      & ((IData)(
                                                                 ((((QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__wb_fwd2_mux_out)) 
                                                                    << 0x20U) 
                                                                   | (QData)((IData)(vlTOPp->top_sim__DOT__processor__DOT__lui_result))) 
                                                                  >> 0x20U)) 
                                                         >> 0x16U))));
        vcdp->chgArray(c+1385,(__Vtemp53),155);
    }
}

void Vtop_sim::traceChgThis__10(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtop_sim* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+1425,(vlTOPp->top_sim__DOT__clk_proc));
    }
}

void Vtop_sim::traceChgThis__11(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtop_sim* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+1433,((0x3fffU & vlTOPp->top_sim__DOT__processor__DOT__lui_result)),14);
        vcdp->chgBus(c+1441,(vlTOPp->top_sim__DOT__processor__DOT__wb_fwd2_mux_out),32);
        vcdp->chgBus(c+1449,(vlTOPp->top_sim__DOT__processor__DOT__lui_result),32);
        vcdp->chgBus(c+1457,(vlTOPp->top_sim__DOT__processor__DOT__alu_mux_out),32);
        vcdp->chgBit(c+1465,(vlTOPp->top_sim__DOT__processor__DOT__alu_branch_enable));
        vcdp->chgBus(c+1473,(vlTOPp->top_sim__DOT__processor__DOT__alu_result),32);
        vcdp->chgBus(c+1481,(vlTOPp->top_sim__DOT__processor__DOT__reg_dat_mux_out),32);
        vcdp->chgBus(c+1489,(vlTOPp->top_sim__DOT__processor__DOT__dataMemOut_fwd_mux_out),32);
        vcdp->chgBus(c+1497,(vlTOPp->top_sim__DOT__processor__DOT__wb_fwd1_mux_out),32);
    }
}

void Vtop_sim::traceChgThis__12(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtop_sim* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+1505,(((((vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf 
                                 == (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__rdAddrA_buf)) 
                                & (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__write_buf)) 
                               & (0U != vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf))
                               ? vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrData_buf
                               : vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regDatA)),32);
        vcdp->chgBus(c+1513,(((((vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf 
                                 == (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__rdAddrB_buf)) 
                                & (IData)(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__write_buf)) 
                               & (0U != vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf))
                               ? vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrData_buf
                               : vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regDatB)),32);
        vcdp->chgBus(c+1521,(vlTOPp->top_sim__DOT__processor__DOT__rdValOut_CSR),32);
        vcdp->chgBus(c+1529,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__rdAddrA_buf),5);
        vcdp->chgBus(c+1537,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__rdAddrB_buf),5);
        vcdp->chgBus(c+1545,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regDatA),32);
        vcdp->chgBus(c+1553,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__regDatB),32);
        vcdp->chgBus(c+1561,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrAddr_buf),32);
        vcdp->chgBus(c+1569,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__wrData_buf),32);
        vcdp->chgBit(c+1577,(vlTOPp->top_sim__DOT__processor__DOT__register_files__DOT__write_buf));
    }
}

void Vtop_sim::traceChgThis__13(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtop_sim* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBus(c+1585,(vlTOPp->top_sim__DOT__data_out),32);
        vcdp->chgBus(c+1593,(vlTOPp->top_sim__DOT__data_mem_inst__DOT__led_reg),32);
        vcdp->chgBus(c+1601,(vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf),32);
        vcdp->chgBit(c+1609,(vlTOPp->top_sim__DOT__data_mem_inst__DOT__memread_buf));
        vcdp->chgBit(c+1617,(vlTOPp->top_sim__DOT__data_mem_inst__DOT__memwrite_buf));
        vcdp->chgBus(c+1625,(vlTOPp->top_sim__DOT__data_mem_inst__DOT__write_data_buffer),32);
        vcdp->chgBus(c+1633,(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf),14);
        vcdp->chgBus(c+1641,(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf),4);
        vcdp->chgBus(c+1649,((0x3ffU & ((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf) 
                                        >> 2U))),10);
        vcdp->chgBus(c+1657,((3U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf))),2);
        vcdp->chgBus(c+1665,((0xffU & vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf)),8);
        vcdp->chgBus(c+1673,((0xffU & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                       >> 8U))),8);
        vcdp->chgBus(c+1681,((0xffU & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                       >> 0x10U))),8);
        vcdp->chgBus(c+1689,((0xffU & (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                       >> 0x18U))),8);
        vcdp->chgBit(c+1697,((1U & ((~ ((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf) 
                                        >> 1U)) & (~ (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf))))));
        vcdp->chgBit(c+1705,((1U & ((~ ((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf) 
                                        >> 1U)) & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf)))));
        vcdp->chgBit(c+1713,((1U & (((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf) 
                                     >> 1U) & (~ (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf))))));
        vcdp->chgBit(c+1721,((1U & (((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf) 
                                     >> 1U) & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf)))));
        vcdp->chgBus(c+1729,((0xffU & ((1U & ((~ ((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf) 
                                                  >> 1U)) 
                                              & (~ (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf))))
                                        ? vlTOPp->top_sim__DOT__data_mem_inst__DOT__write_data_buffer
                                        : vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf))),8);
        vcdp->chgBus(c+1737,((0xffU & ((1U & ((~ ((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf) 
                                                  >> 1U)) 
                                              & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf)))
                                        ? vlTOPp->top_sim__DOT__data_mem_inst__DOT__write_data_buffer
                                        : (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                           >> 8U)))),8);
        vcdp->chgBus(c+1745,((0xffU & ((1U & (((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf) 
                                               >> 1U) 
                                              & (~ (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf))))
                                        ? vlTOPp->top_sim__DOT__data_mem_inst__DOT__write_data_buffer
                                        : (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                           >> 0x10U)))),8);
        vcdp->chgBus(c+1753,((0xffU & ((1U & (((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf) 
                                               >> 1U) 
                                              & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf)))
                                        ? vlTOPp->top_sim__DOT__data_mem_inst__DOT__write_data_buffer
                                        : (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                           >> 0x18U)))),8);
        vcdp->chgBus(c+1761,((0xffffU & ((2U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf))
                                          ? vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf
                                          : vlTOPp->top_sim__DOT__data_mem_inst__DOT__write_data_buffer))),16);
        vcdp->chgBus(c+1769,((0xffffU & ((2U & (IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__addr_buf))
                                          ? vlTOPp->top_sim__DOT__data_mem_inst__DOT__write_data_buffer
                                          : (vlTOPp->top_sim__DOT__data_mem_inst__DOT__word_buf 
                                             >> 0x10U)))),16);
        vcdp->chgBit(c+1777,((1U & ((~ ((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf) 
                                        >> 2U)) & ((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf) 
                                                   >> 1U)))));
        vcdp->chgBit(c+1785,((1U & ((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf) 
                                    >> 2U))));
        vcdp->chgBit(c+1793,((1U & ((IData)(vlTOPp->top_sim__DOT__data_mem_inst__DOT__sign_mask_buf) 
                                    >> 1U))));
    }
}

void Vtop_sim::traceChgThis__14(Vtop_sim__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtop_sim* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(c+1801,(vlTOPp->clk));
        vcdp->chgBus(c+1809,(vlTOPp->led),8);
    }
}
