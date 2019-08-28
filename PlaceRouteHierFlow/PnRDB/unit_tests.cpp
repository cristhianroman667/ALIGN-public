
#include <gtest/gtest.h>
#include "datatype.h"
#include "PnRdatabase.h"

#include <sstream>
#include <algorithm>

TEST(PnRDBTest, True) {
    EXPECT_TRUE( 1);
};

TEST(PnRDBTest, PnRdatabase_Constructor) {
  PnRdatabase foo;
  EXPECT_EQ( foo.get_unitScale(), 2000);
  EXPECT_EQ( foo.get_maxNode(), 0);
}

TEST(PnRDBTest, get_number) {
  PnRdatabase foo;
  EXPECT_EQ( foo.get_number( "23"), 23);
  EXPECT_EQ( foo.get_number( "457"), 457);
  EXPECT_EQ( foo.get_number( "10000000000000"), 10000000000000ULL);
}

TEST(PnRDBTest, Lexer) {
  string str =
"//Verilog block level netlist file for telescopic_ota\n"
"//Generated by UMN for ALIGN project\n" 
"\n"
"\n"
"module telescopic_ota ( voutn, vss, vinp, vbiasp1, vbiasnd, vbiasn, voutp, vbiasp2, vinn, d1, vdd ); \n"
"input voutn, vss, vinp, vbiasp1, vbiasnd, vbiasn, voutp, vbiasp2, vinn, d1, vdd; \n"
"\n"
"CMC_PMOS_S_n12_X1_Y1 m2_m1 ( .DA(net012), .G(vbiasp1), .DB(net06), .S(vdd) ); \n"
"DP_NMOS_n12_X3_Y3 m3_m0 ( .DA(net014), .GA(vinn), .S(net10), .DB(net8), .GB(vinp) ); \n"
"CMFB_NMOS_n12_X3_Y1 m5_m4 ( .DA(d1), .S(vss), .DB(net10), .GB(vbiasnd) ); \n"
"CMC_PMOS_n12_X2_Y1 m6_m7 ( .DA(voutn), .G(vbiasp2), .DB(voutp), .SA(net06), .SB(net012) ); \n"
"CMC_NMOS_n12_X3_Y1 m9_m8 ( .DA(voutn), .G(vbiasn), .DB(voutp), .SA(net8), .SB(net014) ); \n"
"\n"
"endmodule\n";

  std::istringstream is(str);
  Lexer l(is);

  while ( !l.have( TokenType::EndOfFile)) {
    std::cout << l.current_token << std::endl;
    l.get_token();
  }
}

TEST(PnRDBTest, Lexer2) {
  string str =
"//Verilog block level netlist file for telescopic_ota\n"
"//Generated by UMN for ALIGN project\n" 
"\n"
"\n"
"module telescopic_ota ( voutn, vss, vinp, vbiasp1, vbiasnd, vbiasn, voutp, vbiasp2, vinn, d1, vdd ); \n"
"input voutn, vss, vinp, vbiasp1, vbiasnd, vbiasn, voutp, vbiasp2, vinn, d1, vdd; \n"
"\n"
"CMC_PMOS_S_n12_X1_Y1 m2_m1 ( .DA(net012), .G(vbiasp1), .DB(net06), .S(vdd) ); \n"
"DP_NMOS_n12_X3_Y3 m3_m0 ( .DA(net014), .GA(vinn), .S(net10), .DB(net8), .GB(vinp) ); \n"
"CMFB_NMOS_n12_X3_Y1 m5_m4 ( .DA(d1), .S(vss), .DB(net10), .GB(vbiasnd) ); \n"
"CMC_PMOS_n12_X2_Y1 m6_m7 ( .DA(voutn), .G(vbiasp2), .DB(voutp), .SA(net06), .SB(net012) ); \n"
"CMC_NMOS_n12_X3_Y1 m9_m8 ( .DA(voutn), .G(vbiasn), .DB(voutp), .SA(net8), .SB(net014) ); \n"
"\n"
"endmodule\n";

  std::istringstream is(str);
  Lexer l(is,1);

  while ( !l.have( TokenType::EndOfFile)) {
    std::cout << l.current_token << std::endl;
    EXPECT_NE( l.current_token.tt, TokenType::EndOfLine);
    l.get_token();
  }
}



