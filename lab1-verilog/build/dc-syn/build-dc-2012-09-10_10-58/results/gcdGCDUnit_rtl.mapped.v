
module SNPS_CLOCK_GATE_HIGH_gcdGCDUnitDpath_W16_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CGLPPRX2 latch ( .SE(TE), .EN(EN), .CLK(CLK), .GCLK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_gcdGCDUnitDpath_W16_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CGLPPRX2 latch ( .SE(TE), .EN(EN), .CLK(CLK), .GCLK(ENCLK) );
endmodule


module gcdGCDUnitDpath_W16 ( operands_bits_A, operands_bits_B, 
        result_bits_data, clk, reset, B_mux_sel, A_en, B_en, A_mux_sel, B_zero, 
        A_lt_B, A_mux_sel_0__hfs_netlink_1 );
  input [15:0] operands_bits_A;
  input [15:0] operands_bits_B;
  output [15:0] result_bits_data;
  input [1:0] A_mux_sel;
  input clk, reset, B_mux_sel, A_en, B_en, A_mux_sel_0__hfs_netlink_1;
  output B_zero, A_lt_B;
  wire   net163, net169, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n13, n14,
         n15, n16, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n30,
         n31, n32, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n311, n312,
         n313, n314, n315, n316, n317, n319, n321, n322;
  wire   [15:0] A_next;
  wire   [15:0] B_reg;
  wire   [15:0] B_next;

  SNPS_CLOCK_GATE_HIGH_gcdGCDUnitDpath_W16_0 clk_gate_B_reg_reg ( .CLK(clk), 
        .EN(B_en), .ENCLK(net163), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_gcdGCDUnitDpath_W16_1 clk_gate_A_reg_reg ( .CLK(clk), 
        .EN(A_en), .ENCLK(net169), .TE(1'b0) );
  DFFARX1 B_reg_reg_15_ ( .D(B_next[15]), .CLK(net163), .RSTB(n319), .Q(
        B_reg[15]), .QN(n308) );
  DFFARX1 B_reg_reg_14_ ( .D(B_next[14]), .CLK(net163), .RSTB(n319), .Q(
        B_reg[14]), .QN(n269) );
  DFFARX1 B_reg_reg_13_ ( .D(B_next[13]), .CLK(net163), .RSTB(n319), .Q(
        B_reg[13]), .QN(n256) );
  DFFARX1 B_reg_reg_12_ ( .D(B_next[12]), .CLK(net163), .RSTB(n319), .Q(
        B_reg[12]), .QN(n234) );
  DFFARX1 B_reg_reg_11_ ( .D(B_next[11]), .CLK(net163), .RSTB(n319), .Q(
        B_reg[11]), .QN(n222) );
  DFFARX1 B_reg_reg_10_ ( .D(B_next[10]), .CLK(net163), .RSTB(n319), .Q(
        B_reg[10]), .QN(n208) );
  DFFARX1 B_reg_reg_9_ ( .D(B_next[9]), .CLK(net163), .RSTB(n319), .Q(B_reg[9]), .QN(n198) );
  DFFARX1 B_reg_reg_8_ ( .D(B_next[8]), .CLK(net163), .RSTB(n319), .Q(B_reg[8]), .QN(n175) );
  DFFARX1 B_reg_reg_7_ ( .D(B_next[7]), .CLK(net163), .RSTB(n319), .Q(B_reg[7]), .QN(n155) );
  DFFARX1 B_reg_reg_6_ ( .D(B_next[6]), .CLK(net163), .RSTB(n319), .Q(B_reg[6]), .QN(n138) );
  DFFARX1 B_reg_reg_5_ ( .D(B_next[5]), .CLK(net163), .RSTB(n319), .Q(B_reg[5]), .QN(n128) );
  DFFARX1 B_reg_reg_4_ ( .D(B_next[4]), .CLK(net163), .RSTB(n319), .Q(B_reg[4]), .QN(n110) );
  DFFARX1 B_reg_reg_3_ ( .D(B_next[3]), .CLK(net163), .RSTB(n319), .Q(B_reg[3]), .QN(n99) );
  DFFARX1 B_reg_reg_2_ ( .D(B_next[2]), .CLK(net163), .RSTB(n319), .Q(B_reg[2]), .QN(n86) );
  DFFARX1 B_reg_reg_1_ ( .D(B_next[1]), .CLK(net163), .RSTB(n319), .Q(B_reg[1]), .QN(n77) );
  DFFARX1 B_reg_reg_0_ ( .D(B_next[0]), .CLK(net163), .RSTB(n319), .Q(B_reg[0]), .QN(n70) );
  DFFARX1 A_reg_reg_8_ ( .D(A_next[8]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[8]), .QN(n53) );
  DFFARX1 A_reg_reg_6_ ( .D(A_next[6]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[6]), .QN(n58) );
  DFFARX1 A_reg_reg_5_ ( .D(A_next[5]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[5]), .QN(n59) );
  DFFARX1 A_reg_reg_3_ ( .D(A_next[3]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[3]), .QN(n52) );
  DFFARX1 A_reg_reg_2_ ( .D(A_next[2]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[2]) );
  DFFARX1 A_reg_reg_1_ ( .D(A_next[1]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[1]), .QN(n51) );
  DFFARX1 A_reg_reg_0_ ( .D(A_next[0]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[0]), .QN(n50) );
  DFFARX1 A_reg_reg_13_ ( .D(A_next[13]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[13]), .QN(n67) );
  DFFARX1 A_reg_reg_12_ ( .D(A_next[12]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[12]), .QN(n66) );
  DFFARX1 A_reg_reg_10_ ( .D(A_next[10]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[10]), .QN(n63) );
  DFFARX1 A_reg_reg_9_ ( .D(A_next[9]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[9]), .QN(n60) );
  DFFARX1 A_reg_reg_11_ ( .D(A_next[11]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[11]), .QN(n62) );
  DFFARX1 A_reg_reg_15_ ( .D(A_next[15]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[15]), .QN(n55) );
  DFFARX1 A_reg_reg_7_ ( .D(A_next[7]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[7]), .QN(n56) );
  DFFARX1 A_reg_reg_4_ ( .D(A_next[4]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[4]), .QN(n57) );
  DFFARX1 A_reg_reg_14_ ( .D(A_next[14]), .CLK(net169), .RSTB(n319), .Q(
        result_bits_data[14]), .QN(n65) );
  NOR2X2 U2 ( .IN1(n5), .IN2(n2), .QN(A_lt_B) );
  NAND2X1 U4 ( .IN1(n25), .IN2(n36), .QN(n3) );
  NAND2X1 U7 ( .IN1(n20), .IN2(n19), .QN(n6) );
  NAND2X2 U9 ( .IN1(n14), .IN2(n9), .QN(n8) );
  INVX0 U12 ( .INP(n146), .ZN(n12) );
  INVX1 U13 ( .INP(n184), .ZN(n13) );
  NAND2X1 U15 ( .IN1(n26), .IN2(n16), .QN(n15) );
  NAND2X1 U18 ( .IN1(n23), .IN2(n21), .QN(n18) );
  NAND2X1 U19 ( .IN1(n46), .IN2(n45), .QN(n19) );
  NOR2X0 U20 ( .IN1(n64), .IN2(n28), .QN(n20) );
  NAND2X1 U22 ( .IN1(n22), .IN2(n295), .QN(n21) );
  NAND2X1 U23 ( .IN1(n34), .IN2(n296), .QN(n22) );
  NAND2X1 U24 ( .IN1(n24), .IN2(n68), .QN(n23) );
  NOR2X0 U26 ( .IN1(n37), .IN2(n61), .QN(n25) );
  NAND2X1 U31 ( .IN1(n32), .IN2(n31), .QN(n30) );
  INVX0 U32 ( .INP(n142), .ZN(n31) );
  INVX0 U33 ( .INP(n146), .ZN(n32) );
  INVX0 U34 ( .INP(n301), .ZN(n34) );
  NOR2X0 U35 ( .IN1(n276), .IN2(n273), .QN(n35) );
  INVX0 U36 ( .INP(n64), .ZN(n36) );
  NAND4X0 U37 ( .IN1(n287), .IN2(n244), .IN3(n201), .IN4(n185), .QN(n37) );
  NAND2X1 U38 ( .IN1(n145), .IN2(n186), .QN(n38) );
  NOR2X0 U40 ( .IN1(n102), .IN2(n118), .QN(n40) );
  NAND2X1 U41 ( .IN1(n44), .IN2(n42), .QN(n41) );
  NAND2X1 U42 ( .IN1(n43), .IN2(n90), .QN(n42) );
  NAND2X1 U43 ( .IN1(n80), .IN2(n92), .QN(n43) );
  NOR2X0 U44 ( .IN1(n89), .IN2(n118), .QN(n44) );
  NOR2X0 U45 ( .IN1(n245), .IN2(n243), .QN(n45) );
  NOR2X0 U48 ( .IN1(n192), .IN2(n214), .QN(n48) );
  NOR2X0 U50 ( .IN1(n174), .IN2(n321), .QN(n177) );
  NOR2X0 U51 ( .IN1(n76), .IN2(n321), .QN(n79) );
  NOR2X0 U52 ( .IN1(n127), .IN2(n321), .QN(n130) );
  NOR2X0 U53 ( .IN1(n137), .IN2(n321), .QN(n140) );
  NOR2X0 U54 ( .IN1(n69), .IN2(n321), .QN(n72) );
  NOR2X0 U55 ( .IN1(n85), .IN2(n321), .QN(n88) );
  NOR2X0 U56 ( .IN1(n98), .IN2(n321), .QN(n101) );
  NOR2X1 U57 ( .IN1(n222), .IN2(result_bits_data[11]), .QN(n238) );
  NOR2X1 U58 ( .IN1(n99), .IN2(result_bits_data[3]), .QN(n117) );
  NOR2X2 U59 ( .IN1(n256), .IN2(result_bits_data[13]), .QN(n274) );
  NOR2X1 U61 ( .IN1(n60), .IN2(B_reg[9]), .QN(n214) );
  NAND2X1 U63 ( .IN1(n157), .IN2(n156), .QN(n173) );
  NAND2X1 U64 ( .IN1(n173), .IN2(n172), .QN(A_next[7]) );
  NAND2X1 U67 ( .IN1(n177), .IN2(n176), .QN(n197) );
  NAND2X1 U68 ( .IN1(n197), .IN2(n196), .QN(A_next[8]) );
  NAND2X1 U71 ( .IN1(n130), .IN2(n129), .QN(n136) );
  NAND2X1 U72 ( .IN1(n136), .IN2(n135), .QN(A_next[5]) );
  NAND2X1 U74 ( .IN1(n153), .IN2(n152), .QN(A_next[6]) );
  NAND2X1 U75 ( .IN1(n72), .IN2(n71), .QN(n75) );
  NAND2X1 U76 ( .IN1(n75), .IN2(n74), .QN(A_next[0]) );
  NAND2X1 U77 ( .IN1(n88), .IN2(n87), .QN(n97) );
  NAND2X1 U78 ( .IN1(n97), .IN2(n96), .QN(A_next[2]) );
  NAND2X1 U79 ( .IN1(n101), .IN2(n100), .QN(n108) );
  NAND2X1 U80 ( .IN1(n108), .IN2(n107), .QN(A_next[3]) );
  INVX0 U82 ( .INP(n113), .ZN(n102) );
  NOR2X1 U83 ( .IN1(n59), .IN2(B_reg[5]), .QN(n146) );
  NOR2X1 U84 ( .IN1(n234), .IN2(result_bits_data[12]), .QN(n260) );
  INVX0 U85 ( .INP(n116), .ZN(n89) );
  NOR2X1 U87 ( .IN1(n52), .IN2(B_reg[3]), .QN(n118) );
  NOR2X2 U88 ( .IN1(n208), .IN2(result_bits_data[10]), .QN(n237) );
  INVX1 U89 ( .INP(n91), .ZN(n80) );
  NOR2X1 U90 ( .IN1(n86), .IN2(result_bits_data[2]), .QN(n113) );
  NAND2X0 U92 ( .IN1(n296), .IN2(n295), .QN(n298) );
  NAND2X0 U93 ( .IN1(n185), .IN2(n184), .QN(n187) );
  NAND2X0 U94 ( .IN1(n244), .IN2(n243), .QN(n247) );
  NAND2X0 U99 ( .IN1(n115), .IN2(n102), .QN(n103) );
  INVX0 U100 ( .INP(n184), .ZN(n161) );
  NAND2X0 U105 ( .IN1(n278), .IN2(n287), .QN(n279) );
  NAND2X0 U107 ( .IN1(n287), .IN2(n286), .QN(n291) );
  INVX0 U108 ( .INP(n64), .ZN(n68) );
  NAND2X0 U109 ( .IN1(n171), .IN2(n321), .QN(n172) );
  NAND2X0 U110 ( .IN1(n165), .IN2(n164), .QN(n166) );
  NAND2X0 U111 ( .IN1(n159), .IN2(n178), .QN(n163) );
  NAND2X0 U112 ( .IN1(n186), .IN2(n185), .QN(n160) );
  NAND2X0 U113 ( .IN1(n124), .IN2(n321), .QN(n125) );
  NAND2X0 U114 ( .IN1(n145), .IN2(n142), .QN(n122) );
  NAND2X0 U115 ( .IN1(n92), .IN2(n90), .QN(n81) );
  NAND2X0 U116 ( .IN1(n131), .IN2(n145), .QN(n133) );
  NAND2X0 U117 ( .IN1(n181), .IN2(n142), .QN(n131) );
  NAND2X0 U118 ( .IN1(n162), .IN2(n183), .QN(n150) );
  NAND2X1 U119 ( .IN1(n181), .IN2(n143), .QN(n162) );
  NAND2X0 U120 ( .IN1(n103), .IN2(n116), .QN(n105) );
  NAND2X1 U121 ( .IN1(n255), .IN2(n254), .QN(A_next[12]) );
  NAND2X1 U122 ( .IN1(n307), .IN2(n253), .QN(n254) );
  NAND2X1 U123 ( .IN1(n250), .IN2(n288), .QN(n252) );
  NAND2X0 U124 ( .IN1(n294), .IN2(n272), .QN(n250) );
  NAND2X1 U125 ( .IN1(n268), .IN2(n267), .QN(A_next[13]) );
  NAND2X1 U126 ( .IN1(n307), .IN2(n266), .QN(n267) );
  NAND2X1 U127 ( .IN1(n263), .IN2(n262), .QN(n265) );
  NAND2X0 U128 ( .IN1(n294), .IN2(n261), .QN(n262) );
  NAND2X0 U131 ( .IN1(n207), .IN2(n206), .QN(A_next[9]) );
  NAND2X0 U132 ( .IN1(n307), .IN2(n205), .QN(n206) );
  NAND2X1 U133 ( .IN1(n202), .IN2(n213), .QN(n204) );
  NAND2X1 U134 ( .IN1(n294), .IN2(n201), .QN(n202) );
  NAND2X1 U135 ( .IN1(n221), .IN2(n220), .QN(A_next[10]) );
  NAND2X1 U136 ( .IN1(n307), .IN2(n219), .QN(n220) );
  NAND2X1 U137 ( .IN1(n216), .IN2(n242), .QN(n218) );
  NAND2X0 U138 ( .IN1(n294), .IN2(n239), .QN(n216) );
  NAND2X1 U139 ( .IN1(n233), .IN2(n232), .QN(A_next[11]) );
  NAND2X0 U140 ( .IN1(n307), .IN2(n231), .QN(n232) );
  NAND2X1 U141 ( .IN1(n228), .IN2(n227), .QN(n230) );
  NAND2X1 U142 ( .IN1(n313), .IN2(n312), .QN(A_next[15]) );
  NAND2X0 U143 ( .IN1(n304), .IN2(n303), .QN(n305) );
  NAND2X0 U144 ( .IN1(n294), .IN2(n293), .QN(n303) );
  NAND2X0 U145 ( .IN1(n239), .IN2(n240), .QN(n292) );
  NAND2X1 U146 ( .IN1(n191), .IN2(n190), .QN(n294) );
  NAND2X0 U147 ( .IN1(n187), .IN2(n186), .QN(n188) );
  NAND2X1 U148 ( .IN1(n181), .IN2(n180), .QN(n191) );
  NAND2X0 U149 ( .IN1(n142), .IN2(n141), .QN(n179) );
  NAND2X0 U150 ( .IN1(n185), .IN2(n178), .QN(n182) );
  NAND2X1 U151 ( .IN1(n121), .IN2(n120), .QN(n181) );
  NAND2X1 U152 ( .IN1(n115), .IN2(n114), .QN(n121) );
  NAND2X1 U153 ( .IN1(n93), .IN2(n92), .QN(n115) );
  NAND2X1 U156 ( .IN1(n308), .IN2(result_bits_data[15]), .QN(n296) );
  NAND2X1 U157 ( .IN1(n175), .IN2(result_bits_data[8]), .QN(n213) );
  NAND2X1 U158 ( .IN1(n59), .IN2(B_reg[5]), .QN(n141) );
  NAND2X1 U159 ( .IN1(n58), .IN2(B_reg[6]), .QN(n178) );
  NAND2X1 U160 ( .IN1(n57), .IN2(B_reg[4]), .QN(n142) );
  NAND2X1 U161 ( .IN1(n56), .IN2(B_reg[7]), .QN(n185) );
  NAND2X1 U162 ( .IN1(n286), .IN2(n295), .QN(n64) );
  NAND2X1 U163 ( .IN1(n55), .IN2(B_reg[15]), .QN(n295) );
  NAND2X1 U164 ( .IN1(n53), .IN2(B_reg[8]), .QN(n201) );
  NAND2X1 U165 ( .IN1(n155), .IN2(result_bits_data[7]), .QN(n186) );
  NAND2X1 U166 ( .IN1(n110), .IN2(result_bits_data[4]), .QN(n145) );
  NAND2X1 U167 ( .IN1(n86), .IN2(result_bits_data[2]), .QN(n116) );
  NAND2X1 U168 ( .IN1(n51), .IN2(B_reg[1]), .QN(n90) );
  NAND2X1 U169 ( .IN1(n77), .IN2(result_bits_data[1]), .QN(n92) );
  NOR2X0 U170 ( .IN1(A_mux_sel[0]), .IN2(n170), .QN(n171) );
  INVX0 U171 ( .INP(n163), .ZN(n165) );
  INVX0 U172 ( .INP(n183), .ZN(n159) );
  INVX0 U173 ( .INP(n160), .ZN(n164) );
  INVX0 U174 ( .INP(n162), .ZN(n158) );
  NAND2X0 U175 ( .IN1(A_mux_sel[0]), .IN2(n155), .QN(n156) );
  NOR2X0 U176 ( .IN1(n154), .IN2(n321), .QN(n157) );
  NOR2X0 U177 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[7]), .QN(n154) );
  NOR2X0 U178 ( .IN1(A_mux_sel[0]), .IN2(n123), .QN(n124) );
  NAND2X0 U179 ( .IN1(A_mux_sel[0]), .IN2(n110), .QN(n111) );
  NOR2X0 U180 ( .IN1(n109), .IN2(n321), .QN(n112) );
  NOR2X0 U181 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[4]), .QN(n109) );
  NOR2X0 U182 ( .IN1(n192), .IN2(n211), .QN(n193) );
  INVX0 U183 ( .INP(n213), .ZN(n192) );
  NAND2X0 U184 ( .IN1(A_mux_sel[0]), .IN2(n175), .QN(n176) );
  NOR2X0 U185 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[8]), .QN(n174) );
  NAND2X0 U186 ( .IN1(A_mux_sel[0]), .IN2(n77), .QN(n78) );
  NOR2X0 U187 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[1]), .QN(n76) );
  NOR2X0 U188 ( .IN1(n144), .IN2(n146), .QN(n132) );
  NAND2X0 U189 ( .IN1(A_mux_sel[0]), .IN2(n128), .QN(n129) );
  NOR2X0 U190 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[5]), .QN(n127) );
  NOR2X0 U191 ( .IN1(n148), .IN2(n184), .QN(n149) );
  INVX0 U192 ( .INP(n178), .ZN(n148) );
  INVX0 U193 ( .INP(n179), .ZN(n143) );
  NAND2X0 U194 ( .IN1(A_mux_sel[0]), .IN2(n138), .QN(n139) );
  NOR2X0 U195 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[6]), .QN(n137) );
  NAND2X0 U196 ( .IN1(A_mux_sel[0]), .IN2(n70), .QN(n71) );
  NOR2X0 U197 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[0]), .QN(n69) );
  NOR2X0 U198 ( .IN1(n89), .IN2(n113), .QN(n94) );
  NAND2X0 U199 ( .IN1(A_mux_sel[0]), .IN2(n86), .QN(n87) );
  NOR2X0 U200 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[2]), .QN(n85) );
  NOR2X0 U201 ( .IN1(n117), .IN2(n118), .QN(n104) );
  NAND2X0 U202 ( .IN1(A_mux_sel[0]), .IN2(n99), .QN(n100) );
  NOR2X0 U203 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[3]), .QN(n98) );
  NOR2X0 U204 ( .IN1(n273), .IN2(n260), .QN(n251) );
  NAND2X0 U205 ( .IN1(A_mux_sel[0]), .IN2(n234), .QN(n235) );
  NOR2X0 U206 ( .IN1(n276), .IN2(n274), .QN(n264) );
  NOR2X0 U207 ( .IN1(n292), .IN2(n260), .QN(n261) );
  NOR2X0 U208 ( .IN1(n259), .IN2(n273), .QN(n263) );
  NOR2X0 U209 ( .IN1(n288), .IN2(n260), .QN(n259) );
  NAND2X0 U210 ( .IN1(A_mux_sel[0]), .IN2(n256), .QN(n257) );
  NOR2X0 U211 ( .IN1(n301), .IN2(n289), .QN(n281) );
  INVX0 U212 ( .INP(n288), .ZN(n278) );
  INVX0 U213 ( .INP(n292), .ZN(n272) );
  NAND2X0 U214 ( .IN1(A_mux_sel[0]), .IN2(n269), .QN(n270) );
  NOR2X0 U215 ( .IN1(n212), .IN2(n214), .QN(n203) );
  NAND2X0 U216 ( .IN1(A_mux_sel[0]), .IN2(n198), .QN(n199) );
  NOR2X0 U217 ( .IN1(n237), .IN2(n243), .QN(n217) );
  NAND2X0 U218 ( .IN1(A_mux_sel[0]), .IN2(n208), .QN(n209) );
  NOR2X0 U219 ( .IN1(n245), .IN2(n238), .QN(n229) );
  NOR2X0 U220 ( .IN1(n226), .IN2(n243), .QN(n227) );
  NOR2X0 U221 ( .IN1(n242), .IN2(n237), .QN(n226) );
  NAND2X0 U222 ( .IN1(A_mux_sel[0]), .IN2(n222), .QN(n223) );
  NAND2X0 U223 ( .IN1(A_mux_sel[0]), .IN2(n308), .QN(n309) );
  INVX0 U224 ( .INP(n298), .ZN(n299) );
  NOR2X0 U225 ( .IN1(n292), .IN2(n291), .QN(n293) );
  NOR2X0 U226 ( .IN1(n211), .IN2(n212), .QN(n239) );
  INVX0 U227 ( .INP(n201), .ZN(n211) );
  NOR2X0 U228 ( .IN1(n189), .IN2(n188), .QN(n190) );
  NOR2X0 U229 ( .IN1(n183), .IN2(n182), .QN(n189) );
  NOR2X0 U230 ( .IN1(n147), .IN2(n146), .QN(n183) );
  NOR2X0 U231 ( .IN1(n145), .IN2(n144), .QN(n147) );
  INVX0 U232 ( .INP(n141), .ZN(n144) );
  NOR2X0 U233 ( .IN1(n182), .IN2(n179), .QN(n180) );
  NOR2X0 U234 ( .IN1(n119), .IN2(n118), .QN(n120) );
  NOR2X0 U235 ( .IN1(n117), .IN2(n116), .QN(n119) );
  NOR2X0 U236 ( .IN1(n113), .IN2(n117), .QN(n114) );
  NOR2X0 U237 ( .IN1(n290), .IN2(n289), .QN(n300) );
  NOR2X0 U238 ( .IN1(n277), .IN2(n276), .QN(n290) );
  NOR2X0 U239 ( .IN1(n275), .IN2(n274), .QN(n277) );
  INVX0 U240 ( .INP(n273), .ZN(n275) );
  NOR2X0 U241 ( .IN1(n288), .IN2(n291), .QN(n302) );
  NOR2X0 U242 ( .IN1(n249), .IN2(n248), .QN(n288) );
  INVX0 U243 ( .INP(n245), .ZN(n246) );
  NOR2X0 U244 ( .IN1(n242), .IN2(n241), .QN(n249) );
  INVX0 U245 ( .INP(n240), .ZN(n241) );
  NOR2X0 U246 ( .IN1(n238), .IN2(n237), .QN(n240) );
  NOR2X0 U247 ( .IN1(n215), .IN2(n214), .QN(n242) );
  NOR2X0 U248 ( .IN1(n213), .IN2(n212), .QN(n215) );
  NOR2X0 U249 ( .IN1(n67), .IN2(B_reg[13]), .QN(n276) );
  NOR2X0 U253 ( .IN1(n62), .IN2(B_reg[11]), .QN(n245) );
  MUX21X1 U254 ( .IN1(operands_bits_B[0]), .IN2(result_bits_data[0]), .S(
        A_mux_sel[0]), .Q(B_next[0]) );
  XOR2X1 U255 ( .IN1(B_reg[0]), .IN2(result_bits_data[0]), .Q(n73) );
  NAND3X0 U256 ( .IN1(A_mux_sel_0__hfs_netlink_1), .IN2(n321), .IN3(n73), .QN(
        n74) );
  MUX21X1 U257 ( .IN1(operands_bits_B[1]), .IN2(result_bits_data[1]), .S(
        A_mux_sel[0]), .Q(B_next[1]) );
  XOR2X1 U258 ( .IN1(n81), .IN2(n80), .Q(n82) );
  NAND3X0 U259 ( .IN1(A_mux_sel_0__hfs_netlink_1), .IN2(n321), .IN3(n82), .QN(
        n83) );
  MUX21X1 U260 ( .IN1(operands_bits_B[2]), .IN2(result_bits_data[2]), .S(
        A_mux_sel[0]), .Q(B_next[2]) );
  XOR2X1 U261 ( .IN1(n94), .IN2(n115), .Q(n95) );
  NAND3X0 U262 ( .IN1(A_mux_sel_0__hfs_netlink_1), .IN2(n321), .IN3(n95), .QN(
        n96) );
  MUX21X1 U263 ( .IN1(operands_bits_B[3]), .IN2(result_bits_data[3]), .S(
        A_mux_sel[0]), .Q(B_next[3]) );
  XOR2X1 U264 ( .IN1(n105), .IN2(n104), .Q(n106) );
  NAND3X0 U265 ( .IN1(A_mux_sel_0__hfs_netlink_1), .IN2(n321), .IN3(n106), 
        .QN(n107) );
  MUX21X1 U266 ( .IN1(operands_bits_B[4]), .IN2(result_bits_data[4]), .S(
        A_mux_sel[0]), .Q(B_next[4]) );
  XOR2X1 U267 ( .IN1(n181), .IN2(n122), .Q(n123) );
  MUX21X1 U268 ( .IN1(operands_bits_B[5]), .IN2(result_bits_data[5]), .S(
        A_mux_sel[0]), .Q(B_next[5]) );
  XOR2X1 U269 ( .IN1(n133), .IN2(n132), .Q(n134) );
  NAND3X0 U270 ( .IN1(A_mux_sel_0__hfs_netlink_1), .IN2(n321), .IN3(n134), 
        .QN(n135) );
  MUX21X1 U271 ( .IN1(operands_bits_B[6]), .IN2(result_bits_data[6]), .S(
        A_mux_sel[0]), .Q(B_next[6]) );
  XOR2X1 U272 ( .IN1(n150), .IN2(n149), .Q(n151) );
  NAND3X0 U273 ( .IN1(A_mux_sel_0__hfs_netlink_1), .IN2(n321), .IN3(n151), 
        .QN(n152) );
  MUX21X1 U274 ( .IN1(operands_bits_B[7]), .IN2(result_bits_data[7]), .S(
        A_mux_sel[0]), .Q(B_next[7]) );
  NAND3X0 U275 ( .IN1(n158), .IN2(n164), .IN3(n178), .QN(n169) );
  MUX21X1 U276 ( .IN1(n13), .IN2(n178), .S(n160), .Q(n168) );
  NAND4X0 U277 ( .IN1(n162), .IN2(n161), .IN3(n163), .IN4(n160), .QN(n167) );
  NAND4X0 U278 ( .IN1(n169), .IN2(n168), .IN3(n167), .IN4(n166), .QN(n170) );
  MUX21X1 U279 ( .IN1(operands_bits_B[8]), .IN2(result_bits_data[8]), .S(
        A_mux_sel[0]), .Q(B_next[8]) );
  XOR2X1 U280 ( .IN1(n294), .IN2(n193), .Q(n194) );
  NAND3X0 U281 ( .IN1(A_mux_sel_0__hfs_netlink_1), .IN2(n321), .IN3(n194), 
        .QN(n196) );
  MUX21X1 U282 ( .IN1(operands_bits_B[9]), .IN2(result_bits_data[9]), .S(
        A_mux_sel[0]), .Q(B_next[9]) );
  OR2X1 U283 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[9]), .Q(n200) );
  NAND3X0 U284 ( .IN1(n200), .IN2(n322), .IN3(n199), .QN(n207) );
  XOR2X1 U285 ( .IN1(n204), .IN2(n203), .Q(n205) );
  MUX21X1 U286 ( .IN1(operands_bits_B[10]), .IN2(result_bits_data[10]), .S(
        A_mux_sel[0]), .Q(B_next[10]) );
  OR2X1 U287 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[10]), .Q(n210) );
  NAND3X0 U288 ( .IN1(n210), .IN2(n322), .IN3(n209), .QN(n221) );
  XOR2X1 U289 ( .IN1(n218), .IN2(n217), .Q(n219) );
  MUX21X1 U290 ( .IN1(operands_bits_B[11]), .IN2(result_bits_data[11]), .S(
        A_mux_sel[0]), .Q(B_next[11]) );
  OR2X1 U291 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[11]), .Q(n224) );
  NAND3X0 U292 ( .IN1(n224), .IN2(n322), .IN3(n223), .QN(n233) );
  NAND3X0 U293 ( .IN1(n294), .IN2(n239), .IN3(n225), .QN(n228) );
  XOR2X1 U294 ( .IN1(n230), .IN2(n229), .Q(n231) );
  MUX21X1 U295 ( .IN1(operands_bits_B[12]), .IN2(result_bits_data[12]), .S(
        A_mux_sel[0]), .Q(B_next[12]) );
  OR2X1 U296 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[12]), .Q(n236) );
  NAND3X0 U297 ( .IN1(n236), .IN2(n322), .IN3(n235), .QN(n255) );
  XOR2X1 U298 ( .IN1(n252), .IN2(n251), .Q(n253) );
  MUX21X1 U299 ( .IN1(operands_bits_B[13]), .IN2(result_bits_data[13]), .S(
        A_mux_sel[0]), .Q(B_next[13]) );
  OR2X1 U300 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[13]), .Q(n258) );
  NAND3X0 U301 ( .IN1(n258), .IN2(n322), .IN3(n257), .QN(n268) );
  XOR2X1 U302 ( .IN1(n265), .IN2(n264), .Q(n266) );
  MUX21X1 U303 ( .IN1(operands_bits_B[14]), .IN2(result_bits_data[14]), .S(
        A_mux_sel[0]), .Q(B_next[14]) );
  OR2X1 U304 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[14]), .Q(n271) );
  NAND3X0 U305 ( .IN1(n271), .IN2(n322), .IN3(n270), .QN(n285) );
  NAND3X0 U306 ( .IN1(n294), .IN2(n272), .IN3(n287), .QN(n280) );
  NAND3X0 U307 ( .IN1(n280), .IN2(n290), .IN3(n279), .QN(n282) );
  XOR2X1 U308 ( .IN1(n282), .IN2(n281), .Q(n283) );
  MUX21X1 U309 ( .IN1(operands_bits_B[15]), .IN2(result_bits_data[15]), .S(
        A_mux_sel[0]), .Q(B_next[15]) );
  NOR3X0 U310 ( .IN1(n302), .IN2(n301), .IN3(n300), .QN(n297) );
  AO21X1 U311 ( .IN1(n297), .IN2(n303), .IN3(n298), .Q(n306) );
  NOR4X0 U312 ( .IN1(n302), .IN2(n301), .IN3(n300), .IN4(n299), .QN(n304) );
  NAND3X0 U313 ( .IN1(n307), .IN2(n306), .IN3(n305), .QN(n313) );
  OR2X1 U314 ( .IN1(A_mux_sel[0]), .IN2(operands_bits_A[15]), .Q(n311) );
  NAND3X0 U315 ( .IN1(n311), .IN2(n322), .IN3(n309), .QN(n312) );
  NOR4X0 U317 ( .IN1(B_reg[0]), .IN2(B_reg[4]), .IN3(B_reg[6]), .IN4(B_reg[7]), 
        .QN(n317) );
  NOR4X0 U318 ( .IN1(B_reg[1]), .IN2(B_reg[2]), .IN3(B_reg[3]), .IN4(B_reg[5]), 
        .QN(n316) );
  NOR4X0 U319 ( .IN1(B_reg[10]), .IN2(B_reg[8]), .IN3(B_reg[9]), .IN4(
        B_reg[11]), .QN(n315) );
  NOR4X0 U320 ( .IN1(B_reg[15]), .IN2(B_reg[14]), .IN3(B_reg[13]), .IN4(
        B_reg[12]), .QN(n314) );
  AND4X1 U321 ( .IN1(n317), .IN2(n316), .IN3(n315), .IN4(n314), .Q(B_zero) );
  INVX4 U62 ( .INP(n321), .ZN(n322) );
  INVX1 U106 ( .INP(reset), .ZN(n319) );
  NOR2X1 U250 ( .IN1(n66), .IN2(B_reg[12]), .QN(n273) );
  NOR2X1 U251 ( .IN1(n65), .IN2(B_reg[14]), .QN(n301) );
  NOR2X2 U86 ( .IN1(n198), .IN2(result_bits_data[9]), .QN(n212) );
  NOR2X1 U97 ( .IN1(n269), .IN2(result_bits_data[14]), .QN(n289) );
  INVX1 U103 ( .INP(n237), .ZN(n225) );
  NOR2X2 U95 ( .IN1(n260), .IN2(n274), .QN(n287) );
  INVX1 U81 ( .INP(n212), .ZN(n54) );
  NAND2X1 U30 ( .IN1(n287), .IN2(n244), .QN(n28) );
  NAND2X1 U11 ( .IN1(n13), .IN2(n12), .QN(n10) );
  NAND2X0 U155 ( .IN1(n247), .IN2(n246), .QN(n248) );
  NOR2X1 U47 ( .IN1(n61), .IN2(n48), .QN(n47) );
  NAND2X1 U14 ( .IN1(n41), .IN2(n39), .QN(n14) );
  INVX1 U8 ( .INP(n18), .ZN(n7) );
  NAND2X2 U6 ( .IN1(n7), .IN2(n6), .QN(n5) );
  NAND2X2 U5 ( .IN1(n15), .IN2(n8), .QN(n4) );
  NOR2X2 U3 ( .IN1(n4), .IN2(n3), .QN(n2) );
  NBUFFX2 U102 ( .INP(A_mux_sel[1]), .Z(n321) );
  NOR2X2 U98 ( .IN1(n58), .IN2(B_reg[6]), .QN(n184) );
  NOR2X1 U252 ( .IN1(n63), .IN2(B_reg[10]), .QN(n243) );
  NAND2X0 U154 ( .IN1(n91), .IN2(n90), .QN(n93) );
  INVX1 U101 ( .INP(n238), .ZN(n244) );
  INVX0 U96 ( .INP(n289), .ZN(n286) );
  NOR2X0 U25 ( .IN1(n35), .IN2(n274), .QN(n24) );
  NAND2X2 U60 ( .IN1(n54), .IN2(n225), .QN(n61) );
  NOR2X1 U10 ( .IN1(n38), .IN2(n10), .QN(n9) );
  NAND2X1 U16 ( .IN1(n27), .IN2(n30), .QN(n16) );
  NOR2X0 U39 ( .IN1(n40), .IN2(n117), .QN(n39) );
  INVX1 U46 ( .INP(n47), .ZN(n46) );
  NOR2X4 U104 ( .IN1(n322), .IN2(A_mux_sel[0]), .QN(n307) );
  NAND2X1 U130 ( .IN1(n307), .IN2(n283), .QN(n284) );
  NAND2X0 U129 ( .IN1(n285), .IN2(n284), .QN(A_next[14]) );
  NAND2X0 U73 ( .IN1(n140), .IN2(n139), .QN(n153) );
  NAND2X0 U69 ( .IN1(n79), .IN2(n78), .QN(n84) );
  NAND2X0 U65 ( .IN1(n112), .IN2(n111), .QN(n126) );
  NAND2X0 U70 ( .IN1(n84), .IN2(n83), .QN(A_next[1]) );
  NAND2X0 U66 ( .IN1(n126), .IN2(n125), .QN(A_next[4]) );
  AND2X1 U322 ( .IN1(n141), .IN2(n178), .Q(n27) );
  AND2X1 U323 ( .IN1(n161), .IN2(n186), .Q(n26) );
  NAND2X2 U324 ( .IN1(B_reg[0]), .IN2(n50), .QN(n91) );
