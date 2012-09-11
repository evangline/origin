
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
        result_bits_data, clk, reset, B_mux_sel, A_en, B_en, B_zero, A_lt_B, 
        A_mux_sel_1_, A_mux_sel_0__BAR );
  input [15:0] operands_bits_A;
  input [15:0] operands_bits_B;
  output [15:0] result_bits_data;
  input clk, reset, B_mux_sel, A_en, B_en, A_mux_sel_1_, A_mux_sel_0__BAR;
  output B_zero, A_lt_B;
  wire   net163, net169, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n13, n14,
         n15, n18, n19, n20, n21, n22, n23, n24, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n319, n321, n323;
  wire   [15:0] A_next;
  wire   [15:0] B_reg;
  wire   [15:0] B_next;

  SNPS_CLOCK_GATE_HIGH_gcdGCDUnitDpath_W16_0 clk_gate_B_reg_reg ( .CLK(clk), 
        .EN(B_en), .ENCLK(net163), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_gcdGCDUnitDpath_W16_1 clk_gate_A_reg_reg ( .CLK(clk), 
        .EN(A_en), .ENCLK(net169), .TE(1'b0) );
  DFFARX1 A_reg_reg_2_ ( .D(A_next[2]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[2]) );
  DFFARX1 B_reg_reg_15_ ( .D(B_next[15]), .CLK(net163), .RSTB(n321), .Q(
        B_reg[15]), .QN(n299) );
  DFFARX1 B_reg_reg_14_ ( .D(B_next[14]), .CLK(net163), .RSTB(n321), .Q(
        B_reg[14]), .QN(n260) );
  DFFARX1 B_reg_reg_13_ ( .D(B_next[13]), .CLK(net163), .RSTB(n321), .Q(
        B_reg[13]), .QN(n247) );
  DFFARX1 B_reg_reg_12_ ( .D(B_next[12]), .CLK(net163), .RSTB(n321), .Q(
        B_reg[12]), .QN(n225) );
  DFFARX1 B_reg_reg_11_ ( .D(B_next[11]), .CLK(net163), .RSTB(n321), .Q(
        B_reg[11]), .QN(n213) );
  DFFARX1 B_reg_reg_10_ ( .D(B_next[10]), .CLK(net163), .RSTB(n321), .Q(
        B_reg[10]), .QN(n199) );
  DFFARX1 B_reg_reg_9_ ( .D(B_next[9]), .CLK(net163), .RSTB(n321), .Q(B_reg[9]), .QN(n189) );
  DFFARX1 B_reg_reg_8_ ( .D(B_next[8]), .CLK(net163), .RSTB(n321), .Q(B_reg[8]), .QN(n166) );
  DFFARX1 B_reg_reg_7_ ( .D(B_next[7]), .CLK(net163), .RSTB(n321), .Q(B_reg[7]), .QN(n146) );
  DFFARX1 B_reg_reg_6_ ( .D(B_next[6]), .CLK(net163), .RSTB(n321), .Q(B_reg[6]), .QN(n129) );
  DFFARX1 B_reg_reg_5_ ( .D(B_next[5]), .CLK(net163), .RSTB(n321), .Q(B_reg[5]), .QN(n119) );
  DFFARX1 B_reg_reg_4_ ( .D(B_next[4]), .CLK(net163), .RSTB(n321), .Q(B_reg[4]), .QN(n101) );
  DFFARX1 B_reg_reg_3_ ( .D(B_next[3]), .CLK(net163), .RSTB(n321), .Q(B_reg[3]), .QN(n90) );
  DFFARX1 B_reg_reg_2_ ( .D(B_next[2]), .CLK(net163), .RSTB(n321), .Q(B_reg[2]), .QN(n77) );
  DFFARX1 B_reg_reg_1_ ( .D(B_next[1]), .CLK(net163), .RSTB(n321), .Q(B_reg[1]), .QN(n68) );
  DFFARX1 B_reg_reg_0_ ( .D(B_next[0]), .CLK(net163), .RSTB(n321), .Q(B_reg[0]), .QN(n61) );
  DFFARX1 A_reg_reg_8_ ( .D(A_next[8]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[8]), .QN(n32) );
  DFFARX1 A_reg_reg_6_ ( .D(A_next[6]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[6]), .QN(n37) );
  DFFARX1 A_reg_reg_5_ ( .D(A_next[5]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[5]), .QN(n38) );
  DFFARX1 A_reg_reg_3_ ( .D(A_next[3]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[3]), .QN(n31) );
  DFFARX1 A_reg_reg_1_ ( .D(A_next[1]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[1]), .QN(n30) );
  DFFARX1 A_reg_reg_0_ ( .D(A_next[0]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[0]), .QN(n29) );
  DFFARX1 A_reg_reg_7_ ( .D(A_next[7]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[7]), .QN(n34) );
  DFFARX1 A_reg_reg_4_ ( .D(A_next[4]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[4]), .QN(n18) );
  DFFARX1 A_reg_reg_14_ ( .D(A_next[14]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[14]), .QN(n48) );
  DFFARX1 A_reg_reg_13_ ( .D(A_next[13]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[13]), .QN(n51) );
  DFFARX1 A_reg_reg_12_ ( .D(A_next[12]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[12]), .QN(n19) );
  DFFARX1 A_reg_reg_11_ ( .D(A_next[11]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[11]), .QN(n42) );
  DFFARX1 A_reg_reg_10_ ( .D(A_next[10]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[10]), .QN(n43) );
  DFFARX1 A_reg_reg_9_ ( .D(A_next[9]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[9]), .QN(n22) );
  DFFARX1 A_reg_reg_15_ ( .D(A_next[15]), .CLK(net169), .RSTB(n321), .Q(
        result_bits_data[15]), .QN(n33) );
  INVX0 U4 ( .INP(n35), .ZN(n137) );
  NAND2X1 U6 ( .IN1(n119), .IN2(result_bits_data[5]), .QN(n35) );
  INVX0 U7 ( .INP(n175), .ZN(n2) );
  INVX1 U9 ( .INP(n229), .ZN(n235) );
  NOR4X0 U12 ( .IN1(n5), .IN2(n46), .IN3(n12), .IN4(n41), .QN(n9) );
  NAND4X0 U13 ( .IN1(n235), .IN2(n10), .IN3(n192), .IN4(n6), .QN(n5) );
  NAND3X0 U14 ( .IN1(n13), .IN2(n9), .IN3(n7), .QN(n40) );
  NAND3X0 U15 ( .IN1(n8), .IN2(n177), .IN3(n152), .QN(n7) );
  INVX0 U16 ( .INP(n175), .ZN(n152) );
  NAND3X0 U17 ( .IN1(n39), .IN2(n132), .IN3(n169), .QN(n8) );
  INVX0 U20 ( .INP(n176), .ZN(n12) );
  NAND2X2 U21 ( .IN1(n15), .IN2(n14), .QN(n13) );
  INVX0 U26 ( .INP(n24), .ZN(n203) );
  INVX0 U29 ( .INP(n216), .ZN(n228) );
  NAND2X1 U32 ( .IN1(n166), .IN2(result_bits_data[8]), .QN(n204) );
  NAND2X1 U36 ( .IN1(n24), .IN2(n216), .QN(n41) );
  NAND2X1 U37 ( .IN1(B_reg[10]), .IN2(n43), .QN(n216) );
  NAND2X1 U45 ( .IN1(n30), .IN2(B_reg[1]), .QN(n81) );
  NOR2X0 U47 ( .IN1(n165), .IN2(A_mux_sel_1_), .QN(n168) );
  NOR2X0 U48 ( .IN1(n67), .IN2(A_mux_sel_1_), .QN(n70) );
  NOR2X0 U49 ( .IN1(n118), .IN2(A_mux_sel_1_), .QN(n121) );
  NOR2X0 U51 ( .IN1(n60), .IN2(A_mux_sel_1_), .QN(n63) );
  NOR2X0 U52 ( .IN1(n76), .IN2(A_mux_sel_1_), .QN(n79) );
  NOR2X0 U53 ( .IN1(n89), .IN2(A_mux_sel_1_), .QN(n92) );
  INVX0 U54 ( .INP(n133), .ZN(n36) );
  NOR2X2 U55 ( .IN1(n225), .IN2(result_bits_data[12]), .QN(n251) );
  NAND2X0 U57 ( .IN1(n148), .IN2(n147), .QN(n164) );
  INVX1 U76 ( .INP(n82), .ZN(n71) );
  NOR2X2 U77 ( .IN1(n77), .IN2(result_bits_data[2]), .QN(n104) );
  NAND2X2 U78 ( .IN1(n29), .IN2(B_reg[0]), .QN(n82) );
  NAND2X0 U79 ( .IN1(n287), .IN2(n286), .QN(n289) );
  NAND2X0 U80 ( .IN1(n176), .IN2(n175), .QN(n178) );
  NAND2X0 U81 ( .IN1(n235), .IN2(n234), .QN(n238) );
  NAND2X0 U85 ( .IN1(n106), .IN2(n93), .QN(n94) );
  NOR2X2 U87 ( .IN1(n323), .IN2(n319), .QN(n298) );
  NAND2X0 U88 ( .IN1(n269), .IN2(n278), .QN(n270) );
  NAND2X0 U90 ( .IN1(n278), .IN2(n277), .QN(n282) );
  NOR2X2 U91 ( .IN1(n59), .IN2(n58), .QN(A_lt_B) );
  NAND2X0 U94 ( .IN1(n162), .IN2(A_mux_sel_1_), .QN(n163) );
  NAND2X0 U95 ( .IN1(n156), .IN2(n155), .QN(n157) );
  NAND2X0 U96 ( .IN1(n150), .IN2(n169), .QN(n154) );
  NAND2X0 U97 ( .IN1(n177), .IN2(n176), .QN(n151) );
  NAND2X0 U98 ( .IN1(n115), .IN2(A_mux_sel_1_), .QN(n116) );
  NAND2X0 U100 ( .IN1(n83), .IN2(n81), .QN(n72) );
  NAND2X0 U101 ( .IN1(n122), .IN2(n136), .QN(n124) );
  NAND2X0 U102 ( .IN1(n172), .IN2(n133), .QN(n122) );
  NAND2X0 U103 ( .IN1(n153), .IN2(n174), .QN(n141) );
  NAND2X0 U104 ( .IN1(n172), .IN2(n134), .QN(n153) );
  NAND2X0 U107 ( .IN1(n298), .IN2(n244), .QN(n245) );
  NAND2X0 U108 ( .IN1(n241), .IN2(n279), .QN(n243) );
  NAND2X0 U109 ( .IN1(n285), .IN2(n263), .QN(n241) );
  NAND2X0 U110 ( .IN1(n259), .IN2(n258), .QN(A_next[13]) );
  NAND2X0 U111 ( .IN1(n298), .IN2(n257), .QN(n258) );
  NAND2X0 U112 ( .IN1(n254), .IN2(n253), .QN(n256) );
  NAND2X0 U113 ( .IN1(n285), .IN2(n252), .QN(n253) );
  NAND2X0 U114 ( .IN1(n276), .IN2(n275), .QN(A_next[14]) );
  NAND2X0 U115 ( .IN1(n298), .IN2(n274), .QN(n275) );
  NAND2X0 U117 ( .IN1(n298), .IN2(n196), .QN(n197) );
  NAND2X0 U118 ( .IN1(n193), .IN2(n204), .QN(n195) );
  NAND2X0 U119 ( .IN1(n285), .IN2(n192), .QN(n193) );
  NAND2X0 U121 ( .IN1(n298), .IN2(n210), .QN(n211) );
  NAND2X0 U122 ( .IN1(n207), .IN2(n233), .QN(n209) );
  NAND2X0 U123 ( .IN1(n285), .IN2(n230), .QN(n207) );
  NAND2X0 U124 ( .IN1(n224), .IN2(n223), .QN(A_next[11]) );
  NAND2X0 U125 ( .IN1(n298), .IN2(n222), .QN(n223) );
  NAND2X0 U126 ( .IN1(n219), .IN2(n218), .QN(n221) );
  NAND2X0 U127 ( .IN1(n304), .IN2(n303), .QN(A_next[15]) );
  NAND2X0 U128 ( .IN1(n295), .IN2(n294), .QN(n296) );
  NAND2X0 U129 ( .IN1(n285), .IN2(n284), .QN(n294) );
  NAND2X0 U130 ( .IN1(n230), .IN2(n231), .QN(n283) );
  NAND2X0 U132 ( .IN1(n178), .IN2(n177), .QN(n179) );
  NAND2X0 U134 ( .IN1(n133), .IN2(n132), .QN(n170) );
  NAND2X0 U135 ( .IN1(n176), .IN2(n169), .QN(n173) );
  NAND2X1 U136 ( .IN1(n112), .IN2(n111), .QN(n172) );
  NAND2X1 U139 ( .IN1(n82), .IN2(n81), .QN(n84) );
  NAND2X0 U140 ( .IN1(n238), .IN2(n237), .QN(n239) );
  NAND3X0 U141 ( .IN1(n57), .IN2(n56), .IN3(n55), .QN(n58) );
  NAND2X0 U145 ( .IN1(n299), .IN2(result_bits_data[15]), .QN(n287) );
  NAND2X1 U153 ( .IN1(n146), .IN2(result_bits_data[7]), .QN(n177) );
  NAND2X1 U154 ( .IN1(n101), .IN2(result_bits_data[4]), .QN(n136) );
  NAND2X1 U155 ( .IN1(n77), .IN2(result_bits_data[2]), .QN(n107) );
  NOR2X0 U157 ( .IN1(n319), .IN2(n161), .QN(n162) );
  INVX0 U158 ( .INP(n154), .ZN(n156) );
  INVX0 U159 ( .INP(n174), .ZN(n150) );
  INVX0 U160 ( .INP(n151), .ZN(n155) );
  INVX0 U161 ( .INP(n153), .ZN(n149) );
  NAND2X0 U162 ( .IN1(n319), .IN2(n146), .QN(n147) );
  NOR2X0 U163 ( .IN1(n145), .IN2(A_mux_sel_1_), .QN(n148) );
  NOR2X0 U164 ( .IN1(n319), .IN2(operands_bits_A[7]), .QN(n145) );
  NOR2X0 U165 ( .IN1(n319), .IN2(n114), .QN(n115) );
  NAND2X0 U166 ( .IN1(n319), .IN2(n101), .QN(n102) );
  NOR2X0 U167 ( .IN1(n100), .IN2(A_mux_sel_1_), .QN(n103) );
  NOR2X0 U168 ( .IN1(n319), .IN2(operands_bits_A[4]), .QN(n100) );
  NOR2X0 U169 ( .IN1(n183), .IN2(n202), .QN(n184) );
  INVX0 U170 ( .INP(n204), .ZN(n183) );
  NAND2X0 U171 ( .IN1(n319), .IN2(n166), .QN(n167) );
  NOR2X0 U172 ( .IN1(n319), .IN2(operands_bits_A[8]), .QN(n165) );
  NAND2X0 U173 ( .IN1(n319), .IN2(n68), .QN(n69) );
  NOR2X0 U174 ( .IN1(n319), .IN2(operands_bits_A[1]), .QN(n67) );
  NOR2X0 U175 ( .IN1(n135), .IN2(n137), .QN(n123) );
  NAND2X0 U176 ( .IN1(n319), .IN2(n119), .QN(n120) );
  NOR2X0 U177 ( .IN1(n319), .IN2(operands_bits_A[5]), .QN(n118) );
  NOR2X0 U178 ( .IN1(n139), .IN2(n175), .QN(n140) );
  INVX0 U179 ( .INP(n169), .ZN(n139) );
  INVX0 U180 ( .INP(n170), .ZN(n134) );
  NAND2X0 U181 ( .IN1(n319), .IN2(n129), .QN(n130) );
  NOR2X0 U182 ( .IN1(n319), .IN2(operands_bits_A[6]), .QN(n128) );
  NAND2X0 U183 ( .IN1(n319), .IN2(n61), .QN(n62) );
  NOR2X0 U184 ( .IN1(n319), .IN2(operands_bits_A[0]), .QN(n60) );
  NOR2X0 U185 ( .IN1(n80), .IN2(n104), .QN(n85) );
  NAND2X0 U186 ( .IN1(n319), .IN2(n77), .QN(n78) );
  NOR2X0 U187 ( .IN1(n319), .IN2(operands_bits_A[2]), .QN(n76) );
  NOR2X0 U188 ( .IN1(n108), .IN2(n109), .QN(n95) );
  NAND2X0 U189 ( .IN1(n319), .IN2(n90), .QN(n91) );
  NOR2X0 U190 ( .IN1(n319), .IN2(operands_bits_A[3]), .QN(n89) );
  NOR2X0 U191 ( .IN1(n264), .IN2(n251), .QN(n242) );
  NAND2X0 U192 ( .IN1(n319), .IN2(n225), .QN(n226) );
  NOR2X0 U193 ( .IN1(n267), .IN2(n265), .QN(n255) );
  NOR2X0 U194 ( .IN1(n283), .IN2(n251), .QN(n252) );
  NOR2X0 U195 ( .IN1(n250), .IN2(n264), .QN(n254) );
  NOR2X0 U196 ( .IN1(n279), .IN2(n251), .QN(n250) );
  NAND2X0 U197 ( .IN1(n319), .IN2(n247), .QN(n248) );
  NOR2X0 U198 ( .IN1(n292), .IN2(n280), .QN(n272) );
  INVX0 U199 ( .INP(n279), .ZN(n269) );
  INVX0 U200 ( .INP(n283), .ZN(n263) );
  NAND2X0 U201 ( .IN1(n319), .IN2(n260), .QN(n261) );
  NOR2X0 U202 ( .IN1(n203), .IN2(n205), .QN(n194) );
  NAND2X0 U203 ( .IN1(n319), .IN2(n189), .QN(n190) );
  NOR2X0 U204 ( .IN1(n228), .IN2(n234), .QN(n208) );
  NAND2X0 U205 ( .IN1(n319), .IN2(n199), .QN(n200) );
  NOR2X0 U206 ( .IN1(n236), .IN2(n229), .QN(n220) );
  NOR2X0 U207 ( .IN1(n217), .IN2(n234), .QN(n218) );
  NOR2X0 U208 ( .IN1(n233), .IN2(n228), .QN(n217) );
  NAND2X0 U209 ( .IN1(n319), .IN2(n213), .QN(n214) );
  NAND2X0 U210 ( .IN1(n319), .IN2(n299), .QN(n300) );
  INVX0 U211 ( .INP(n289), .ZN(n290) );
  NOR2X0 U212 ( .IN1(n283), .IN2(n282), .QN(n284) );
  NOR2X0 U213 ( .IN1(n202), .IN2(n203), .QN(n230) );
  INVX0 U214 ( .INP(n192), .ZN(n202) );
  NOR2X0 U215 ( .IN1(n180), .IN2(n179), .QN(n181) );
  NOR2X0 U216 ( .IN1(n174), .IN2(n173), .QN(n180) );
  NOR2X0 U217 ( .IN1(n138), .IN2(n137), .QN(n174) );
  NOR2X0 U218 ( .IN1(n136), .IN2(n135), .QN(n138) );
  INVX0 U219 ( .INP(n132), .ZN(n135) );
  NOR2X0 U220 ( .IN1(n173), .IN2(n170), .QN(n171) );
  NOR2X0 U221 ( .IN1(n110), .IN2(n109), .QN(n111) );
  NOR2X0 U222 ( .IN1(n108), .IN2(n107), .QN(n110) );
  NOR2X0 U223 ( .IN1(n104), .IN2(n108), .QN(n105) );
  NOR2X0 U224 ( .IN1(n281), .IN2(n280), .QN(n291) );
  NOR2X0 U225 ( .IN1(n268), .IN2(n267), .QN(n281) );
  NOR2X0 U226 ( .IN1(n266), .IN2(n265), .QN(n268) );
  INVX0 U227 ( .INP(n264), .ZN(n266) );
  NOR2X0 U228 ( .IN1(n279), .IN2(n282), .QN(n293) );
  NOR2X0 U229 ( .IN1(n240), .IN2(n239), .QN(n279) );
  INVX0 U230 ( .INP(n236), .ZN(n237) );
  NOR2X0 U231 ( .IN1(n233), .IN2(n232), .QN(n240) );
  INVX0 U232 ( .INP(n231), .ZN(n232) );
  NOR2X0 U233 ( .IN1(n229), .IN2(n228), .QN(n231) );
  NOR2X0 U234 ( .IN1(n206), .IN2(n205), .QN(n233) );
  NOR2X0 U235 ( .IN1(n204), .IN2(n203), .QN(n206) );
  NOR2X0 U236 ( .IN1(n52), .IN2(n265), .QN(n54) );
  NOR2X0 U237 ( .IN1(n264), .IN2(n267), .QN(n52) );
  NOR2X0 U238 ( .IN1(n51), .IN2(B_reg[13]), .QN(n267) );
  INVX0 U239 ( .INP(n292), .ZN(n49) );
  NOR2X0 U241 ( .IN1(n236), .IN2(n234), .QN(n44) );
  NOR2X0 U242 ( .IN1(n43), .IN2(B_reg[10]), .QN(n234) );
  NOR2X0 U243 ( .IN1(n42), .IN2(B_reg[11]), .QN(n236) );
  NAND4X0 U244 ( .IN1(n47), .IN2(n278), .IN3(n53), .IN4(n235), .QN(n57) );
  MUX21X1 U245 ( .IN1(operands_bits_B[0]), .IN2(result_bits_data[0]), .S(n319), 
        .Q(B_next[0]) );
  XOR2X1 U246 ( .IN1(B_reg[0]), .IN2(result_bits_data[0]), .Q(n64) );
  NAND3X0 U247 ( .IN1(A_mux_sel_0__BAR), .IN2(A_mux_sel_1_), .IN3(n64), .QN(
        n65) );
  MUX21X1 U248 ( .IN1(operands_bits_B[1]), .IN2(result_bits_data[1]), .S(n319), 
        .Q(B_next[1]) );
  XOR2X1 U249 ( .IN1(n72), .IN2(n71), .Q(n73) );
  NAND3X0 U250 ( .IN1(A_mux_sel_0__BAR), .IN2(A_mux_sel_1_), .IN3(n73), .QN(
        n74) );
  MUX21X1 U251 ( .IN1(operands_bits_B[2]), .IN2(result_bits_data[2]), .S(n319), 
        .Q(B_next[2]) );
  XOR2X1 U252 ( .IN1(n85), .IN2(n106), .Q(n86) );
  NAND3X0 U253 ( .IN1(A_mux_sel_0__BAR), .IN2(A_mux_sel_1_), .IN3(n86), .QN(
        n87) );
  MUX21X1 U254 ( .IN1(operands_bits_B[3]), .IN2(result_bits_data[3]), .S(n319), 
        .Q(B_next[3]) );
  XOR2X1 U255 ( .IN1(n96), .IN2(n95), .Q(n97) );
  NAND3X0 U256 ( .IN1(A_mux_sel_0__BAR), .IN2(A_mux_sel_1_), .IN3(n97), .QN(
        n98) );
  MUX21X1 U257 ( .IN1(operands_bits_B[4]), .IN2(result_bits_data[4]), .S(n319), 
        .Q(B_next[4]) );
  XOR2X1 U258 ( .IN1(n172), .IN2(n113), .Q(n114) );
  MUX21X1 U259 ( .IN1(operands_bits_B[5]), .IN2(result_bits_data[5]), .S(n319), 
        .Q(B_next[5]) );
  XOR2X1 U260 ( .IN1(n124), .IN2(n123), .Q(n125) );
  NAND3X0 U261 ( .IN1(A_mux_sel_0__BAR), .IN2(A_mux_sel_1_), .IN3(n125), .QN(
        n126) );
  MUX21X1 U262 ( .IN1(operands_bits_B[6]), .IN2(result_bits_data[6]), .S(n319), 
        .Q(B_next[6]) );
  XOR2X1 U263 ( .IN1(n141), .IN2(n140), .Q(n142) );
  NAND3X0 U264 ( .IN1(A_mux_sel_0__BAR), .IN2(A_mux_sel_1_), .IN3(n142), .QN(
        n143) );
  MUX21X1 U265 ( .IN1(operands_bits_B[7]), .IN2(result_bits_data[7]), .S(n319), 
        .Q(B_next[7]) );
  NAND3X0 U266 ( .IN1(n149), .IN2(n155), .IN3(n169), .QN(n160) );
  MUX21X1 U267 ( .IN1(n152), .IN2(n169), .S(n151), .Q(n159) );
  NAND4X0 U268 ( .IN1(n153), .IN2(n152), .IN3(n154), .IN4(n151), .QN(n158) );
  NAND4X0 U269 ( .IN1(n160), .IN2(n159), .IN3(n158), .IN4(n157), .QN(n161) );
  MUX21X1 U270 ( .IN1(operands_bits_B[8]), .IN2(result_bits_data[8]), .S(n319), 
        .Q(B_next[8]) );
  XOR2X1 U271 ( .IN1(n285), .IN2(n184), .Q(n185) );
  NAND3X0 U272 ( .IN1(A_mux_sel_0__BAR), .IN2(A_mux_sel_1_), .IN3(n185), .QN(
        n187) );
  MUX21X1 U273 ( .IN1(operands_bits_B[9]), .IN2(result_bits_data[9]), .S(n319), 
        .Q(B_next[9]) );
  OR2X1 U274 ( .IN1(n319), .IN2(operands_bits_A[9]), .Q(n191) );
  NAND3X0 U275 ( .IN1(n191), .IN2(n323), .IN3(n190), .QN(n198) );
  XOR2X1 U276 ( .IN1(n195), .IN2(n194), .Q(n196) );
  MUX21X1 U277 ( .IN1(operands_bits_B[10]), .IN2(result_bits_data[10]), .S(
        n319), .Q(B_next[10]) );
  OR2X1 U278 ( .IN1(n319), .IN2(operands_bits_A[10]), .Q(n201) );
  NAND3X0 U279 ( .IN1(n201), .IN2(n323), .IN3(n200), .QN(n212) );
  XOR2X1 U280 ( .IN1(n209), .IN2(n208), .Q(n210) );
  MUX21X1 U281 ( .IN1(operands_bits_B[11]), .IN2(result_bits_data[11]), .S(
        n319), .Q(B_next[11]) );
  OR2X1 U282 ( .IN1(n319), .IN2(operands_bits_A[11]), .Q(n215) );
  NAND3X0 U283 ( .IN1(n215), .IN2(n323), .IN3(n214), .QN(n224) );
  NAND3X0 U284 ( .IN1(n285), .IN2(n230), .IN3(n216), .QN(n219) );
  XOR2X1 U285 ( .IN1(n221), .IN2(n220), .Q(n222) );
  MUX21X1 U286 ( .IN1(operands_bits_B[12]), .IN2(result_bits_data[12]), .S(
        n319), .Q(B_next[12]) );
  OR2X1 U287 ( .IN1(n319), .IN2(operands_bits_A[12]), .Q(n227) );
  NAND3X0 U288 ( .IN1(n227), .IN2(n323), .IN3(n226), .QN(n246) );
  XOR2X1 U289 ( .IN1(n243), .IN2(n242), .Q(n244) );
  MUX21X1 U290 ( .IN1(operands_bits_B[13]), .IN2(result_bits_data[13]), .S(
        n319), .Q(B_next[13]) );
  OR2X1 U291 ( .IN1(n319), .IN2(operands_bits_A[13]), .Q(n249) );
  NAND3X0 U292 ( .IN1(n249), .IN2(n323), .IN3(n248), .QN(n259) );
  XOR2X1 U293 ( .IN1(n256), .IN2(n255), .Q(n257) );
  MUX21X1 U294 ( .IN1(operands_bits_B[14]), .IN2(result_bits_data[14]), .S(
        n319), .Q(B_next[14]) );
  OR2X1 U295 ( .IN1(n319), .IN2(operands_bits_A[14]), .Q(n262) );
  NAND3X0 U296 ( .IN1(n262), .IN2(n323), .IN3(n261), .QN(n276) );
  NAND3X0 U297 ( .IN1(n285), .IN2(n263), .IN3(n278), .QN(n271) );
  NAND3X0 U298 ( .IN1(n271), .IN2(n281), .IN3(n270), .QN(n273) );
  XOR2X1 U299 ( .IN1(n273), .IN2(n272), .Q(n274) );
  MUX21X1 U300 ( .IN1(operands_bits_B[15]), .IN2(result_bits_data[15]), .S(
        n319), .Q(B_next[15]) );
  NOR3X0 U301 ( .IN1(n293), .IN2(n292), .IN3(n291), .QN(n288) );
  AO21X1 U302 ( .IN1(n288), .IN2(n294), .IN3(n289), .Q(n297) );
  NOR4X0 U303 ( .IN1(n293), .IN2(n292), .IN3(n291), .IN4(n290), .QN(n295) );
  NAND3X0 U304 ( .IN1(n298), .IN2(n297), .IN3(n296), .QN(n304) );
  OR2X1 U305 ( .IN1(n319), .IN2(operands_bits_A[15]), .Q(n302) );
  NAND3X0 U306 ( .IN1(n302), .IN2(n323), .IN3(n300), .QN(n303) );
  NOR4X0 U308 ( .IN1(B_reg[0]), .IN2(B_reg[4]), .IN3(B_reg[6]), .IN4(B_reg[7]), 
        .QN(n308) );
  NOR4X0 U309 ( .IN1(B_reg[1]), .IN2(B_reg[2]), .IN3(B_reg[3]), .IN4(B_reg[5]), 
        .QN(n307) );
  NOR4X0 U310 ( .IN1(B_reg[10]), .IN2(B_reg[8]), .IN3(B_reg[9]), .IN4(
        B_reg[11]), .QN(n306) );
  NOR4X0 U311 ( .IN1(B_reg[15]), .IN2(B_reg[14]), .IN3(B_reg[13]), .IN4(
        B_reg[12]), .QN(n305) );
  AND4X1 U312 ( .IN1(n308), .IN2(n307), .IN3(n306), .IN4(n305), .Q(B_zero) );
  INVX1 U89 ( .INP(reset), .ZN(n321) );
  INVX16 U313 ( .INP(A_mux_sel_0__BAR), .ZN(n319) );
  INVX2 U56 ( .INP(A_mux_sel_1_), .ZN(n323) );
  NAND2X1 U3 ( .IN1(n51), .IN2(B_reg[13]), .QN(n6) );
  NAND2X1 U31 ( .IN1(n21), .IN2(n204), .QN(n20) );
  NAND2X1 U30 ( .IN1(n23), .IN2(n20), .QN(n45) );
  NAND2X0 U105 ( .IN1(n94), .IN2(n107), .QN(n96) );
  NAND2X1 U146 ( .IN1(n45), .IN2(n44), .QN(n47) );
  INVX1 U93 ( .INP(n40), .ZN(n59) );
  NAND2X1 U69 ( .IN1(n63), .IN2(n62), .QN(n66) );
  NAND2X1 U74 ( .IN1(n99), .IN2(n98), .QN(A_next[3]) );
  NAND2X1 U68 ( .IN1(n144), .IN2(n143), .QN(A_next[6]) );
  NOR2X2 U84 ( .IN1(n260), .IN2(result_bits_data[14]), .QN(n280) );
  NOR2X1 U75 ( .IN1(n213), .IN2(result_bits_data[11]), .QN(n229) );
  NAND2X1 U27 ( .IN1(n22), .IN2(B_reg[9]), .QN(n24) );
  INVX0 U33 ( .INP(n205), .ZN(n21) );
  INVX0 U19 ( .INP(n251), .ZN(n10) );
  INVX0 U35 ( .INP(n41), .ZN(n23) );
  NOR2X0 U50 ( .IN1(n128), .IN2(A_mux_sel_1_), .QN(n131) );
  NAND2X0 U58 ( .IN1(n164), .IN2(n163), .QN(A_next[7]) );
  NAND2X0 U60 ( .IN1(n117), .IN2(n116), .QN(A_next[4]) );
  NAND2X0 U64 ( .IN1(n75), .IN2(n74), .QN(A_next[1]) );
  NAND2X0 U72 ( .IN1(n88), .IN2(n87), .QN(A_next[2]) );
  NAND2X0 U59 ( .IN1(n103), .IN2(n102), .QN(n117) );
  NAND2X0 U66 ( .IN1(n127), .IN2(n126), .QN(A_next[5]) );
  NAND2X0 U62 ( .IN1(n188), .IN2(n187), .QN(A_next[8]) );
  NAND2X0 U106 ( .IN1(n246), .IN2(n245), .QN(A_next[12]) );
  NAND2X0 U116 ( .IN1(n198), .IN2(n197), .QN(A_next[9]) );
  NAND2X0 U120 ( .IN1(n212), .IN2(n211), .QN(A_next[10]) );
  NAND2X0 U149 ( .IN1(n36), .IN2(n35), .QN(n39) );
  NAND2X0 U152 ( .IN1(n32), .IN2(B_reg[8]), .QN(n192) );
  NAND2X0 U138 ( .IN1(n84), .IN2(n83), .QN(n106) );
  NOR2X0 U28 ( .IN1(n19), .IN2(B_reg[12]), .QN(n264) );
  NOR2X0 U34 ( .IN1(n22), .IN2(B_reg[9]), .QN(n205) );
  NAND2X0 U61 ( .IN1(n168), .IN2(n167), .QN(n188) );
  NAND2X0 U70 ( .IN1(n66), .IN2(n65), .QN(A_next[0]) );
  NAND2X0 U65 ( .IN1(n121), .IN2(n120), .QN(n127) );
  NAND2X0 U63 ( .IN1(n70), .IN2(n69), .QN(n75) );
  NAND2X0 U71 ( .IN1(n79), .IN2(n78), .QN(n88) );
  NAND2X0 U67 ( .IN1(n131), .IN2(n130), .QN(n144) );
  NAND2X0 U73 ( .IN1(n92), .IN2(n91), .QN(n99) );
  NAND2X0 U133 ( .IN1(n172), .IN2(n171), .QN(n182) );
  NAND2X1 U131 ( .IN1(n182), .IN2(n181), .QN(n285) );
  NOR2X0 U10 ( .IN1(n4), .IN2(n3), .QN(n14) );
  INVX0 U92 ( .INP(n46), .ZN(n53) );
  NAND2X0 U142 ( .IN1(n54), .IN2(n53), .QN(n55) );
  NAND2X0 U143 ( .IN1(n50), .IN2(n286), .QN(n56) );
  NAND2X0 U137 ( .IN1(n106), .IN2(n105), .QN(n112) );
  NAND2X0 U144 ( .IN1(n49), .IN2(n287), .QN(n50) );
  NOR2X0 U82 ( .IN1(n265), .IN2(n251), .QN(n278) );
  NAND2X0 U11 ( .IN1(n136), .IN2(n177), .QN(n3) );
  INVX0 U2 ( .INP(n6), .ZN(n265) );
  NOR2X0 U240 ( .IN1(n48), .IN2(B_reg[14]), .QN(n292) );
  NOR2X1 U8 ( .IN1(n37), .IN2(B_reg[6]), .QN(n175) );
  NAND2X0 U156 ( .IN1(n68), .IN2(result_bits_data[1]), .QN(n83) );
  NAND2X0 U151 ( .IN1(n33), .IN2(B_reg[15]), .QN(n286) );
  NAND2X0 U147 ( .IN1(n38), .IN2(B_reg[5]), .QN(n132) );
  NAND2X0 U148 ( .IN1(n37), .IN2(B_reg[6]), .QN(n169) );
  NAND2X0 U150 ( .IN1(n34), .IN2(B_reg[7]), .QN(n176) );
  NAND2X0 U99 ( .IN1(n136), .IN2(n133), .QN(n113) );
  INVX0 U83 ( .INP(n280), .ZN(n277) );
  NAND2X0 U25 ( .IN1(n18), .IN2(B_reg[4]), .QN(n133) );
  NAND2X1 U18 ( .IN1(n277), .IN2(n286), .QN(n46) );
  NAND2X0 U5 ( .IN1(n2), .IN2(n35), .QN(n4) );
  NOR2X1 U314 ( .IN1(result_bits_data[3]), .IN2(n90), .QN(n108) );
  NAND2X0 U315 ( .IN1(n315), .IN2(n104), .QN(n311) );
  NAND2X1 U316 ( .IN1(n316), .IN2(n313), .QN(n312) );
  NAND2X1 U317 ( .IN1(n107), .IN2(n315), .QN(n314) );
  INVX0 U318 ( .INP(n108), .ZN(n310) );
  INVX0 U319 ( .INP(n104), .ZN(n93) );
  INVX0 U320 ( .INP(n107), .ZN(n80) );
  AND2X1 U321 ( .IN1(n311), .IN2(n310), .Q(n309) );
  NAND2X2 U322 ( .IN1(n312), .IN2(n309), .QN(n15) );
  INVX1 U323 ( .INP(n314), .ZN(n313) );
  INVX1 U324 ( .INP(n109), .ZN(n315) );
  NOR2X2 U325 ( .IN1(B_reg[3]), .IN2(n31), .QN(n109) );
  NAND2X1 U326 ( .IN1(n317), .IN2(n81), .QN(n316) );
  NAND2X1 U327 ( .IN1(n71), .IN2(n83), .QN(n317) );
endmodule


module gcdGCDUnitCtrl ( clk, reset, operands_val, result_rdy, B_zero, A_lt_B, 
        result_val, operands_rdy, A_mux_sel, B_mux_sel_BAR, A_en, B_en, 
        B_mux_sel_hfs_netlink_0 );
  output [1:0] A_mux_sel;
  input clk, reset, operands_val, result_rdy, B_zero, A_lt_B,
         B_mux_sel_hfs_netlink_0;
  output result_val, operands_rdy, B_mux_sel_BAR, A_en, B_en;
  wire   n13, n14, n3, n4, n6, n7, n8, n9, n10, n11, n12, n15, n16, n17, n18,
         n19, n20, n21;
  wire   [1:0] state;

  DFFX1 state_reg_0_ ( .D(n14), .CLK(clk), .Q(state[0]), .QN(n3) );
  DFFX1 state_reg_1_ ( .D(n13), .CLK(clk), .Q(state[1]), .QN(n17) );
  NAND2X0 U7 ( .IN1(B_zero), .IN2(n17), .QN(n20) );
  NAND2X0 U8 ( .IN1(n3), .IN2(n17), .QN(n9) );
  NAND2X0 U9 ( .IN1(n16), .IN2(n15), .QN(n13) );
  NAND2X0 U10 ( .IN1(B_mux_sel_hfs_netlink_0), .IN2(n4), .QN(B_en) );
  NAND2X0 U11 ( .IN1(operands_rdy), .IN2(operands_val), .QN(n4) );
  NOR2X2 U12 ( .IN1(A_lt_B), .IN2(n7), .QN(A_mux_sel[1]) );
  INVX0 U13 ( .INP(n8), .ZN(result_val) );
  NAND2X0 U14 ( .IN1(state[0]), .IN2(state[1]), .QN(n8) );
  NOR2X0 U15 ( .IN1(operands_val), .IN2(n17), .QN(n12) );
  NOR2X0 U17 ( .IN1(n21), .IN2(reset), .QN(n14) );
  OA21X1 U18 ( .IN1(n20), .IN2(A_lt_B), .IN3(n19), .Q(n21) );
  NAND2X0 U19 ( .IN1(n18), .IN2(state[0]), .QN(n19) );
  NAND2X0 U20 ( .IN1(result_rdy), .IN2(state[1]), .QN(n18) );
  NOR2X0 U21 ( .IN1(n17), .IN2(state[0]), .QN(operands_rdy) );
  OR2X1 U25 ( .IN1(B_en), .IN2(n6), .Q(A_en) );
  NAND3X0 U26 ( .IN1(n11), .IN2(n10), .IN3(B_zero), .QN(n16) );
  NOR3X0 U27 ( .IN1(n12), .IN2(result_val), .IN3(reset), .QN(n15) );
  INVX0 U3 ( .INP(A_lt_B), .ZN(n11) );
  INVX0 U16 ( .INP(n9), .ZN(n10) );
  NOR2X0 U24 ( .IN1(B_zero), .IN2(n9), .QN(n6) );
  INVX0 U23 ( .INP(n6), .ZN(n7) );
  NAND2X0 U5 ( .IN1(A_lt_B), .IN2(n10), .QN(B_mux_sel_BAR) );
endmodule


module gcdGCDUnit_rtl ( clk, reset, operands_bits_A, operands_bits_B, 
        operands_val, operands_rdy, result_bits_data, result_val, result_rdy
 );
  input [15:0] operands_bits_A;
  input [15:0] operands_bits_B;
  output [15:0] result_bits_data;
  input clk, reset, operands_val, result_rdy;
  output operands_rdy, result_val;
  wire   A_en, B_en, B_zero, A_lt_B, n1, n2, n4, SYNOPSYS_UNCONNECTED_1;

  gcdGCDUnitDpath_W16 GCDdpath0 ( .operands_bits_A(operands_bits_A), 
        .operands_bits_B(operands_bits_B), .result_bits_data(result_bits_data), 
        .clk(clk), .reset(reset), .B_mux_sel(n1), .A_en(A_en), .B_en(B_en), 
        .B_zero(B_zero), .A_lt_B(A_lt_B), .A_mux_sel_1_(n4), 
        .A_mux_sel_0__BAR(n2) );
  gcdGCDUnitCtrl GCDctrl0 ( .clk(clk), .reset(reset), .operands_val(
        operands_val), .result_rdy(result_rdy), .B_zero(B_zero), .A_lt_B(
        A_lt_B), .result_val(result_val), .operands_rdy(operands_rdy), 
        .A_mux_sel({n4, SYNOPSYS_UNCONNECTED_1}), .B_mux_sel_BAR(n1), .A_en(
        A_en), .B_en(B_en), .B_mux_sel_hfs_netlink_0(n2) );
  NBUFFX8 U3 ( .INP(n1), .Z(n2) );
endmodule