TEST( PnRDBTest, Telescopic_OTA)
{
  string str =
R"foo(//Verilog block level netlist file for telescopic_ota
//Generated by UMN for ALIGN project

module telescopic_ota ( voutn, vss, vinp, vbiasp1, vbiasnd, vbiasn, voutp, vbiasp2, vinn, d1, vdd ); 
input voutn, vss, vinp, vbiasp1, vbiasnd, vbiasn, voutp, vbiasp2, vinn, d1, vdd; 

CMC_PMOS_S_n12_X1_Y1 m2_m1 ( .DA(net012), .G(vbiasp1), .DB(net06),.S(vdd) ); 
DP_NMOS_n12_X3_Y3 m3_m0 ( .DA(net014), .GA(vinn), .S(net10), .DB(net8), .GB(vinp) ); 
CMFB_NMOS_n12_X3_Y1 m5_m4 ( .DA(d1), .S(vss), .DB(net10), .GB(vbiasnd) ); 
CMC_PMOS_n12_X2_Y1 m6_m7 ( .DA(voutn), .G(vbiasp2), .DB(voutp), .SA(net06), .SB(net012) ); 
CMC_NMOS_n12_X3_Y1 m9_m8 ( .DA(voutn), .G(vbiasn), .DB(voutp), .SA(net8), .SB(net014) ); 

endmodule
)foo";

  PnRdatabase db;
  ReadVerilogHelper rvh(db);
  std::istringstream is(str);

  rvh.parse_top( is);

  EXPECT_EQ( db.hierTree.size(), 1);

  const auto& ht = db.hierTree[0];

  EXPECT_EQ( ht.Terminals.size(), 11);

  EXPECT_EQ( ht.Blocks.size(), 5);
  EXPECT_EQ( ht.Nets.size(), 16);
  EXPECT_EQ( ht.Terminals.size(), 11);

  cout << "Nets:";
  for( auto p = ht.Nets.begin(); p != ht.Nets.end(); ++p) {
    cout << " " << p->name;
  }
  cout << endl;

  EXPECT_FALSE( ht.isCompleted);
  EXPECT_FALSE( ht.isTop);

  EXPECT_EQ( ht.width, 0);
  EXPECT_EQ( ht.height, 0);
}

