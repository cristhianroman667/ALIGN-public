//Verilog block level netlist file for Sanitized_TempSensor
//Generated by UMN for ALIGN project 


module Sanitized_TempSensor ( AVDD, AVSS, CFG<0>, CFG<14>, CFG<15>, CFG<1>, CFG<2>, CFG<3>, CFG<4>, CFG<5>, CFG<6>, CFG<7>, CKIN, D<0>, D<1>, D<2>, D<3>, D<4>, D<5>, D<6>, D<7>, D<8>, DONE, PRESET ); 
input AVDD, AVSS, CFG<0>, CFG<14>, CFG<15>, CFG<1>, CFG<2>, CFG<3>, CFG<4>, CFG<5>, CFG<6>, CFG<7>, CKIN, D<0>, D<1>, D<2>, D<3>, D<4>, D<5>, D<6>, D<7>, D<8>, DONE, PRESET;

TempSensorCore_Post_Copy XI0 ( .CFG<7>(CFG<7>), .CFG<6>(CFG<6>), .CFG<5>(CFG<5>), .CFG<4>(CFG<4>), .CFG<3>(CFG<3>), .CFG<2>(CFG<2>), .CFG<1>(CFG<1>), .CFG<0>(CFG<0>), .CFG<15>(CFG<15>), .CFG<14>(CFG<14>), .CKIN(CKIN), .D<8>(D<8>), .D<7>(D<7>), .D<6>(D<6>), .D<5>(D<5>), .D<4>(D<4>), .D<3>(D<3>), .D<2>(D<2>), .D<1>(D<1>), .D<0>(D<0>), .DONE(DONE), .PRESET(PRESET) ); 
Dcap_NMOS_n12_X1_Y1 MM1 ( .B(AVSS), .S(AVSS), .G(AVDD) ); 
Dcap_NMOS_n12_X1_Y1 MM0 ( .B(AVSS), .S(AVSS), .G(AVDD) ); 

endmodule

module TempSensorCore_Post_Copy ( CFG<0>, CFG<14>, CFG<15>, CFG<1>, CFG<2>, CFG<3>, CFG<4>, CFG<5>, CFG<6>, CFG<7>, CKIN, D<0>, D<1>, D<2>, D<3>, D<4>, D<5>, D<6>, D<7>, D<8>, DONE, PRESET ); 
input CFG<0>, CFG<14>, CFG<15>, CFG<1>, CFG<2>, CFG<3>, CFG<4>, CFG<5>, CFG<6>, CFG<7>, CKIN, D<0>, D<1>, D<2>, D<3>, D<4>, D<5>, D<6>, D<7>, D<8>, DONE, PRESET;

CK_DividerBy8 XI0 ( .CKIN(CKIN), .COMPEN(COMPEN), .INPHASE(net014), .OUTPHASE(net013), .PRESET(PRESET), .QPHASE(QPHASE) ); 
SARLogic XI6 ( .COMPEN(COMPEN), .D<8>(D<8>), .D<7>(D<7>), .D<6>(D<6>), .D<5>(D<5>), .D<4>(D<4>), .D<3>(D<3>), .D<2>(D<2>), .D<1>(D<1>), .D<0>(D<0>), .DONE(DONE), .PRESET(PRESET), .VCTL0<8>(net024<0>), .VCTL0<7>(net024<1>), .VCTL0<6>(net024<2>), .VCTL0<5>(net024<3>), .VCTL0<4>(net024<4>), .VCTL0<3>(net024<5>), .VCTL0<2>(net024<6>), .VCTL0<1>(net024<7>), .VCTL0<0>(net024<8>), .VCTLIN<8>(net025<0>), .VCTLIN<7>(net025<1>), .VCTLIN<6>(net025<2>), .VCTLIN<5>(net025<3>), .VCTLIN<4>(net025<4>), .VCTLIN<3>(net025<5>), .VCTLIN<2>(net025<6>), .VCTLIN<1>(net025<7>), .VCTLIN<0>(net025<8>), .VONLATCH(VONL), .VOPLATCH(VOPL) ); 
ResTune_CFG XI8 ( .INPH(net014), .INPHASE<7>(net023<0>), .INPHASE<6>(net023<1>), .INPHASE<5>(net023<2>), .INPHASE<4>(net023<3>), .INPHASE<3>(net023<4>), .INPHASE<2>(net023<5>), .INPHASE<1>(net023<6>), .INPHASE<0>(net023<7>), .OUTPH(net013), .OUTPHASE<7>(net022<0>), .OUTPHASE<6>(net022<1>), .OUTPHASE<5>(net022<2>), .OUTPHASE<4>(net022<3>), .OUTPHASE<3>(net022<4>), .OUTPHASE<2>(net022<5>), .OUTPHASE<1>(net022<6>), .OUTPHASE<0>(net022<7>), .RESEN<7>(CFG<7>), .RESEN<6>(CFG<6>), .RESEN<5>(CFG<5>), .RESEN<4>(CFG<4>), .RESEN<3>(CFG<3>), .RESEN<2>(CFG<2>), .RESEN<1>(CFG<1>), .RESEN<0>(CFG<0>) ); 
CrossingDetector XI7 ( .QD(net019), .QPHASE(QPHASE), .SQ(CFG<14>), .SS(CFG<15>), .VCP(net010), .VCPS(net020) ); 
EdgeComparator XI5 ( .COMPEN(COMPEN), .PRESET(PRESET), .VIN(net019), .VIP(net020), .VONL(VONL), .VOPL(VOPL) ); 
PP_RCFilter XI2 ( .INPHASE<7>(net023<0>), .INPHASE<6>(net023<1>), .INPHASE<5>(net023<2>), .INPHASE<4>(net023<3>), .INPHASE<3>(net023<4>), .INPHASE<2>(net023<5>), .INPHASE<1>(net023<6>), .INPHASE<0>(net023<7>), .OUTPHASE<7>(net022<0>), .OUTPHASE<6>(net022<1>), .OUTPHASE<5>(net022<2>), .OUTPHASE<4>(net022<3>), .OUTPHASE<3>(net022<4>), .OUTPHASE<2>(net022<5>), .OUTPHASE<1>(net022<6>), .OUTPHASE<0>(net022<7>), .VCTL0<8>(net024<0>), .VCTL0<7>(net024<1>), .VCTL0<6>(net024<2>), .VCTL0<5>(net024<3>), .VCTL0<4>(net024<4>), .VCTL0<3>(net024<5>), .VCTL0<2>(net024<6>), .VCTL0<1>(net024<7>), .VCTL0<0>(net024<8>), .VCTLIN<8>(net025<0>), .VCTLIN<7>(net025<1>), .VCTLIN<6>(net025<2>), .VCTLIN<5>(net025<3>), .VCTLIN<4>(net025<4>), .VCTLIN<3>(net025<5>), .VCTLIN<2>(net025<6>), .VCTLIN<1>(net025<7>), .VCTLIN<0>(net025<8>), .VDLPF_P(net010) ); 

endmodule

