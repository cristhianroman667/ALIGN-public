//Verilog block level netlist file for vco_dtype_12_hierarchical
//Generated by UMN for ALIGN project 


module vco_dtype_12_hierarchical ( on<1>, on<2>, on<3>, on<4>, on<5>, on<6>, on<7>, on<8>, oo<1>, oo<2>, oo<3>, oo<4>, oo<5>, oo<6>, oo<7>, oo<8>, op<1>, op<2>, op<3>, op<4>, op<5>, op<6>, op<7>, op<8>, vbias ); 
input on<1>, on<2>, on<3>, on<4>, on<5>, on<6>, on<7>, on<8>, oo<1>, oo<2>, oo<3>, oo<4>, oo<5>, oo<6>, oo<7>, oo<8>, op<1>, op<2>, op<3>, op<4>, op<5>, op<6>, op<7>, op<8>, vbias;

diff2sing_v1pg1 I6<1> ( .in1(on<1>), .in2(op<1>), .o(oo<1>) ); 
diff2sing_v1pg1 I6<2> ( .in1(on<2>), .in2(op<2>), .o(oo<2>) ); 
diff2sing_v1pg1 I6<3> ( .in1(on<3>), .in2(op<3>), .o(oo<3>) ); 
diff2sing_v1pg1 I6<4> ( .in1(on<4>), .in2(op<4>), .o(oo<4>) ); 
diff2sing_v1pg1 I6<5> ( .in1(on<5>), .in2(op<5>), .o(oo<5>) ); 
diff2sing_v1pg1 I6<6> ( .in1(on<6>), .in2(op<6>), .o(oo<6>) ); 
diff2sing_v1pg1 I6<7> ( .in1(on<7>), .in2(op<7>), .o(oo<7>) ); 
diff2sing_v1pg1 I6<8> ( .in1(on<8>), .in2(op<8>), .o(oo<8>) ); 
VCO_type2_65 I1 ( .VBIAS(vbias), .o<1>(op<1>), .o<2>(op<2>), .o<3>(op<3>), .o<4>(op<4>), .o<5>(op<5>), .o<6>(op<6>), .o<7>(op<7>), .o<8>(op<8>), .op<1>(on<1>) ); 
VCO_type2_65 I0 ( .VBIAS(vbias), .o<1>(on<1>), .o<2>(on<2>), .o<3>(on<3>), .o<4>(on<4>), .o<5>(on<5>), .o<6>(on<6>), .o<7>(on<7>), .o<8>(on<8>), .op<1>(op<1>) ); 

endmodule

module diff2sing_v1 ( B, in1, in2, o ); 
input B, in1, in2, o;

Switch_PMOS_nfin6_nf15_m1_n12_X4_Y2_ST2_LVT MP2 ( .D(net3), .G(B), .S(VDD) ); 
Switch_PMOS_B_nfin6_nf15_m1_n12_X4_Y2_ST2_LVT MP1 ( .B(VDD), .D(o), .G(in2), .S(net3) ); 
Switch_PMOS_B_nfin6_nf15_m1_n12_X4_Y2_ST2_LVT MP0 ( .B(VDD), .D(net8), .G(in1), .S(net3) ); 
DCL_NMOS_B_nfin4_nf10_m1_n12_X2_Y2_LVT MN1 ( .B(VSS), .D(net8), .S(net5) ); 
Switch_NMOS_nfin4_nf10_m1_n12_X2_Y2_LVT MN3 ( .D(net5), .G(net8), .S(VSS) ); 
Switch_NMOS_nfin4_nf10_m1_n12_X2_Y2_ST2_LVT MN0 ( .D(o), .G(net8), .S(VSS) ); 

endmodule

module VCO_type2_65 ( VBIAS, o<1>, o<2>, o<3>, o<4>, o<5>, o<6>, o<7>, o<8>, op<1> ); 
input VBIAS, o<1>, o<2>, o<3>, o<4>, o<5>, o<6>, o<7>, o<8>, op<1>;

three_terminal_inv I1<1> ( .VBIAS(VBIAS), .VIN(o<1>), .VOUT(o<2>) ); 
three_terminal_inv I1<2> ( .VBIAS(VBIAS), .VIN(o<2>), .VOUT(o<3>) ); 
three_terminal_inv I1<3> ( .VBIAS(VBIAS), .VIN(o<3>), .VOUT(o<4>) ); 
three_terminal_inv I1<4> ( .VBIAS(VBIAS), .VIN(o<4>), .VOUT(o<5>) ); 
three_terminal_inv I1<5> ( .VBIAS(VBIAS), .VIN(o<5>), .VOUT(o<6>) ); 
three_terminal_inv I1<6> ( .VBIAS(VBIAS), .VIN(o<6>), .VOUT(o<7>) ); 
three_terminal_inv I1<7> ( .VBIAS(VBIAS), .VIN(o<7>), .VOUT(o<8>) ); 
three_terminal_inv I1<8> ( .VBIAS(VBIAS), .VIN(o<8>), .VOUT(op<1>) ); 

endmodule

module three_terminal_inv ( VBIAS, VIN, VOUT ); 
input VBIAS, VIN, VOUT;

Switch_NMOS_nfin4_nf25_m1_n12_X3_Y3_ST2_LVT MN34 ( .D(VOUT), .G(VIN), .S(VSS) ); 
Switch_PMOS_nfin6_nf4_m1_n12_X2_Y1_ST2_LVT MP34 ( .D(VOUT), .G(VBIAS), .S(VDD) ); 

endmodule

module diff2sing_v1pg1 ( in1, in2, o ); 
input in1, in2, o;

Switch_PMOS_nfin6_nf15_m1_n12_X4_Y2_ST2_LVT MP2 ( .D(net3), .G(VSS), .S(VDD) ); 
Switch_PMOS_B_nfin6_nf15_m1_n12_X4_Y2_ST2_LVT MP1 ( .B(VDD), .D(o), .G(in2), .S(net3) ); 
Switch_PMOS_B_nfin6_nf15_m1_n12_X4_Y2_ST2_LVT MP0 ( .B(VDD), .D(net8), .G(in1), .S(net3) ); 
DCL_NMOS_B_nfin4_nf10_m1_n12_X2_Y2_LVT MN1 ( .B(VSS), .D(net8), .S(net5) ); 
Switch_NMOS_nfin4_nf10_m1_n12_X2_Y2_LVT MN3 ( .D(net5), .G(net8), .S(VSS) ); 
Switch_NMOS_nfin4_nf10_m1_n12_X2_Y2_ST2_LVT MN0 ( .D(o), .G(net8), .S(VSS) ); 

endmodule

`celldefine
module global_power;
supply0 VSS;
supply1 VDD;
endmodule
`endcelldefine