TEST( PnRDBTest, Switched_Capacitor_Filter)
{
  string str =
R"foo(//Verilog block level netlist file for switched_capacitor_filter
//Generated by UMN for ALIGN project 


module switched_capacitor_combination ( Vin, agnd, Vin_ota, Voutn, phi1, phi2 ); 
input Vin, agnd, Vin_ota, Voutn, phi1, phi2;

Cap_60fF c0 ( .MINUS(net63), .PLUS(net72) ); 
Switch_NMOS_n12_X1_Y1 m4 ( .D(net72), .G(phi2), .S(agnd) ); 
Switch_NMOS_n12_X1_Y1 m6 ( .D(net72), .G(phi1), .S(Vin) ); 
DP_NMOS_n12_X1_Y1 m7_m5 ( .DA(Vin_ota), .GA(phi1), .S(net63), .DB(agnd), .GB(phi2) ); 
DP_NMOS_n12_X1_Y1 m0_m3 ( .DA(Voutn), .GA(phi1), .S(net67), .DB(agnd), .GB(phi2) ); 

Cap_30fF_Cap_60fF c1_c3 ( .MINUS1(net67), .PLUS1(net63), .MINUS2(Voutn), .PLUS2(Vin_ota) );
endmodule

module switched_capacitor_filter ( id, voutn, vinn, vss, agnd, vinp, voutp ); 
input id, voutn, vinn, vss, agnd, vinp, voutp;

telescopic_ota xi0 ( .d1(id), .vbiasn(vbiasn), .vbiasnd(vbiasnd), .vbiasp1(vbiasp1), .vbiasp2(vbiasp2), .vdd(vdd), .vinn(net64), .vinp(net66), .voutn(voutn), .voutp(voutp), .vss(vss) ); 
switched_capacitor_combination m6_c0_m4_m3_m5_c1_m7_c3_m0 ( .Vin(vinn), .agnd(agnd), .Vin_ota(net66), .Voutn(voutn), .phi1(phi1), .phi2(phi2) ); 
switched_capacitor_combination m12_c4_m8_m11_m9_c7_m10_c6_m14 ( .Vin(vinp), .agnd(agnd), .Vin_ota(net64), .Voutn(voutp), .phi1(phi1), .phi2(phi2) ); 

Cap_30fF_Cap_30fF c2_c5 ( .MINUS1(net66), .PLUS1(vinp), .MINUS2(net64), .PLUS2(vinn) );
Cap_60fF_Cap_60fF c8_c9 ( .MINUS1(vss), .PLUS1(voutn), .MINUS2(vss), .PLUS2(voutp) );
endmodule

module CMFB_NMOS ( DA, S, DB, GB ); 
input DA, S, DB, GB;

DCL_NMOS_n12_X2_Y1 M0 ( .D(DA), .S(S) ); 
Switch_NMOS_n12_X3_Y1 M1 ( .D(DB), .G(GB), .S(S) ); 

endmodule

module telescopic_ota ( d1, vbiasn, vbiasnd, vbiasp1, vbiasp2, vdd, vinn, vinp, voutn, voutp, vss ); 
input d1, vbiasn, vbiasnd, vbiasp1, vbiasp2, vdd, vinn, vinp, voutn, voutp, vss;

CMC_PMOS_S_n12_X1_Y1 m2_m1 ( .DA(net012), .G(vbiasp1), .DB(net06), .S(vdd) ); 
DP_NMOS_n12_X3_Y2 m3_m0 ( .DA(net014), .GA(vinn), .S(net10), .DB(net8), .GB(vinp) ); 
CMFB_NMOS m5_m4 ( .DA(d1), .S(vss), .DB(net10), .GB(vbiasnd) ); 
CMC_PMOS_n12_X2_Y1 m6_m7 ( .DA(voutn), .G(vbiasp2), .DB(voutp), .SA(net06), .SB(net012) ); 
CMC_NMOS_n12_X3_Y1 m9_m8 ( .DA(voutn), .G(vbiasn), .DB(voutp), .SA(net8), .SB(net014) ); 

endmodule
)foo";

  PnRdatabase db;
  ReadVerilogHelper rvh(db);
  std::istringstream is(str);

  rvh.parse_top( is);
}

TEST( PnRDBTest, VGA)
{
  string str =
R"foo(//Verilog block level netlist file for vga
//Generated by UMN for ALIGN project 


module vga (vps,vgnd,vin1,vin2,vmirror,s0,s1,s2,vga_out1,vga_out2); 
inout vps,vgnd,vin1,vin2,vmirror,s0,s1,s2,vga_out1,vga_out2;

Cap_10f C1 ( .MINUS(vgnd), .PLUS(vga_out1) ); 
Cap_10f C2 ( .MINUS(vgnd), .PLUS(vga_out2) ); 
Switch_NMOS_n10_X4_Y4 Nsw0 ( .D(net5), .G(s0), .S(net5p) ); 
Switch_NMOS_n10_X4_Y4 Nsw1 ( .D(net4), .G(s1), .S(net4p) ); 
Switch_NMOS_n10_X4_Y4 Nsw2 ( .D(net6), .G(s2), .S(net6p) ); 
Res_400 R0 ( .MINUS(vga_out1), .PLUS(vps) ); 
Res_400 R1 ( .MINUS(vga_out2), .PLUS(vps) ); 
CMB_4_n10_A1_B1_C2_D4 xM03|MN0_xM02|MN0_xM32|MN0_xM12|MN0_xM22|MN0 ( .D0(vmirror), .D1(net3), .D2(net6p), .D3(net5p), .D4(net4p), .S(vgnd) ); 
DP_NMOS_n10_X5_Y4 xM20|MN0_xM21|MN0 ( .D1(vga_out1), .G1(vin1), .S(net4), .D2(vga_out2), .G2(vin2) ); 
DP_NMOS_n10_X8_Y5 xM30|MN0_xM31|MN0 ( .D1(vga_out1), .G1(vin1), .S(net6), .D2(vga_out2), .G2(vin2) ); 
DP_NMOS_n10_X5_Y2 xM10|MN0_xM11|MN0 ( .D1(vga_out1), .G1(vin1), .S(net5), .D2(vga_out2), .G2(vin2) ); 
DP_NMOS_n10_X5_Y2 xM00|MN0_xM01|MN0 ( .D1(vga_out1), .G1(vin1), .S(net3), .D2(vga_out2), .G2(vin2) ); 

endmodule


// End HDL models
// Global nets module
`celldefine
module cds_globals;

supply0 vdd!;
supply1 0;

endmodule
`endcelldefine
)foo";

  PnRdatabase db;

  ReadVerilogHelper rvh(db);
  std::istringstream is(str);

  rvh.parse_top( is);
}