module CK_DividerBy8 ( CKIN, COMPEN, INPHASE, OUTPHASE, PRESET, QPHASE ); 
input CKIN, COMPEN, INPHASE, OUTPHASE, PRESET, QPHASE;

INVD2LVT XI14 ( .I(PRESET), .ZN(net039) ); 
DCAP8LVT XI51<18> (  ); 
DCAP8LVT XI51<17> (  ); 
DCAP8LVT XI51<16> (  ); 
DCAP8LVT XI51<15> (  ); 
DCAP8LVT XI51<14> (  ); 
DCAP8LVT XI51<13> (  ); 
DCAP8LVT XI51<12> (  ); 
DCAP8LVT XI51<11> (  ); 
DCAP8LVT XI51<10> (  ); 
DCAP8LVT XI51<9> (  ); 
DCAP8LVT XI51<8> (  ); 
DCAP8LVT XI51<7> (  ); 
DCAP8LVT XI51<6> (  ); 
DCAP8LVT XI51<5> (  ); 
DCAP8LVT XI51<4> (  ); 
DCAP8LVT XI51<3> (  ); 
DCAP8LVT XI51<2> (  ); 
DCAP8LVT XI51<1> (  ); 
DCAP8LVT XI51<0> (  ); 
INVD1LVT XI50 ( .I(PRESET), .ZN(net048) ); 
CKBD1LVT XI6 ( .I(CKIN), .Z(net45) ); 
AN2D1LVT XI139 ( .A1(net048), .A2(net015), .Z(COMPEN) ); 
CKND1LVT XI5 ( .I(net45), .ZN(net49) ); 
DFCND1LVT XI8 ( .CDN(net039), .CP(net011), .D(net48), .Q(net015), .QN(net48) ); 
DFCND1LVT XI7 ( .CDN(net039), .CP(net018), .D(net50), .Q(net076), .QN(net50) ); 
CKND3LVT XI43 ( .I(net076), .ZN(net059) ); 
CKND3LVT XI39 ( .I(net48), .ZN(net063) ); 
CKND3LVT XI37 ( .I(net015), .ZN(net064) ); 
CKND8LVT XI42 ( .I(net059), .ZN(QPHASE) ); 
CKND8LVT XI38 ( .I(net063), .ZN(OUTPHASE) ); 
CKND8LVT XI20 ( .I(net064), .ZN(INPHASE) ); 
DFCND1LVT_schematic XI29 ( .CDN(net039), .CP(net49), .D(net016), .QN(net016) ); 
DFCND1LVT_schematic XI28 ( .CDN(net039), .CP(net016), .D(net018), .QN(net018) ); 
DFCND1LVT_schematic XI27 ( .CDN(net039), .CP(net45), .D(net040), .QN(net040) ); 
DFCND1LVT_schematic XI26 ( .CDN(net039), .CP(net040), .D(net011), .QN(net011) ); 

endmodule

module INVD2LVT ( I, ZN ); 
input I, ZN;

Switch_NMOS_n12_X1_Y1 MMU1_0_M_u2 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMU1_1_M_u2 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_PMOS_n12_X1_Y1 MMU1_0_M_u3 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMU1_1_M_u3 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 

endmodule

module DCAP8LVT (  ); 
Dcap_NMOS_n12_X1_Y1 MMI4 ( .B(VSS), .S(VSS), .G(net9) ); 
Switch_NMOS_n12_X1_Y1 MM_u2 ( .B(VSS), .D(net11), .G(net9), .S(VSS) ); 
Dcap_PMOS_n12_X1_Y1 MMI3 ( .B(VDD), .S(VDD), .G(net11) ); 
Switch_PMOS_n12_X1_Y1 MM_u1 ( .B(VDD), .D(net9), .G(net11), .S(VDD) ); 

endmodule

module INVD1LVT ( I, ZN ); 
input I, ZN;

Switch_NMOS_n12_X1_Y1 MMU1_M_u2 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_PMOS_n12_X1_Y1 MMU1_M_u3 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 

endmodule

module INV_LVT ( SN, SP, i, zn ); 
input SN, SP, i, zn;

Switch_NMOS_n12_X1_Y1 xm0 ( .B(SN), .D(zn), .G(i), .S(SN) ); 
Switch_PMOS_n12_X1_Y1 xm1 ( .B(SP), .D(zn), .G(i), .S(SP) ); 

endmodule

module stage2_inv ( G1, G2, SN, SP ); 
input G1, G2, SN, SP;

INV_LVT MM0_MM2 ( .zn(G1), .i(D), .SN(SN), .SP(SP) ); 
INV_LVT MM1_MM3 ( .zn(D), .i(G2), .SN(SN), .SP(SP) ); 

endmodule

module CKBD1LVT ( I, Z ); 
input I, Z;

stage2_inv MMU23_MM_u15_MMU21_MM_u3 ( .G1(Z), .SN(VSS), .G2(I), .SP(VDD) ); 

endmodule

module AN2D1LVT ( A1, A2, Z ); 
input A1, A2, Z;