endmodule


module gcdGCDUnitCtrl ( clk, reset, operands_val, result_rdy, B_zero, A_lt_B, 
        result_val, operands_rdy, A_mux_sel, B_mux_sel, A_en, B_en, 
        A_mux_sel_0__hfs_netlink_0 );
  output [1:0] A_mux_sel;
  input clk, reset, operands_val, result_rdy, B_zero, A_lt_B,
         A_mux_sel_0__hfs_netlink_0;
  output result_val, operands_rdy, B_mux_sel, A_en, B_en;
  wire   n13, n14, n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n15, n16,
         n17, n18, n19;
  wire   [1:0] state;

  DFFX1 state_reg_0_ ( .D(n14), .CLK(clk), .Q(state[0]), .QN(n1) );
  DFFX1 state_reg_1_ ( .D(n13), .CLK(clk), .Q(state[1]), .QN(n15) );
  NAND2X0 U3 ( .IN1(B_zero), .IN2(n15), .QN(n18) );
  NAND2X1 U4 ( .IN1(n1), .IN2(n15), .QN(n7) );
  NAND2X1 U6 ( .IN1(n12), .IN2(n11), .QN(n13) );
  NAND2X1 U7 ( .IN1(A_mux_sel_0__hfs_netlink_0), .IN2(n2), .QN(B_en) );
  NAND2X1 U8 ( .IN1(operands_rdy), .IN2(operands_val), .QN(n2) );
  NOR2X0 U10 ( .IN1(A_lt_B), .IN2(n5), .QN(A_mux_sel[1]) );
  NOR2X0 U11 ( .IN1(n15), .IN2(operands_val), .QN(n10) );
  INVX0 U12 ( .INP(n6), .ZN(result_val) );
  NAND2X0 U13 ( .IN1(state[0]), .IN2(state[1]), .QN(n6) );
  INVX0 U14 ( .INP(n7), .ZN(n8) );
  NOR2X0 U15 ( .IN1(n19), .IN2(reset), .QN(n14) );
  OA21X1 U16 ( .IN1(n18), .IN2(A_lt_B), .IN3(n17), .Q(n19) );
  NAND2X0 U17 ( .IN1(n16), .IN2(state[0]), .QN(n17) );
  NAND2X0 U18 ( .IN1(state[1]), .IN2(result_rdy), .QN(n16) );
  NOR2X0 U19 ( .IN1(n15), .IN2(state[0]), .QN(operands_rdy) );
  INVX0 U21 ( .INP(n4), .ZN(n5) );
  NOR2X0 U22 ( .IN1(B_zero), .IN2(n7), .QN(n4) );
  OR2X1 U23 ( .IN1(B_en), .IN2(n4), .Q(A_en) );
  NAND3X0 U24 ( .IN1(n9), .IN2(n8), .IN3(B_zero), .QN(n12) );
  NOR3X0 U25 ( .IN1(result_val), .IN2(n10), .IN3(reset), .QN(n11) );
  NOR2X2 U9 ( .IN1(n9), .IN2(n7), .QN(A_mux_sel[0]) );
  INVX2 U5 ( .INP(A_lt_B), .ZN(n9) );