TEST( PnRDBTest, Specify)
{
  string str =
R"foo(//Verilog block level netlist file for vga
//Generated by UMN for ALIGN project 


specify
module vga (vps,vgnd,vin1,vin2,vmirror,s0,s1,s2,vga_out1,vga_out2); 
inout vps,vgnd,vin1,vin2,vmirror,s0,s1,s2,vga_out1,vga_out2;

Cap_10f C1 ( .MINUS(vgnd), .PLUS(vga_out1) ); 
Cap_10f C2 ( .MINUS(vgnd), .PLUS(vga_out2) ); 
Switch_NMOS_n10_X4_Y4 Nsw0 ( .D(net5), .G(s0), .S(net5p) ); 
Switch_NMOS_n10_X4_Y4 Nsw1 ( .D(net4), .G(s1), .S(net4p) ); 
Switch_NMOS_n10_X4_Y4 Nsw2 ( .D(net6), .G(s2), .S(net6p) ); 
Res_400 R0 ( .MINUS(vga_out1), .PLUS(vps) ); 
Res_400 R1 ( .MINUS(vga_out2), .PLUS(vps) ); 
CMB_4_n10_A1_B1_C2_D4 xM03|MN0_xM02|MN0_xM32|MN0_xM12|MN0_xM22|MN0 ( .D0(vmirror), .D1(net3), .D2(net6p), .D3(net5p), .D4(net4p), .S(vgnd) ); 
DP_NMOS_n10_X5_Y4 xM20|MN0_xM21|MN0 ( .D1(vga_out1), .G1(vin1), .S(net4), .D2(vga_out2), .G2(vin2) ); 
DP_NMOS_n10_X8_Y5 xM30|MN0_xM31|MN0 ( .D1(vga_out1), .G1(vin1), .S(net6), .D2(vga_out2), .G2(vin2) ); 
DP_NMOS_n10_X5_Y2 xM10|MN0_xM11|MN0 ( .D1(vga_out1), .G1(vin1), .S(net5), .D2(vga_out2), .G2(vin2) ); 
DP_NMOS_n10_X5_Y2 xM00|MN0_xM01|MN0 ( .D1(vga_out1), .G1(vin1), .S(net3), .D2(vga_out2), .G2(vin2) ); 

endmodule

module vga (vps,vgnd,vin1,vin2,vmirror,s0,s1,s2,vga_out1,vga_out2); 
inout vps,vgnd,vin1,vin2,vmirror,s0,s1,s2,vga_out1,vga_out2;

Cap_10f C1 ( .MINUS(vgnd), .PLUS(vga_out1) ); 
Cap_10f C2 ( .MINUS(vgnd), .PLUS(vga_out2) ); 
Switch_NMOS_n10_X4_Y4 Nsw0 ( .D(net5), .G(s0), .S(net5p) ); 
Switch_NMOS_n10_X4_Y4 Nsw1 ( .D(net4), .G(s1), .S(net4p) ); 
Switch_NMOS_n10_X4_Y4 Nsw2 ( .D(net6), .G(s2), .S(net6p) ); 
Res_400 R0 ( .MINUS(vga_out1), .PLUS(vps) ); 
Res_400 R1 ( .MINUS(vga_out2), .PLUS(vps) ); 
CMB_4_n10_A1_B1_C2_D4 xM03|MN0_xM02|MN0_xM32|MN0_xM12|MN0_xM22|MN0 ( .D0(vmirror), .D1(net3), .D2(net6p), .D3(net5p), .D4(net4p), .S(vgnd) ); 
DP_NMOS_n10_X5_Y4 xM20|MN0_xM21|MN0 ( .D1(vga_out1), .G1(vin1), .S(net4), .D2(vga_out2), .G2(vin2) ); 
DP_NMOS_n10_X8_Y5 xM30|MN0_xM31|MN0 ( .D1(vga_out1), .G1(vin1), .S(net6), .D2(vga_out2), .G2(vin2) ); 
DP_NMOS_n10_X5_Y2 xM10|MN0_xM11|MN0 ( .D1(vga_out1), .G1(vin1), .S(net5), .D2(vga_out2), .G2(vin2) ); 
DP_NMOS_n10_X5_Y2 xM00|MN0_xM01|MN0 ( .D1(vga_out1), .G1(vin1), .S(net3), .D2(vga_out2), .G2(vin2) ); 

endmodule
endspecify

// End HDL models
)foo";

  PnRdatabase db;

  ReadVerilogHelper rvh(db);
  std::istringstream is(str);

  rvh.parse_top( is);

  EXPECT_EQ( db.hierTree.size(), 0);


}