Switch_PMOS_n12_X1_Y1 MM_u3_M_u3 ( .B(VDD), .D(Z), .G(net5), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u2_M_u1 ( .B(VDD), .D(net5), .G(A1), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u2_M_u2 ( .B(VDD), .D(net5), .G(A2), .S(VDD) ); 
Switch_NMOS_n12_X1_Y1 MM_u3_M_u2 ( .B(VSS), .D(Z), .G(net5), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_M_u4 ( .B(VSS), .D(net17), .G(A2), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_M_u3 ( .B(VSS), .D(net5), .G(A1), .S(net17) ); 

endmodule

module CKND1LVT ( I, ZN ); 
input I, ZN;

Switch_NMOS_n12_X1_Y1 MM_u2 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_PMOS_n12_X1_Y1 MM_u1 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 

endmodule

module DFCND1LVT ( CDN, CP, D, Q, QN ); 
input CDN, CP, D, Q, QN;

Switch_NMOS_n12_X1_Y1 MMI29_M_u2 ( .B(VSS), .D(QN), .G(net33), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI4 ( .B(VSS), .D(net53), .G(net5), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI18 ( .B(VSS), .D(net33), .G(net5), .S(net79) ); 
Switch_NMOS_n12_X1_Y1 MMI21_M_u3 ( .B(VSS), .D(net95), .G(net79), .S(net9) ); 
Switch_NMOS_n12_X1_Y1 MMI13_M_u2 ( .B(VSS), .D(net81), .G(net25), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI15 ( .B(VSS), .D(net81), .G(net67), .S(net79) ); 
Switch_NMOS_n12_X1_Y1 MMI14_M_u2 ( .B(VSS), .D(net33), .G(net95), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI32_M_u2 ( .B(VSS), .D(net67), .G(net5), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI5 ( .B(VSS), .D(net25), .G(D), .S(net53) ); 
Switch_NMOS_n12_X1_Y1 MMI49 ( .B(VSS), .D(net20), .G(CDN), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI48 ( .B(VSS), .D(net17), .G(net81), .S(net20) ); 
Switch_NMOS_n12_X1_Y1 MMI27_M_u2 ( .B(VSS), .D(Q), .G(net95), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI21_M_u4 ( .B(VSS), .D(net9), .G(CDN), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI22_M_u2 ( .B(VSS), .D(net5), .G(CP), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI47 ( .B(VSS), .D(net25), .G(net67), .S(net17) ); 
Switch_PMOS_n12_X1_Y1 MMI14_M_u3 ( .B(VDD), .D(net33), .G(net95), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI22_M_u3 ( .B(VDD), .D(net5), .G(CP), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI32_M_u3 ( .B(VDD), .D(net67), .G(net5), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI43 ( .B(VDD), .D(net72), .G(net81), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI6 ( .B(VDD), .D(net25), .G(D), .S(net104) ); 
Switch_PMOS_n12_X1_Y1 MMI29_M_u3 ( .B(VDD), .D(QN), .G(net33), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI27_M_u3 ( .B(VDD), .D(Q), .G(net95), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI44 ( .B(VDD), .D(net72), .G(CDN), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI17 ( .B(VDD), .D(net33), .G(net67), .S(net79) ); 
Switch_PMOS_n12_X1_Y1 MMI13_M_u3 ( .B(VDD), .D(net81), .G(net25), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI21_M_u1 ( .B(VDD), .D(net95), .G(net79), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI16 ( .B(VDD), .D(net81), .G(net5), .S(net79) ); 
Switch_PMOS_n12_X1_Y1 MMI45 ( .B(VDD), .D(net25), .G(net5), .S(net72) ); 
Switch_PMOS_n12_X1_Y1 MMI7 ( .B(VDD), .D(net104), .G(net67), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI21_M_u2 ( .B(VDD), .D(net95), .G(CDN), .S(VDD) ); 

endmodule

module CKND3LVT ( I, ZN ); 
input I, ZN;

Switch_PMOS_n12_X1_Y1 MM_u1_0 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u1_2 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u1_1 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_1 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_0 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_2 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 

endmodule

module CKND8LVT ( I, ZN ); 
input I, ZN;

Switch_PMOS_n12_X1_Y1 MM_u1_7 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u1_0 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u1_3 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u1_2 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u1_4 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u1_6 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u1_1 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u1_5 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_1 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_6 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_3 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_4 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_7 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_0 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_2 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_5 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 

endmodule

module DFCND1LVT_schematic ( CDN, CP, D, QN ); 
input CDN, CP, D, QN;

Switch_NMOS_n12_X1_Y1 MMI29_M_u2 ( .B(VSS), .D(QN), .G(net33), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI4 ( .B(VSS), .D(net53), .G(net5), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI18 ( .B(VSS), .D(net33), .G(net5), .S(net79) ); 
Switch_NMOS_n12_X1_Y1 MMI21_M_u3 ( .B(VSS), .D(net95), .G(net79), .S(net9) ); 
Switch_NMOS_n12_X1_Y1 MMI13_M_u2 ( .B(VSS), .D(net81), .G(net25), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI15 ( .B(VSS), .D(net81), .G(net67), .S(net79) ); 
Switch_NMOS_n12_X1_Y1 MMI14_M_u2 ( .B(VSS), .D(net33), .G(net95), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI32_M_u2 ( .B(VSS), .D(net67), .G(net5), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI5 ( .B(VSS), .D(net25), .G(D), .S(net53) ); 
Switch_NMOS_n12_X1_Y1 MMI49 ( .B(VSS), .D(net20), .G(CDN), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI48 ( .B(VSS), .D(net17), .G(net81), .S(net20) ); 
Switch_NMOS_n12_X1_Y1 MMI27_M_u2 ( .B(VSS), .D(net036), .G(net95), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI21_M_u4 ( .B(VSS), .D(net9), .G(CDN), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI22_M_u2 ( .B(VSS), .D(net5), .G(CP), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI47 ( .B(VSS), .D(net25), .G(net67), .S(net17) ); 
Switch_PMOS_n12_X1_Y1 MMI14_M_u3 ( .B(VDD), .D(net33), .G(net95), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI22_M_u3 ( .B(VDD), .D(net5), .G(CP), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI32_M_u3 ( .B(VDD), .D(net67), .G(net5), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI43 ( .B(VDD), .D(net72), .G(net81), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI6 ( .B(VDD), .D(net25), .G(D), .S(net104) ); 
Switch_PMOS_n12_X1_Y1 MMI29_M_u3 ( .B(VDD), .D(QN), .G(net33), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI27_M_u3 ( .B(VDD), .D(net036), .G(net95), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI44 ( .B(VDD), .D(net72), .G(CDN), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI17 ( .B(VDD), .D(net33), .G(net67), .S(net79) ); 
Switch_PMOS_n12_X1_Y1 MMI13_M_u3 ( .B(VDD), .D(net81), .G(net25), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI21_M_u1 ( .B(VDD), .D(net95), .G(net79), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI16 ( .B(VDD), .D(net81), .G(net5), .S(net79) ); 
Switch_PMOS_n12_X1_Y1 MMI45 ( .B(VDD), .D(net25), .G(net5), .S(net72) ); 
Switch_PMOS_n12_X1_Y1 MMI7 ( .B(VDD), .D(net104), .G(net67), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI21_M_u2 ( .B(VDD), .D(net95), .G(CDN), .S(VDD) ); 

endmodule

module SARLogic ( COMPEN, D<0>, D<1>, D<2>, D<3>, D<4>, D<5>, D<6>, D<7>, D<8>, DONE, PRESET, VCTL0<0>, VCTL0<1>, VCTL0<2>, VCTL0<3>, VCTL0<4>, VCTL0<5>, VCTL0<6>, VCTL0<7>, VCTL0<8>, VCTLIN<0>, VCTLIN<1>, VCTLIN<2>, VCTLIN<3>, VCTLIN<4>, VCTLIN<5>, VCTLIN<6>, VCTLIN<7>, VCTLIN<8>, VONLATCH, VOPLATCH ); 
input COMPEN, D<0>, D<1>, D<2>, D<3>, D<4>, D<5>, D<6>, D<7>, D<8>, DONE, PRESET, VCTL0<0>, VCTL0<1>, VCTL0<2>, VCTL0<3>, VCTL0<4>, VCTL0<5>, VCTL0<6>, VCTL0<7>, VCTL0<8>, VCTLIN<0>, VCTLIN<1>, VCTLIN<2>, VCTLIN<3>, VCTLIN<4>, VCTLIN<5>, VCTLIN<6>, VCTLIN<7>, VCTLIN<8>, VONLATCH, VOPLATCH;

DCAP8LVT XI3<27> (  ); 
DCAP8LVT XI3<26> (  ); 
DCAP8LVT XI3<25> (  ); 
DCAP8LVT XI3<24> (  ); 
DCAP8LVT XI3<23> (  ); 
DCAP8LVT XI3<22> (  ); 
DCAP8LVT XI3<21> (  ); 
DCAP8LVT XI3<20> (  ); 
DCAP8LVT XI3<19> (  ); 
DCAP8LVT XI3<18> (  ); 
DCAP8LVT XI3<17> (  ); 
DCAP8LVT XI3<16> (  ); 
DCAP8LVT XI3<15> (  ); 
DCAP8LVT XI3<14> (  ); 
DCAP8LVT XI3<13> (  ); 
DCAP8LVT XI3<12> (  ); 
DCAP8LVT XI3<11> (  ); 
DCAP8LVT XI3<10> (  ); 
DCAP8LVT XI3<9> (  ); 
DCAP8LVT XI3<8> (  ); 
DCAP8LVT XI3<7> (  ); 
DCAP8LVT XI3<6> (  ); 
DCAP8LVT XI3<5> (  ); 
DCAP8LVT XI3<4> (  ); 
DCAP8LVT XI3<3> (  ); 
DCAP8LVT XI3<2> (  ); 
DCAP8LVT XI3<1> (  ); 
DCAP8LVT XI3<0> (  ); 
DFNCND1LVT XI59 ( .CDN(n1), .CPN(COMPEN), .D(CK<1>), .Q(CK<0>), .QN(CKB<0>) ); 
DFNCND1LVT XI58 ( .CDN(n1), .CPN(COMPEN), .D(CK<2>), .Q(CK<1>), .QN(CKB<1>) ); 
DFNCND1LVT XI57 ( .CDN(n1), .CPN(COMPEN), .D(CK<3>), .Q(CK<2>), .QN(CKB<2>) ); 
DFNCND1LVT XI55 ( .CDN(n1), .CPN(COMPEN), .D(CK<4>), .Q(CK<3>), .QN(CKB<3>) ); 
DFNCND1LVT XI56 ( .CDN(n1), .CPN(COMPEN), .D(CK<5>), .Q(CK<4>), .QN(CKB<4>) ); 
DFNCND1LVT XI54 ( .CDN(n1), .CPN(COMPEN), .D(CK<6>), .Q(CK<5>), .QN(CKB<5>) ); 
DFNCND1LVT XI51 ( .CDN(n1), .CPN(COMPEN), .D(CK<7>), .Q(CK<6>), .QN(CKB<6>) ); 
DFNCND1LVT XI65 ( .CDN(n1), .CPN(COMPEN), .D(CK<8>), .Q(CK<7>), .QN(CKB<7>) ); 
DFNCND1LVT XI67 ( .CDN(n1), .CPN(COMPEN), .D(net163), .Q(CK<8>), .QN(CKB<8>) ); 
TIEHLVT XI0 ( .Z(net034) ); 
DFCNQD1LVT XI42 ( .CDN(n1), .CP(COMPEN), .D(CK<0>), .Q(DONE) ); 
DFCNQD1LVT XI60 ( .CDN(n1), .CP(CK<5>), .D(VOPLATCH), .Q(D<5>) ); 
DFCNQD1LVT XI53 ( .CDN(n1), .CP(CK<6>), .D(VOPLATCH), .Q(D<6>) ); 
DFCNQD1LVT XI52 ( .CDN(n1), .CP(CK<7>), .D(VOPLATCH), .Q(D<7>) ); 
DFCNQD1LVT XI66 ( .CDN(n1), .CP(CK<8>), .D(VOPLATCH), .Q(D<8>) ); 
CKND4LVT XI69 ( .I(PRESET), .ZN(n1) ); 
NR2D1LVT XI73<7> ( .A1(D<7>), .A2(net164<0>), .ZN(VCTL0<7>) ); 
NR2D1LVT XI73<6> ( .A1(D<6>), .A2(net164<1>), .ZN(VCTL0<6>) ); 
NR2D1LVT XI73<5> ( .A1(D<5>), .A2(net164<2>), .ZN(VCTL0<5>) ); 
NR2D1LVT XI73<4> ( .A1(D<4>), .A2(net164<3>), .ZN(VCTL0<4>) ); 
NR2D1LVT XI73<3> ( .A1(D<3>), .A2(net164<4>), .ZN(VCTL0<3>) ); 
NR2D1LVT XI73<2> ( .A1(D<2>), .A2(net164<5>), .ZN(VCTL0<2>) ); 
NR2D1LVT XI73<1> ( .A1(D<1>), .A2(net164<6>), .ZN(VCTL0<1>) ); 
NR2D1LVT XI73<0> ( .A1(D<0>), .A2(net164<7>), .ZN(VCTL0<0>) ); 
NR2D1LVT XI84 ( .A1(D<8>), .A2(CKB<8>), .ZN(net162) ); 
AN2D1LVT XI72<7> ( .A1(CK<8>), .A2(CKB<7>), .Z(net164<0>) ); 
AN2D1LVT XI72<6> ( .A1(CK<7>), .A2(CKB<6>), .Z(net164<1>) ); 
AN2D1LVT XI72<5> ( .A1(CK<6>), .A2(CKB<5>), .Z(net164<2>) ); 
AN2D1LVT XI72<4> ( .A1(CK<5>), .A2(CKB<4>), .Z(net164<3>) ); 
AN2D1LVT XI72<3> ( .A1(CK<4>), .A2(CKB<3>), .Z(net164<4>) ); 
AN2D1LVT XI72<2> ( .A1(CK<3>), .A2(CKB<2>), .Z(net164<5>) ); 
AN2D1LVT XI72<1> ( .A1(CK<2>), .A2(CKB<1>), .Z(net164<6>) ); 
AN2D1LVT XI72<0> ( .A1(CK<1>), .A2(CKB<0>), .Z(net164<7>) ); 
OR2D1LVT XI106 ( .A1(PRESET), .A2(net162), .Z(VCTL0<8>) ); 
CKND1LVT XI71<7> ( .I(VCTL0<7>), .ZN(VCTLIN<7>) ); 
CKND1LVT XI71<6> ( .I(VCTL0<6>), .ZN(VCTLIN<6>) ); 
CKND1LVT XI71<5> ( .I(VCTL0<5>), .ZN(VCTLIN<5>) ); 
CKND1LVT XI71<4> ( .I(VCTL0<4>), .ZN(VCTLIN<4>) ); 
CKND1LVT XI71<3> ( .I(VCTL0<3>), .ZN(VCTLIN<3>) ); 
CKND1LVT XI71<2> ( .I(VCTL0<2>), .ZN(VCTLIN<2>) ); 
CKND1LVT XI71<1> ( .I(VCTL0<1>), .ZN(VCTLIN<1>) ); 
CKND1LVT XI71<0> ( .I(VCTL0<0>), .ZN(VCTLIN<0>) ); 
CKND1LVT XI86 ( .I(VCTL0<8>), .ZN(VCTLIN<8>) ); 
DFNCND1LVT_schematic XI50 ( .CDN(n1), .CPN(COMPEN), .D(net034), .Q(net163) ); 
DFSND1LVT XI81 ( .CP(CK<0>), .D(VONLATCH), .QN(D<0>), .SDN(n1) ); 
DFSND1LVT XI80 ( .CP(CK<1>), .D(VONLATCH), .QN(D<1>), .SDN(n1) ); 
DFSND1LVT XI79 ( .CP(CK<2>), .D(VONLATCH), .QN(D<2>), .SDN(n1) ); 
DFSND1LVT XI62 ( .CP(CK<3>), .D(VONLATCH), .QN(D<3>), .SDN(n1) ); 
DFSND1LVT XI61 ( .CP(CK<4>), .D(VONLATCH), .QN(D<4>), .SDN(n1) ); 

endmodule

module DFNCND1LVT ( CDN, CPN, D, Q, QN ); 
input CDN, CPN, D, Q, QN;

Switch_PMOS_n12_X1_Y1 MMI60_M_u2 ( .B(VDD), .D(net49), .G(CDN), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI43 ( .B(VDD), .D(net53), .G(net9), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI60_M_u1 ( .B(VDD), .D(net49), .G(net20), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI6 ( .B(VDD), .D(net5), .G(D), .S(net1) ); 
Switch_PMOS_n12_X1_Y1 MMI62_M_u3 ( .B(VDD), .D(net11), .G(net67), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI63_M_u3 ( .B(VDD), .D(net37), .G(net49), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI29_M_u3 ( .B(VDD), .D(QN), .G(net37), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI31_M_u3 ( .B(VDD), .D(net67), .G(CPN), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI27_M_u3 ( .B(VDD), .D(Q), .G(net49), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI44 ( .B(VDD), .D(net53), .G(CDN), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI17 ( .B(VDD), .D(net37), .G(net67), .S(net20) ); 
Switch_PMOS_n12_X1_Y1 MMI13_M_u3 ( .B(VDD), .D(net9), .G(net5), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI16 ( .B(VDD), .D(net9), .G(net11), .S(net20) ); 
Switch_PMOS_n12_X1_Y1 MMI45 ( .B(VDD), .D(net5), .G(net11), .S(net53) ); 
Switch_PMOS_n12_X1_Y1 MMI7 ( .B(VDD), .D(net1), .G(net67), .S(VDD) ); 
Switch_NMOS_n12_X1_Y1 MMI29_M_u2 ( .B(VSS), .D(QN), .G(net37), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI63_M_u2 ( .B(VSS), .D(net37), .G(net49), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI4 ( .B(VSS), .D(net109), .G(net11), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI18 ( .B(VSS), .D(net37), .G(net11), .S(net20) ); 
Switch_NMOS_n12_X1_Y1 MMI60_M_u3 ( .B(VSS), .D(net49), .G(net20), .S(net104) ); 
Switch_NMOS_n12_X1_Y1 MMI60_M_u4 ( .B(VSS), .D(net104), .G(CDN), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI13_M_u2 ( .B(VSS), .D(net9), .G(net5), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI15 ( .B(VSS), .D(net9), .G(net67), .S(net20) ); 
Switch_NMOS_n12_X1_Y1 MMI5 ( .B(VSS), .D(net5), .G(D), .S(net109) ); 
Switch_NMOS_n12_X1_Y1 MMI31_M_u2 ( .B(VSS), .D(net67), .G(CPN), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI49 ( .B(VSS), .D(net77), .G(CDN), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI48 ( .B(VSS), .D(net64), .G(net9), .S(net77) ); 
Switch_NMOS_n12_X1_Y1 MMI27_M_u2 ( .B(VSS), .D(Q), .G(net49), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI62_M_u2 ( .B(VSS), .D(net11), .G(net67), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI47 ( .B(VSS), .D(net5), .G(net67), .S(net64) ); 

endmodule

module TIEHLVT ( Z ); 
input Z;

DCL_NMOS_n12_X1_Y1 MM_u2 ( .B(VSS), .D(net7), .S(VSS) ); 
Switch_PMOS_n12_X1_Y1 MM_u1 ( .B(VDD), .D(Z), .G(net7), .S(VDD) ); 

endmodule

module DFCNQD1LVT ( CDN, CP, D, Q ); 
input CDN, CP, D, Q;

Switch_NMOS_n12_X1_Y1 MMI4 ( .B(VSS), .D(net53), .G(net5), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI21_M_u3 ( .B(VSS), .D(net81), .G(net51), .S(net9) ); 
Switch_NMOS_n12_X1_Y1 MMI13_M_u2 ( .B(VSS), .D(net37), .G(net97), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI29 ( .B(VSS), .D(net51), .G(net5), .S(net44) ); 
Switch_NMOS_n12_X1_Y1 MMI15 ( .B(VSS), .D(net37), .G(net63), .S(net51) ); 
Switch_NMOS_n12_X1_Y1 MMI32_M_u2 ( .B(VSS), .D(net63), .G(net5), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI5 ( .B(VSS), .D(net97), .G(D), .S(net53) ); 
Switch_NMOS_n12_X1_Y1 MMI49 ( .B(VSS), .D(net20), .G(CDN), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI26 ( .B(VSS), .D(net44), .G(net81), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI48 ( .B(VSS), .D(net17), .G(net37), .S(net20) ); 
Switch_NMOS_n12_X1_Y1 MMI27_M_u2 ( .B(VSS), .D(Q), .G(net81), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI21_M_u4 ( .B(VSS), .D(net9), .G(CDN), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI22_M_u2 ( .B(VSS), .D(net5), .G(CP), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI47 ( .B(VSS), .D(net97), .G(net63), .S(net17) ); 
Switch_PMOS_n12_X1_Y1 MMI22_M_u3 ( .B(VDD), .D(net5), .G(CP), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI32_M_u3 ( .B(VDD), .D(net63), .G(net5), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI43 ( .B(VDD), .D(net101), .G(net37), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI6 ( .B(VDD), .D(net97), .G(D), .S(net100) ); 
Switch_PMOS_n12_X1_Y1 MMI27_M_u3 ( .B(VDD), .D(Q), .G(net81), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI44 ( .B(VDD), .D(net101), .G(CDN), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI13_M_u3 ( .B(VDD), .D(net37), .G(net97), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI21_M_u1 ( .B(VDD), .D(net81), .G(net51), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI16 ( .B(VDD), .D(net37), .G(net5), .S(net51) ); 
Switch_PMOS_n12_X1_Y1 MMI24 ( .B(VDD), .D(net72), .G(net81), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI28 ( .B(VDD), .D(net51), .G(net63), .S(net72) ); 
Switch_PMOS_n12_X1_Y1 MMI45 ( .B(VDD), .D(net97), .G(net5), .S(net101) ); 
Switch_PMOS_n12_X1_Y1 MMI7 ( .B(VDD), .D(net100), .G(net63), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI21_M_u2 ( .B(VDD), .D(net81), .G(CDN), .S(VDD) ); 

endmodule

module CKND4LVT ( I, ZN ); 
input I, ZN;

Switch_PMOS_n12_X1_Y1 MM_u1_0 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u1_3 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u1_2 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u1_1 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_1 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_3 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_0 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u2_2 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 

endmodule

module NR2D1LVT ( A1, A2, ZN ); 
input A1, A2, ZN;

Switch_NMOS_n12_X1_Y1 MMI1_M_u3 ( .B(VSS), .D(ZN), .G(A2), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI1_M_u4 ( .B(VSS), .D(ZN), .G(A1), .S(VSS) ); 
Switch_PMOS_n12_X1_Y1 MMI1_M_u1 ( .B(VDD), .D(net13), .G(A2), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI1_M_u2 ( .B(VDD), .D(ZN), .G(A1), .S(net13) ); 

endmodule

module OR2D1LVT ( A1, A2, Z ); 
input A1, A2, Z;

Switch_NMOS_n12_X1_Y1 MMU1_M_u2 ( .B(VSS), .D(Z), .G(net5), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u7_M_u4 ( .B(VSS), .D(net5), .G(A1), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u7_M_u3 ( .B(VSS), .D(net5), .G(A2), .S(VSS) ); 
Switch_PMOS_n12_X1_Y1 MMU1_M_u3 ( .B(VDD), .D(Z), .G(net5), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u7_M_u1 ( .B(VDD), .D(net17), .G(A2), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u7_M_u2 ( .B(VDD), .D(net5), .G(A1), .S(net17) ); 

endmodule

module tgate ( D, GA, GB, S ); 
input D, GA, GB, S;

Switch_NMOS_n12_X1_Y1 M0 ( .B(BN), .D(D), .G(GA), .S(S) ); 
Switch_PMOS_n12_X1_Y1 M1 ( .B(BP), .D(D), .G(GB), .S(S) ); 

endmodule

module DFNCND1LVT_schematic ( CDN, CPN, D, Q ); 
input CDN, CPN, D, Q;

Switch_PMOS_n12_X1_Y1 MMI60_M_u2 ( .B(VDD), .D(net49), .G(CDN), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI43 ( .B(VDD), .D(net53), .G(net9), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI60_M_u1 ( .B(VDD), .D(net49), .G(net20), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI6 ( .B(VDD), .D(net5), .G(D), .S(net1) ); 
Switch_PMOS_n12_X1_Y1 MMI44 ( .B(VDD), .D(net53), .G(CDN), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI45 ( .B(VDD), .D(net5), .G(net11), .S(net53) ); 
Switch_PMOS_n12_X1_Y1 MMI7 ( .B(VDD), .D(net1), .G(net67), .S(VDD) ); 
Switch_NMOS_n12_X1_Y1 MMI4 ( .B(VSS), .D(net109), .G(net11), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI60_M_u3 ( .B(VSS), .D(net49), .G(net20), .S(net104) ); 
Switch_NMOS_n12_X1_Y1 MMI60_M_u4 ( .B(VSS), .D(net104), .G(CDN), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI5 ( .B(VSS), .D(net5), .G(D), .S(net109) ); 
Switch_NMOS_n12_X1_Y1 MMI49 ( .B(VSS), .D(net77), .G(CDN), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI48 ( .B(VSS), .D(net64), .G(net9), .S(net77) ); 
Switch_NMOS_n12_X1_Y1 MMI47 ( .B(VSS), .D(net5), .G(net67), .S(net64) ); 
stage2_inv MMI62_M_u2_MMI31_M_u2_MMI62_M_u3_MMI31_M_u3 ( .G1(net11), .SN(VSS), .G2(CPN), .SP(VDD) ); 
stage2_inv MMI29_M_u2_MMI63_M_u2_MMI29_M_u3_MMI63_M_u3 ( .G1(net040), .SN(VSS), .G2(net49), .SP(VDD) ); 
INV_LVT MMI13_M_u2_MMI13_M_u3 ( .zn(net9), .i(net5), .SN(VSS), .SP(VDD) ); 
INV_LVT MMI27_M_u2_MMI27_M_u3 ( .zn(Q), .i(net49), .SN(VSS), .SP(VDD) ); 
tgate MMI15_MMI16 ( .D(net9), .GA(net67), .S(net20), .GB(net11) ); 
tgate MMI18_MMI17 ( .D(net37), .GA(net11), .S(net20), .GB(net67) ); 

endmodule

module DFSND1LVT ( CP, D, QN, SDN ); 
input CP, D, QN, SDN;

Switch_NMOS_n12_X1_Y1 MMI32_M_u4 ( .B(VSS), .D(net57), .G(net61), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI32_M_u3 ( .B(VSS), .D(net97), .G(SDN), .S(net57) ); 
Switch_NMOS_n12_X1_Y1 MMI31_M_u4 ( .B(VSS), .D(net40), .G(net79), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI31_M_u3 ( .B(VSS), .D(net25), .G(SDN), .S(net40) ); 
Switch_NMOS_n12_X1_Y1 MMI23 ( .B(VSS), .D(net61), .G(net81), .S(net5) ); 
Switch_NMOS_n12_X1_Y1 MMI21 ( .B(VSS), .D(net61), .G(D), .S(net9) ); 
Switch_NMOS_n12_X1_Y1 MMI19 ( .B(VSS), .D(net9), .G(net11), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI24 ( .B(VSS), .D(net5), .G(net97), .S(VSS) ); 
Switch_PMOS_n12_X1_Y1 MMI32_M_u1 ( .B(VDD), .D(net97), .G(SDN), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI34 ( .B(VDD), .D(net61), .G(net11), .S(net104) ); 
Switch_PMOS_n12_X1_Y1 MMI32_M_u2 ( .B(VDD), .D(net97), .G(net61), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI28 ( .B(VDD), .D(net85), .G(net81), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI31_M_u2 ( .B(VDD), .D(net25), .G(net79), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI35 ( .B(VDD), .D(net104), .G(net97), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI31_M_u1 ( .B(VDD), .D(net25), .G(SDN), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI26 ( .B(VDD), .D(net61), .G(D), .S(net85) ); 
stage2_inv MMI40_M_u2_MMI55_M_u2_MMI40_M_u3_MMI55_M_u3 ( .G1(net81), .SN(VSS), .G2(CP), .SP(VDD) ); 
stage2_inv MMI60_M_u2_MMI25_M_u2_MMI60_M_u3_MMI25_M_u3 ( .G1(net032), .SN(VSS), .G2(net67), .SP(VDD) ); 
INV_LVT MMI57_M_u2_MMI57_M_u3 ( .zn(QN), .i(net25), .SN(VSS), .SP(VDD) ); 
tgate MMI20_MMI30 ( .D(net97), .GA(net81), .S(net67), .GB(net11) ); 
tgate MMI22_MMI33 ( .D(net25), .GA(net11), .S(net67), .GB(net81) ); 

endmodule

module ResTune_CFG ( INPH, INPHASE<0>, INPHASE<1>, INPHASE<2>, INPHASE<3>, INPHASE<4>, INPHASE<5>, INPHASE<6>, INPHASE<7>, OUTPH, OUTPHASE<0>, OUTPHASE<1>, OUTPHASE<2>, OUTPHASE<3>, OUTPHASE<4>, OUTPHASE<5>, OUTPHASE<6>, OUTPHASE<7>, RESEN<0>, RESEN<1>, RESEN<2>, RESEN<3>, RESEN<4>, RESEN<5>, RESEN<6>, RESEN<7> ); 
input INPH, INPHASE<0>, INPHASE<1>, INPHASE<2>, INPHASE<3>, INPHASE<4>, INPHASE<5>, INPHASE<6>, INPHASE<7>, OUTPH, OUTPHASE<0>, OUTPHASE<1>, OUTPHASE<2>, OUTPHASE<3>, OUTPHASE<4>, OUTPHASE<5>, OUTPHASE<6>, OUTPHASE<7>, RESEN<0>, RESEN<1>, RESEN<2>, RESEN<3>, RESEN<4>, RESEN<5>, RESEN<6>, RESEN<7>;

DCAP8LVT XI3<1> (  ); 
DCAP8LVT XI3<0> (  ); 
DCAP16LVT XI2<7> (  ); 
DCAP16LVT XI2<6> (  ); 
DCAP16LVT XI2<5> (  ); 
DCAP16LVT XI2<4> (  ); 
DCAP16LVT XI2<3> (  ); 
DCAP16LVT XI2<2> (  ); 
DCAP16LVT XI2<1> (  ); 
DCAP16LVT XI2<0> (  ); 
DCAP32LVT XI4<3> (  ); 
DCAP32LVT XI4<2> (  ); 
DCAP32LVT XI4<1> (  ); 
DCAP32LVT XI4<0> (  ); 
BUFTD16LVT XI1<7> ( .I(INPH), .OE(RESEN<7>), .Z(INPHASE<7>) ); 
BUFTD16LVT XI1<6> ( .I(INPH), .OE(RESEN<6>), .Z(INPHASE<6>) ); 
BUFTD16LVT XI1<5> ( .I(INPH), .OE(RESEN<5>), .Z(INPHASE<5>) ); 
BUFTD16LVT XI1<4> ( .I(INPH), .OE(RESEN<4>), .Z(INPHASE<4>) ); 
BUFTD16LVT XI1<3> ( .I(INPH), .OE(RESEN<3>), .Z(INPHASE<3>) ); 
BUFTD16LVT XI1<2> ( .I(INPH), .OE(RESEN<2>), .Z(INPHASE<2>) ); 
BUFTD16LVT XI1<1> ( .I(INPH), .OE(RESEN<1>), .Z(INPHASE<1>) ); 
BUFTD16LVT XI1<0> ( .I(INPH), .OE(RESEN<0>), .Z(INPHASE<0>) ); 
BUFTD16LVT XI0<7> ( .I(OUTPH), .OE(RESEN<7>), .Z(OUTPHASE<7>) ); 
BUFTD16LVT XI0<6> ( .I(OUTPH), .OE(RESEN<6>), .Z(OUTPHASE<6>) ); 
BUFTD16LVT XI0<5> ( .I(OUTPH), .OE(RESEN<5>), .Z(OUTPHASE<5>) ); 
BUFTD16LVT XI0<4> ( .I(OUTPH), .OE(RESEN<4>), .Z(OUTPHASE<4>) ); 
BUFTD16LVT XI0<3> ( .I(OUTPH), .OE(RESEN<3>), .Z(OUTPHASE<3>) ); 
BUFTD16LVT XI0<2> ( .I(OUTPH), .OE(RESEN<2>), .Z(OUTPHASE<2>) ); 
BUFTD16LVT XI0<1> ( .I(OUTPH), .OE(RESEN<1>), .Z(OUTPHASE<1>) ); 
BUFTD16LVT XI0<0> ( .I(OUTPH), .OE(RESEN<0>), .Z(OUTPHASE<0>) ); 

endmodule

module DCAP16LVT (  ); 
Dcap_NMOS_n12_X1_Y1 MMI4 ( .B(VSS), .S(VSS), .G(net11) ); 
Dcap_NMOS_n12_X1_Y1 MMI8 ( .B(VSS), .S(VSS), .G(net11) ); 
Switch_NMOS_n12_X1_Y1 MM_u2 ( .B(VSS), .D(net5), .G(net11), .S(VSS) ); 
Dcap_NMOS_n12_X1_Y1 MMI7 ( .B(VSS), .S(VSS), .G(net11) ); 
Dcap_PMOS_n12_X1_Y1 MMI3 ( .B(VDD), .S(VDD), .G(net5) ); 
Dcap_PMOS_n12_X1_Y1 MMI6 ( .B(VDD), .S(VDD), .G(net5) ); 
Switch_PMOS_n12_X1_Y1 MM_u1 ( .B(VDD), .D(net11), .G(net5), .S(VDD) ); 
Dcap_PMOS_n12_X1_Y1 MMI5 ( .B(VDD), .S(VDD), .G(net5) ); 

endmodule

module DCAP32LVT (  ); 
Dcap_NMOS_n12_X1_Y1 MMI38 ( .B(VSS), .S(VSS), .G(net11) ); 
Dcap_NMOS_n12_X1_Y1 MMI6 ( .B(VSS), .S(VSS), .G(net11) ); 
Dcap_NMOS_n12_X1_Y1 MMI39 ( .B(VSS), .S(VSS), .G(net11) ); 
Dcap_NMOS_n12_X1_Y1 MMI37 ( .B(VSS), .S(VSS), .G(net11) ); 
Switch_NMOS_n12_X1_Y1 MM_u2 ( .B(VSS), .D(net5), .G(net11), .S(VSS) ); 
Dcap_NMOS_n12_X1_Y1 MMI36 ( .B(VSS), .S(VSS), .G(net11) ); 
Dcap_PMOS_n12_X1_Y1 MMI33 ( .B(VDD), .S(VDD), .G(net5) ); 
Switch_PMOS_n12_X1_Y1 MM_u1 ( .B(VDD), .D(net11), .G(net5), .S(VDD) ); 
Dcap_PMOS_n12_X1_Y1 MMI34 ( .B(VDD), .S(VDD), .G(net5) ); 
Dcap_PMOS_n12_X1_Y1 MMI35 ( .B(VDD), .S(VDD), .G(net5) ); 
Dcap_PMOS_n12_X1_Y1 MMI32 ( .B(VDD), .S(VDD), .G(net5) ); 
Dcap_PMOS_n12_X1_Y1 MMI26 ( .B(VDD), .S(VDD), .G(net5) ); 

endmodule

module BUFTD16LVT ( I, OE, Z ); 
input I, OE, Z;

Switch_NMOS_n12_X1_Y1 MMI6_M_u4 ( .B(VSS), .D(net37), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI5_1_M_u4 ( .B(VSS), .D(net25), .G(net5), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI5_0_M_u3 ( .B(VSS), .D(net25), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI5_0_M_u4 ( .B(VSS), .D(net25), .G(net5), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI7_M_u3 ( .B(VSS), .D(net13), .G(OE), .S(net9) ); 
Switch_NMOS_n12_X1_Y1 MM_u7 ( .B(VSS), .D(Z), .G(net25), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI6_M_u3 ( .B(VSS), .D(net13), .G(OE), .S(net37) ); 
Switch_NMOS_n12_X1_Y1 MMI7_M_u4 ( .B(VSS), .D(net9), .G(I), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MM_u17_M_u2 ( .B(VSS), .D(net5), .G(OE), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI5_1_M_u3 ( .B(VSS), .D(net25), .G(I), .S(VSS) ); 
Switch_PMOS_n12_X1_Y1 MM_u17_M_u3 ( .B(VDD), .D(net5), .G(OE), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI5_0_M_u1 ( .B(VDD), .D(net72), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI5_0_M_u2 ( .B(VDD), .D(net25), .G(net5), .S(net72) ); 
Switch_PMOS_n12_X1_Y1 MMI6_M_u2 ( .B(VDD), .D(net13), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI7_M_u1 ( .B(VDD), .D(net13), .G(OE), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM_u6 ( .B(VDD), .D(Z), .G(net13), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI5_1_M_u1 ( .B(VDD), .D(net53), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI7_M_u2 ( .B(VDD), .D(net13), .G(I), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI5_1_M_u2 ( .B(VDD), .D(net25), .G(net5), .S(net53) ); 
Switch_PMOS_n12_X1_Y1 MMI6_M_u1 ( .B(VDD), .D(net13), .G(OE), .S(VDD) ); 

endmodule

module CrossingDetector ( QD, QPHASE, SQ, SS, VCP, VCPS ); 
input QD, QPHASE, SQ, SS, VCP, VCPS;

CrossingDetector_Mux XI2 ( .IN(QPHASE), .SS(SQ), .VO(QD) ); 
CrossingDetector_Mux XI0 ( .IN(VCP), .SS(SS), .VO(VCPS) ); 

endmodule

module INV_LVT_type1 ( SN, SP, i, zn ); 
input SN, SP, i, zn;

Switch_NMOS_n12_X1_Y1 xm0 ( .B(SN), .D(zn), .G(i), .S(SN) ); 
Switch_PMOS_n12_X1_Y1 xm1 ( .B(SP), .D(zn), .G(i), .S(SP) ); 

endmodule

module CrossingDetector_Mux ( IN, SS, VO ); 
input IN, SS, VO;

MUX2D2LVT XI18 ( .I0(net012), .I1(net032), .S(SS), .Z(VO) ); 
CKBD1LVT XI16 ( .I(net033), .Z(net012) ); 
CKBD1LVT XI10 ( .I(net012), .Z(net032) ); 
CKBD1LVT XI9 ( .I(net015), .Z(net033) ); 
CKND1LVT XI15 ( .I(net06), .ZN(net015) ); 
INV_LVT_type1 MM1_MM2 ( .zn(net06), .i(IN), .SN(VSS), .SP(VDD) ); 

endmodule

module MUX2D2LVT ( I0, I1, S, Z ); 
input I0, I1, S, Z;

Switch_NMOS_n12_X1_Y1 MMU18_M_u3 ( .B(VSS), .D(net25), .G(net17), .S(net7) ); 
Switch_NMOS_n12_X1_Y1 MMI16_M_u2 ( .B(VSS), .D(net25), .G(I0), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI17_M_u2 ( .B(VSS), .D(net17), .G(S), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI13_M_u3 ( .B(VSS), .D(net9), .G(S), .S(net7) ); 
Switch_NMOS_n12_X1_Y1 MMI14_M_u2 ( .B(VSS), .D(net9), .G(I1), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMU29_0_M_u2 ( .B(VSS), .D(Z), .G(net7), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMU29_1_M_u2 ( .B(VSS), .D(Z), .G(net7), .S(VSS) ); 
Switch_PMOS_n12_X1_Y1 MMI17_M_u3 ( .B(VDD), .D(net17), .G(S), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI14_M_u3 ( .B(VDD), .D(net9), .G(I1), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMU29_1_M_u3 ( .B(VDD), .D(Z), .G(net7), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI16_M_u3 ( .B(VDD), .D(net25), .G(I0), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMU29_0_M_u3 ( .B(VDD), .D(Z), .G(net7), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI13_M_u2 ( .B(VDD), .D(net9), .G(net17), .S(net7) ); 
Switch_PMOS_n12_X1_Y1 MMU18_M_u2 ( .B(VDD), .D(net25), .G(S), .S(net7) ); 

endmodule

module EdgeComparator ( COMPEN, PRESET, VIN, VIP, VONL, VOPL ); 
input COMPEN, PRESET, VIN, VIP, VONL, VOPL;

Switch_PMOS_n12_X1_Y1 MM7 ( .B(VDD), .D(net028), .G(net029), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM6 ( .B(VDD), .D(net25), .G(net033), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM2 ( .B(VDD), .D(net25), .G(VIN), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MM0 ( .B(VDD), .D(net028), .G(VIP), .S(VDD) ); 
NR2D2LVT XI95 ( .A1(VOP), .A2(VOPL), .ZN(VONL) ); 
NR2D2LVT XI96 ( .A1(VON), .A2(VONL), .ZN(VOPL) ); 
Switch_NMOS_n12_X1_Y1 MM28 ( .B(VSS), .D(net25), .G(VIN), .S(net032) ); 
Switch_NMOS_n12_X1_Y1 MM1 ( .B(VSS), .D(net028), .G(VIP), .S(net24) ); 
Switch_NMOS_n12_X1_Y1 MM22 ( .B(VSS), .D(net015), .G(COMPEN), .S(VSS) ); 
INVD1LVT XI5 ( .I(PRESET), .ZN(net029) ); 
INVD1LVT XI4 ( .I(PRESET), .ZN(net033) ); 
INVD1LVT XI3 ( .I(net028), .ZN(VOP) ); 
INVD1LVT XI1 ( .I(net25), .ZN(VON) ); 
CCP_PMOS_S_n12_X1_Y1 MM45_MM3 ( .B(VDD), .DA(net25), .DB(net028), .S(VDD) ); 
DP_NMOS_n12_X1_Y1 MM5_MM4 ( .B(VSS), .DA(net032), .GA(net028), .S(net015), .DB(net24), .GB(net25) ); 

endmodule

module NR2D2LVT ( A1, A2, ZN ); 
input A1, A2, ZN;

Switch_NMOS_n12_X1_Y1 MMI1_1_M_u3 ( .B(VSS), .D(ZN), .G(A2), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI1_1_M_u4 ( .B(VSS), .D(ZN), .G(A1), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI1_0_M_u4 ( .B(VSS), .D(ZN), .G(A1), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI1_0_M_u3 ( .B(VSS), .D(ZN), .G(A2), .S(VSS) ); 
Switch_PMOS_n12_X1_Y1 MMI1_1_M_u2 ( .B(VDD), .D(ZN), .G(A1), .S(net17) ); 
Switch_PMOS_n12_X1_Y1 MMI1_0_M_u1 ( .B(VDD), .D(net25), .G(A2), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI1_0_M_u2 ( .B(VDD), .D(ZN), .G(A1), .S(net25) ); 
Switch_PMOS_n12_X1_Y1 MMI1_1_M_u1 ( .B(VDD), .D(net17), .G(A2), .S(VDD) ); 

endmodule