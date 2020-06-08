//Verilog block level netlist file for Sanitized_LevelCrossingDetector
//Generated by UMN for ALIGN project 


module Sanitized_LevelCrossingDetector ( QD, QPHASE, SQ, SS, VCP, VCPS, VDD, VSS ); 
input QD, QPHASE, SQ, SS, VCP, VCPS, VDD, VSS;

CrossingDetector_Mux XI2 ( .IN(QPHASE), .SS(SQ), .VDD(VDD), .VO(QD), .VSS(VSS) ); 
CrossingDetector_Mux XI0 ( .IN(VCP), .SS(SS), .VDD(VDD), .VO(VCPS), .VSS(VSS) ); 

endmodule

module CrossingDetector_Mux ( IN, SS, VDD, VO, VSS ); 
input IN, SS, VDD, VO, VSS;

MUX2D2LVT XI18 ( .I0(net012), .I1(net032), .S(SS), .VDD(VDD), .VSS(VSS), .Z(VO) ); 
CKBD1LVT XI16 ( .I(net033), .VDD(VDD), .VSS(VSS), .Z(net012) ); 
CKBD1LVT XI10 ( .I(net012), .VDD(VDD), .VSS(VSS), .Z(net032) ); 
CKBD1LVT XI9 ( .I(net015), .VDD(VDD), .VSS(VSS), .Z(net033) ); 
Switch_PMOS_n12_X1_Y1 MM2 ( .B(VDD), .D(net06), .G(IN), .S(VDD) ); 
Switch_NMOS_n12_X1_Y1 MM1 ( .B(VSS), .D(net06), .G(IN), .S(VSS) ); 
CKND1LVT XI15 ( .I(net06), .VDD(VDD), .VSS(VSS), .ZN(net015) ); 

endmodule

module tgate ( D, GA, GB, S ); 
input D, GA, GB, S;

Switch_NMOS_n12_X1_Y1 M0 ( .B(BN), .D(D), .G(GA), .S(S) ); 
Switch_PMOS_n12_X1_Y1 M1 ( .B(BP), .D(D), .G(GB), .S(S) ); 

endmodule

module MUX2D2LVT ( I0, I1, S, VDD, VSS, Z ); 
input I0, I1, S, VDD, VSS, Z;

Switch_NMOS_n12_X1_Y1 MMI16_M_u2 ( .B(VSS), .D(net25), .G(I0), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI17_M_u2 ( .B(VSS), .D(net17), .G(S), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMI14_M_u2 ( .B(VSS), .D(net9), .G(I1), .S(VSS) ); 
Switch_NMOS_n12_X1_Y1 MMU29_0_M_u2 ( .B(VSS), .D(Z), .G(net7), .S(VSS) ); 
Switch_PMOS_n12_X1_Y1 MMI17_M_u3 ( .B(VDD), .D(net17), .G(S), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI14_M_u3 ( .B(VDD), .D(net9), .G(I1), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMU29_1_M_u3 ( .B(VDD), .D(Z), .G(net7), .S(VDD) ); 
Switch_PMOS_n12_X1_Y1 MMI16_M_u3 ( .B(VDD), .D(net25), .G(I0), .S(VDD) ); 
tgate MMI13_M_u3_MMI13_M_u2 ( .D(net9), .GA(S), .S(net7), .GB(net17) ); 
tgate MMU18_M_u3_MMU18_M_u2 ( .D(net25), .GA(net17), .S(net7), .GB(S) ); 

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

module CKBD1LVT ( I, VDD, VSS, Z ); 
input I, VDD, VSS, Z;

stage2_inv MMU23_MM_u15_MMU21_MM_u3 ( .G1(Z), .SN(VSS), .G2(I), .SP(VDD) ); 

endmodule

module CKND1LVT ( I, VDD, VSS, ZN ); 
input I, VDD, VSS, ZN;

Switch_NMOS_n12_X1_Y1 MM_u2 ( .B(VSS), .D(ZN), .G(I), .S(VSS) ); 
Switch_PMOS_n12_X1_Y1 MM_u1 ( .B(VDD), .D(ZN), .G(I), .S(VDD) ); 

endmodule

`celldefine
module global_power;
supply0 DVSS;
supply1 DVDD;
endmodule
`endcelldefine