TEST( PnRDBTest, SpecifyMixed)
{
  string str =
R"foo(//Verilog block level netlist file for vga
//Generated by UMN for ALIGN project 


specify
module vga (vps,vgnd,vin1,vin2,vmirror,s0,s1,s2,vga_out1,vga_out2); 
inout vps,vgnd,vin1,vin2,vmirror,s0,s1,s2,vga_out1,vga_out2;

Cap_10f C1 ( .MINUS(vgnd), .PLUS(vga_out1) ); 
Cap_10f C2 ( .MINUS(vgnd), .PLUS(vga_out2) ); 
Switch_NMOS_n10_X4_Y4 Nsw0 ( .D(net5), .G(s0), .S(net5p) ); 
Switch_NMOS_n10_X4_Y4 Nsw1 ( .D(net4), .G(s1), .S(net4p) ); 
Switch_NMOS_n10_X4_Y4 Nsw2 ( .D(net6), .G(s2), .S(net6p) ); 
Res_400 R0 ( .MINUS(vga_out1), .PLUS(vps) ); 
Res_400 R1 ( .MINUS(vga_out2), .PLUS(vps) ); 
CMB_4_n10_A1_B1_C2_D4 xM03|MN0_xM02|MN0_xM32|MN0_xM12|MN0_xM22|MN0 ( .D0(vmirror), .D1(net3), .D2(net6p), .D3(net5p), .D4(net4p), .S(vgnd) ); 
DP_NMOS_n10_X5_Y4 xM20|MN0_xM21|MN0 ( .D1(vga_out1), .G1(vin1), .S(net4), .D2(vga_out2), .G2(vin2) ); 
DP_NMOS_n10_X8_Y5 xM30|MN0_xM31|MN0 ( .D1(vga_out1), .G1(vin1), .S(net6), .D2(vga_out2), .G2(vin2) ); 
DP_NMOS_n10_X5_Y2 xM10|MN0_xM11|MN0 ( .D1(vga_out1), .G1(vin1), .S(net5), .D2(vga_out2), .G2(vin2) ); 
DP_NMOS_n10_X5_Y2 xM00|MN0_xM01|MN0 ( .D1(vga_out1), .G1(vin1), .S(net3), .D2(vga_out2), .G2(vin2) ); 

endmodule

endspecify

module telescopic_ota ( voutn, vss, vinp, vbiasp1, vbiasnd, vbiasn, voutp, vbiasp2, vinn, d1, vdd ); 
input voutn, vss, vinp, vbiasp1, vbiasnd, vbiasn, voutp, vbiasp2, vinn, d1, vdd; 

CMC_PMOS_S_n12_X1_Y1 m2_m1 ( .DA(net012), .G(vbiasp1), .DB(net06),.S(vdd) ); 
DP_NMOS_n12_X3_Y3 m3_m0 ( .DA(net014), .GA(vinn), .S(net10), .DB(net8), .GB(vinp) ); 
CMFB_NMOS_n12_X3_Y1 m5_m4 ( .DA(d1), .S(vss), .DB(net10), .GB(vbiasnd) ); 
CMC_PMOS_n12_X2_Y1 m6_m7 ( .DA(voutn), .G(vbiasp2), .DB(voutp), .SA(net06), .SB(net012) ); 
CMC_NMOS_n12_X3_Y1 m9_m8 ( .DA(voutn), .G(vbiasn), .DB(voutp), .SA(net8), .SB(net014) ); 

endmodule

specify
module vga (vps,vgnd,vin1,vin2,vmirror,s0,s1,s2,vga_out1,vga_out2); 
inout vps,vgnd,vin1,vin2,vmirror,s0,s1,s2,vga_out1,vga_out2;

Cap_10f C1 ( .MINUS(vgnd), .PLUS(vga_out1) ); 
Cap_10f C2 ( .MINUS(vgnd), .PLUS(vga_out2) ); 
Switch_NMOS_n10_X4_Y4 Nsw0 ( .D(net5), .G(s0), .S(net5p) ); 
Switch_NMOS_n10_X4_Y4 Nsw1 ( .D(net4), .G(s1), .S(net4p) ); 
Switch_NMOS_n10_X4_Y4 Nsw2 ( .D(net6), .G(s2), .S(net6p) ); 
Res_400 R0 ( .MINUS(vga_out1), .PLUS(vps) ); 
Res_400 R1 ( .MINUS(vga_out2), .PLUS(vps) ); 
CMB_4_n10_A1_B1_C2_D4 xM03|MN0_xM02|MN0_xM32|MN0_xM12|MN0_xM22|MN0 ( .D0(vmirror), .D1(net3), .D2(net6p), .D3(net5p), .D4(net4p), .S(vgnd) ); 
DP_NMOS_n10_X5_Y4 xM20|MN0_xM21|MN0 ( .D1(vga_out1), .G1(vin1), .S(net4), .D2(vga_out2), .G2(vin2) ); 
DP_NMOS_n10_X8_Y5 xM30|MN0_xM31|MN0 ( .D1(vga_out1), .G1(vin1), .S(net6), .D2(vga_out2), .G2(vin2) ); 
DP_NMOS_n10_X5_Y2 xM10|MN0_xM11|MN0 ( .D1(vga_out1), .G1(vin1), .S(net5), .D2(vga_out2), .G2(vin2) ); 
DP_NMOS_n10_X5_Y2 xM00|MN0_xM01|MN0 ( .D1(vga_out1), .G1(vin1), .S(net3), .D2(vga_out2), .G2(vin2) ); 

endmodule

endspecify


// End HDL models
)foo";

  PnRdatabase db;

  ReadVerilogHelper rvh(db);
  std::istringstream is(str);

  rvh.parse_top( is);

  EXPECT_EQ( db.hierTree.size(), 1);

  const auto& ht = db.hierTree[0];

  EXPECT_EQ( ht.Terminals.size(), 11);

  EXPECT_EQ( ht.Blocks.size(), 5);
  EXPECT_EQ( ht.Nets.size(), 16);
  EXPECT_EQ( ht.Terminals.size(), 11);

  cout << "Nets:";
  for( auto p = ht.Nets.begin(); p != ht.Nets.end(); ++p) {
    cout << " " << p->name;
  }
  cout << endl;

  EXPECT_FALSE( ht.isCompleted);
  EXPECT_FALSE( ht.isTop);

  EXPECT_EQ( ht.width, 0);
  EXPECT_EQ( ht.height, 0);

}