endmodule


module gcdGCDUnit_rtl ( clk, reset, operands_bits_A, operands_bits_B, 
        operands_val, operands_rdy, result_bits_data, result_val, result_rdy
 );
  input [15:0] operands_bits_A;
  input [15:0] operands_bits_B;
  output [15:0] result_bits_data;
  input clk, reset, operands_val, result_rdy;
  output operands_rdy, result_val;
  wire   A_en, B_en, B_zero, A_lt_B, n2, n3, n4, n5;

  gcdGCDUnitDpath_W16 GCDdpath0 ( .operands_bits_A(operands_bits_A), 
        .operands_bits_B(operands_bits_B), .result_bits_data(result_bits_data), 
        .clk(clk), .reset(reset), .B_mux_sel(n3), .A_en(A_en), .B_en(B_en), 
        .A_mux_sel({n2, n4}), .B_zero(B_zero), .A_lt_B(A_lt_B), 
        .A_mux_sel_0__hfs_netlink_1(n5) );
  gcdGCDUnitCtrl GCDctrl0 ( .clk(clk), .reset(reset), .operands_val(
        operands_val), .result_rdy(result_rdy), .B_zero(B_zero), .A_lt_B(
        A_lt_B), .result_val(result_val), .operands_rdy(operands_rdy), 
        .A_mux_sel({n2, n3}), .A_en(A_en), .B_en(B_en), 
        .A_mux_sel_0__hfs_netlink_0(n5) );
  INVX2 U1 ( .INP(n4), .ZN(n5) );
  NBUFFX16 U2 ( .INP(n3), .Z(n4) );
endmodule

