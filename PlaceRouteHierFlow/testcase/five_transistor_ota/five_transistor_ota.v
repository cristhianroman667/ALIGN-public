//Verilog block level netlist file for five_transistor_ota
//Generated by UMN for ALIGN project 


module five_transistor_ota ( id, vinn, vinp, vout ); 
input id, vinn, vinp, vout;

SCM_NMOS_nfin5_n12_X1_Y1_RVT m5_m4 ( .DA(id), .DB(net10), .S(vss) ); 
SCM_PMOS_nfin5_n12_X1_Y1_RVT m1_m2 ( .DA(net8), .DB(vout), .S(vdd) ); 
DP_NMOS_B_nfin5_n12_X1_Y1_RVT m3_m0 ( .B(vss), .DA(vout), .DB(net8), .GA(vinn), .GB(vinp), .S(net10) ); 

endmodule

`celldefine
module global_power;
supply0 vss;
supply1 vdd;
endmodule
`endcelldefine