TEST( PnRDBTest, SpecifyCelldefine)
{
  string str =
R"foo(//Verilog block level netlist file for switched_capacitor_filter
//Generated by UMN for ALIGN project 


module switched_capacitor_combination ( Vin, Vin_ota, Voutn, phi1, phi2 ); 
input Vin, Vin_ota, Voutn, phi1, phi2;

Cap_60fF c0 ( .MINUS(net63), .PLUS(net72) ); 
Cap_30fF c1 ( .MINUS(net67), .PLUS(net63) ); 
Cap_60fF c3 ( .MINUS(Voutn), .PLUS(Vin_ota) ); 
Switch_NMOS_n12_X2_Y1 m4 ( .D(net72), .G(phi2), .S(analog_gnd) ); 
Switch_NMOS_n12_X2_Y1 m6 ( .D(net72), .G(phi1), .S(Vin) ); 
DP_NMOS_n12_X2_Y1 m7_m5 ( .DA(Vin_ota), .GA(phi1), .S(net63), .DB(analog_gnd), .GB(phi2) ); 
DP_NMOS_n12_X2_Y1 m0_m3 ( .DA(Voutn), .GA(phi1), .S(net67), .DB(analog_gnd), .GB(phi2) ); 

endmodule


module switched_capacitor_filter ( voutn, voutp, vinp, vinn, id ); 
telescopic_ota xi0 ( .d1(id), .vbiasn(vbiasn), .vbiasnd(vbiasnd), .vbiasp1(vbiasp1), .vbiasp2(vbiasp2), .vinn(net64), .vinp(net66), .voutn(voutn), .voutp(voutp) ); 
switched_capacitor_combination m6_c0_m4_m3_m5_c1_m7_c3_m0 ( .Vin(vinn), .Vin_ota(net66), .Voutn(voutn), .phi1(phi1), .phi2(phi2) ); 
switched_capacitor_combination m12_c4_m8_m11_m9_c7_m10_c6_m14 ( .Vin(vinp), .Vin_ota(net64), .Voutn(voutp), .phi1(phi1), .phi2(phi2) ); 

endmodule

module telescopic_ota ( d1, vbiasn, vbiasnd, vbiasp1, vbiasp2, vinn, vinp, voutn, voutp ); 
input d1, vbiasn, vbiasnd, vbiasp1, vbiasp2, vinn, vinp, voutn, voutp;
specify
    specparam CDS_LIBNAME = "pcell";
    specparam CDS_CELLNAME = "telescopic_ota";
    specparam CDS_VIEWNAME = "schematic";
endspecify
CMC_PMOS_S_n12_X2_Y1 m2_m1 ( .DA(net012), .G(vbiasp1), .DB(net06), .S(analog_vdd) ); 
DP_NMOS_n12_X2_Y1 m3_m0 ( .DA(net014), .GA(vinn), .S(net10), .DB(net8), .GB(vinp) ); 
CMFB_NMOS_n12_X2_Y1 m5_m4 ( .DA(d1), .S(analog_gnd), .DB(net10), .GB(vbiasnd) ); 
CMC_PMOS_n12_X2_Y1 m6_m7 ( .DA(voutn), .G(vbiasp2), .DB(voutp), .SA(net06), .SB(net012) ); 
CMC_NMOS_n12_X2_Y1 m9_m8 ( .DA(voutn), .G(vbiasn), .DB(voutp), .SA(net8), .SB(net014) ); 

endmodule

`celldefine
module analog_power;
supply0 analog_gnd;
supply1 analog_vdd;
endmodule
`endcelldefine
)foo";

  PnRdatabase db;

  ReadVerilogHelper rvh(db);
  std::istringstream is(str);

  rvh.parse_top( is);

  EXPECT_EQ( db.hierTree.size(), 3);

  EXPECT_EQ( rvh.get_Supply_node().Blocks.size(), 2);

}

using namespace nlohmann;

namespace PnRDB {

  inline void to_json(json& j, const net& n) {
    j["name"] = n.name;
  }

  inline void to_json(json& j, const hierNode& hN) {
    j["name"] = hN.name;
    j["parent"] = json(hN.parent);
    j["Nets"] = json(hN.Nets);
  }

};

TEST( hierNodeTest, TestA)
{
  PnRDB::hierNode hN;
  hN.name = "hierNodeName";

  PnRDB::net n0;
  n0.name = "n0";
  PnRDB::net n1;
  n1.name = "n1";

  hN.Nets.push_back( n0);  
  hN.Nets.push_back( n1);  

  json json_hN(hN);

  json jsonTop;
  jsonTop["name"] = "hierNodeName";
  jsonTop["parent"] = json::array();
  jsonTop["Nets"] = json::array();

  {
    json jj;
    jj["name"] = "n0";
    jsonTop["Nets"].push_back( jj);
  }

  {
    json jj;
    jj["name"] = "n1";
    jsonTop["Nets"].push_back( jj);
  }

  EXPECT_EQ( json_hN, jsonTop);

  {
    std::ofstream jsonStream( "__jsonA");
    if(jsonStream.fail()) {
      cout<< "Cannot open file "<< "__jsonA" <<" for writing"<<endl;
      return;
    }
    jsonStream << std::setw(4) << jsonTop;
    jsonStream.close();
  }
  {
    std::ofstream jsonStream( "__jsonB");
    if(jsonStream.fail()) {
      cout<< "Cannot open file "<< "__jsonB" <<" for writing"<<endl;
      return;
    }
    jsonStream << std::setw(4) << json_hN;
    jsonStream.close();
  }

}

