
module SNPS_CLOCK_GATE_HIGH_GCD_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CGLPPRX2 latch ( .SE(TE), .EN(EN), .CLK(CLK), .GCLK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_GCD_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CGLPPRX2 latch ( .SE(TE), .EN(EN), .CLK(CLK), .GCLK(ENCLK) );
endmodule


module GCD ( clk, reset, io_operands_bits_A, io_operands_bits_B, 
        io_operands_val, io_operands_rdy, io_result_bits_data, io_result_val, 
        io_result_rdy );
  input [15:0] io_operands_bits_A;
  input [15:0] io_operands_bits_B;
  output [15:0] io_result_bits_data;
  input clk, reset, io_operands_val, io_result_rdy;
  output io_operands_rdy, io_result_val;
  wire   N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N32, N34, N35, N37,
         N38, N39, N40, N41, N42, N43, N44, N45, N46, N49, N51, N52, N63, N67,
         net80, net86, n26, n27, sub_x_10_n143, sub_x_10_n141, sub_x_10_n134,
         sub_x_10_n128, sub_x_10_n127, sub_x_10_n126, sub_x_10_n124,
         sub_x_10_n123, sub_x_10_n122, sub_x_10_n120, sub_x_10_n118,
         sub_x_10_n117, sub_x_10_n116, sub_x_10_n113, sub_x_10_n111,
         sub_x_10_n110, sub_x_10_n109, sub_x_10_n108, sub_x_10_n107,
         sub_x_10_n106, sub_x_10_n105, sub_x_10_n103, sub_x_10_n102,
         sub_x_10_n101, sub_x_10_n100, sub_x_10_n99, sub_x_10_n98,
         sub_x_10_n97, sub_x_10_n96, sub_x_10_n95, sub_x_10_n94, sub_x_10_n93,
         sub_x_10_n90, sub_x_10_n89, sub_x_10_n88, sub_x_10_n87, sub_x_10_n86,
         sub_x_10_n85, sub_x_10_n82, sub_x_10_n81, sub_x_10_n80, sub_x_10_n79,
         sub_x_10_n78, sub_x_10_n77, sub_x_10_n76, sub_x_10_n75, sub_x_10_n74,
         sub_x_10_n73, sub_x_10_n70, sub_x_10_n68, sub_x_10_n67, sub_x_10_n65,
         sub_x_10_n62, sub_x_10_n61, sub_x_10_n60, sub_x_10_n59, sub_x_10_n58,
         sub_x_10_n53, sub_x_10_n52, sub_x_10_n51, sub_x_10_n48, sub_x_10_n47,
         sub_x_10_n46, sub_x_10_n45, sub_x_10_n44, sub_x_10_n43, sub_x_10_n42,
         sub_x_10_n38, sub_x_10_n37, sub_x_10_n36, sub_x_10_n35, sub_x_10_n32,
         sub_x_10_n31, sub_x_10_n30, sub_x_10_n29, sub_x_10_n28, sub_x_10_n27,
         sub_x_10_n26, sub_x_10_n24, sub_x_10_n22, sub_x_10_n21, sub_x_10_n20,
         sub_x_10_n19, sub_x_10_n18, sub_x_10_n17, sub_x_10_n16, sub_x_10_n15,
         sub_x_10_n14, sub_x_10_n13, sub_x_10_n12, sub_x_10_n11, sub_x_10_n10,
         sub_x_10_n9, sub_x_10_n8, sub_x_10_n7, sub_x_10_n6, sub_x_10_n5,
         sub_x_10_n4, sub_x_10_n3, sub_x_10_n2, sub_x_10_n1, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n348, n349,
         n350, n351, n352;
  wire   [15:0] A;
  wire   [15:0] B;
  wire   [1:0] state;
  wire   [15:0] T25;

  SNPS_CLOCK_GATE_HIGH_GCD_0 clk_gate_A_reg ( .CLK(clk), .EN(N63), .ENCLK(
        net80), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_GCD_1 clk_gate_B_reg ( .CLK(clk), .EN(N67), .ENCLK(
        net86), .TE(1'b0) );
  XNOR2X1 sub_x_10_U143 ( .IN1(n63), .IN2(B[0]), .Q(T25[0]) );
  OAI21X1 sub_x_10_U138 ( .IN1(sub_x_10_n113), .IN2(sub_x_10_n111), .IN3(n185), 
        .QN(sub_x_10_n110) );
  XOR2X1 sub_x_10_U136 ( .IN1(sub_x_10_n16), .IN2(sub_x_10_n113), .Q(T25[1])
         );
  OAI21X1 sub_x_10_U131 ( .IN1(sub_x_10_n107), .IN2(sub_x_10_n109), .IN3(
        sub_x_10_n108), .QN(sub_x_10_n106) );
  XOR2X1 sub_x_10_U130 ( .IN1(sub_x_10_n109), .IN2(sub_x_10_n15), .Q(T25[2])
         );
  OAI21X1 sub_x_10_U125 ( .IN1(sub_x_10_n108), .IN2(n134), .IN3(sub_x_10_n105), 
        .QN(sub_x_10_n103) );
  AOI21X1 sub_x_10_U123 ( .IN1(sub_x_10_n110), .IN2(sub_x_10_n102), .IN3(
        sub_x_10_n103), .QN(sub_x_10_n101) );
  XNOR2X1 sub_x_10_U121 ( .IN1(sub_x_10_n106), .IN2(sub_x_10_n14), .Q(T25[3])
         );
  AOI21X1 sub_x_10_U114 ( .IN1(sub_x_10_n100), .IN2(sub_x_10_n96), .IN3(
        sub_x_10_n97), .QN(sub_x_10_n95) );
  XNOR2X1 sub_x_10_U113 ( .IN1(sub_x_10_n100), .IN2(sub_x_10_n13), .Q(T25[4])
         );
  OAI21X1 sub_x_10_U108 ( .IN1(sub_x_10_n99), .IN2(sub_x_10_n93), .IN3(
        sub_x_10_n94), .QN(sub_x_10_n88) );
  AOI21X1 sub_x_10_U102 ( .IN1(sub_x_10_n100), .IN2(sub_x_10_n87), .IN3(
        sub_x_10_n88), .QN(sub_x_10_n86) );
  XOR2X1 sub_x_10_U101 ( .IN1(sub_x_10_n95), .IN2(sub_x_10_n12), .Q(T25[5]) );
  OAI21X1 sub_x_10_U94 ( .IN1(sub_x_10_n82), .IN2(sub_x_10_n90), .IN3(
        sub_x_10_n85), .QN(sub_x_10_n81) );
  AOI21X1 sub_x_10_U92 ( .IN1(sub_x_10_n100), .IN2(sub_x_10_n80), .IN3(
        sub_x_10_n81), .QN(sub_x_10_n79) );
  XOR2X1 sub_x_10_U91 ( .IN1(sub_x_10_n86), .IN2(sub_x_10_n11), .Q(T25[6]) );
  OAI21X1 sub_x_10_U86 ( .IN1(sub_x_10_n85), .IN2(sub_x_10_n77), .IN3(
        sub_x_10_n78), .QN(sub_x_10_n76) );
  AOI21X1 sub_x_10_U84 ( .IN1(sub_x_10_n88), .IN2(sub_x_10_n75), .IN3(
        sub_x_10_n76), .QN(sub_x_10_n74) );
  OAI21X1 sub_x_10_U82 ( .IN1(sub_x_10_n73), .IN2(sub_x_10_n101), .IN3(
        sub_x_10_n74), .QN(sub_x_10_n1) );
  XOR2X1 sub_x_10_U81 ( .IN1(sub_x_10_n79), .IN2(sub_x_10_n10), .Q(T25[7]) );
  AOI21X1 sub_x_10_U74 ( .IN1(sub_x_10_n1), .IN2(sub_x_10_n68), .IN3(n262), 
        .QN(sub_x_10_n67) );
  XNOR2X1 sub_x_10_U73 ( .IN1(sub_x_10_n1), .IN2(sub_x_10_n9), .Q(T25[8]) );
  OAI21X1 sub_x_10_U68 ( .IN1(n261), .IN2(sub_x_10_n65), .IN3(n271), .QN(
        sub_x_10_n60) );
  AOI21X1 sub_x_10_U62 ( .IN1(sub_x_10_n1), .IN2(sub_x_10_n59), .IN3(
        sub_x_10_n60), .QN(sub_x_10_n58) );
  XOR2X1 sub_x_10_U61 ( .IN1(sub_x_10_n67), .IN2(sub_x_10_n8), .Q(T25[9]) );
  OAI21X1 sub_x_10_U54 ( .IN1(n293), .IN2(sub_x_10_n62), .IN3(n280), .QN(
        sub_x_10_n53) );
  AOI21X1 sub_x_10_U52 ( .IN1(sub_x_10_n1), .IN2(sub_x_10_n52), .IN3(
        sub_x_10_n53), .QN(sub_x_10_n51) );
  XOR2X1 sub_x_10_U51 ( .IN1(sub_x_10_n58), .IN2(sub_x_10_n7), .Q(T25[10]) );
  OAI21X1 sub_x_10_U46 ( .IN1(n280), .IN2(n296), .IN3(n294), .QN(sub_x_10_n48)
         );
  AOI21X1 sub_x_10_U44 ( .IN1(sub_x_10_n60), .IN2(sub_x_10_n47), .IN3(
        sub_x_10_n48), .QN(sub_x_10_n46) );
  AOI21X1 sub_x_10_U40 ( .IN1(sub_x_10_n1), .IN2(sub_x_10_n43), .IN3(
        sub_x_10_n44), .QN(sub_x_10_n42) );
  XOR2X1 sub_x_10_U39 ( .IN1(sub_x_10_n51), .IN2(sub_x_10_n6), .Q(T25[11]) );
  OAI21X1 sub_x_10_U32 ( .IN1(sub_x_10_n38), .IN2(sub_x_10_n46), .IN3(n305), 
        .QN(sub_x_10_n37) );
  AOI21X1 sub_x_10_U30 ( .IN1(sub_x_10_n1), .IN2(sub_x_10_n36), .IN3(
        sub_x_10_n37), .QN(sub_x_10_n35) );
  XOR2X1 sub_x_10_U29 ( .IN1(sub_x_10_n42), .IN2(sub_x_10_n5), .Q(T25[12]) );
  OAI21X1 sub_x_10_U24 ( .IN1(n305), .IN2(n165), .IN3(n94), .QN(sub_x_10_n32)
         );
  OAI21X1 sub_x_10_U20 ( .IN1(sub_x_10_n29), .IN2(sub_x_10_n46), .IN3(
        sub_x_10_n30), .QN(sub_x_10_n28) );
  AOI21X1 sub_x_10_U18 ( .IN1(sub_x_10_n1), .IN2(sub_x_10_n27), .IN3(
        sub_x_10_n28), .QN(sub_x_10_n26) );
  XOR2X1 sub_x_10_U17 ( .IN1(sub_x_10_n35), .IN2(sub_x_10_n4), .Q(T25[13]) );
  AOI21X1 sub_x_10_U10 ( .IN1(sub_x_10_n32), .IN2(sub_x_10_n22), .IN3(n321), 
        .QN(sub_x_10_n21) );
  OAI21X1 sub_x_10_U8 ( .IN1(sub_x_10_n20), .IN2(sub_x_10_n46), .IN3(
        sub_x_10_n21), .QN(sub_x_10_n19) );
  XOR2X1 sub_x_10_U5 ( .IN1(sub_x_10_n26), .IN2(sub_x_10_n3), .Q(T25[14]) );
  XOR2X1 sub_x_10_U3 ( .IN1(n75), .IN2(B[15]), .Q(sub_x_10_n2) );
  NOR2X0 sub_x_10_U111 ( .IN1(n66), .IN2(B[5]), .QN(sub_x_10_n93) );
  NOR2X0 sub_x_10_U119 ( .IN1(n65), .IN2(B[4]), .QN(sub_x_10_n98) );
  NOR2X0 sub_x_10_U107 ( .IN1(sub_x_10_n93), .IN2(sub_x_10_n98), .QN(
        sub_x_10_n87) );
  NOR2X0 sub_x_10_U89 ( .IN1(n68), .IN2(B[7]), .QN(sub_x_10_n77) );
  NOR2X0 sub_x_10_U99 ( .IN1(n67), .IN2(B[6]), .QN(sub_x_10_n82) );
  NOR2X0 sub_x_10_U85 ( .IN1(sub_x_10_n77), .IN2(sub_x_10_n82), .QN(
        sub_x_10_n75) );
  NOR2X0 sub_x_10_U144 ( .IN1(n63), .IN2(B[0]), .QN(sub_x_10_n113) );
  NOR2X0 sub_x_10_U141 ( .IN1(sub_x_10_n143), .IN2(B[1]), .QN(sub_x_10_n111)
         );
  NOR2X0 sub_x_10_U134 ( .IN1(n64), .IN2(B[2]), .QN(sub_x_10_n107) );
  NOR2X0 sub_x_10_U124 ( .IN1(sub_x_10_n107), .IN2(n134), .QN(sub_x_10_n102)
         );
  NOR2X0 sub_x_10_U45 ( .IN1(n296), .IN2(n293), .QN(sub_x_10_n47) );
  NOR2X0 sub_x_10_U79 ( .IN1(n69), .IN2(B[8]), .QN(sub_x_10_n70) );
  NOR2X0 sub_x_10_U71 ( .IN1(n70), .IN2(B[9]), .QN(sub_x_10_n65) );
  NOR2X0 sub_x_10_U67 ( .IN1(sub_x_10_n70), .IN2(sub_x_10_n65), .QN(
        sub_x_10_n59) );
  NOR2X0 sub_x_10_U37 ( .IN1(n72), .IN2(B[12]), .QN(sub_x_10_n38) );
  NOR2X0 sub_x_10_U23 ( .IN1(sub_x_10_n38), .IN2(n165), .QN(sub_x_10_n31) );
  NOR2X0 sub_x_10_U15 ( .IN1(n74), .IN2(B[14]), .QN(sub_x_10_n24) );
  NOR2X0 sub_x_10_U7 ( .IN1(sub_x_10_n45), .IN2(sub_x_10_n20), .QN(
        sub_x_10_n18) );
  XOR2X1 sub_x_10_U2 ( .IN1(sub_x_10_n17), .IN2(sub_x_10_n2), .Q(T25[15]) );
  NOR2X0 sub_x_10_U19 ( .IN1(sub_x_10_n45), .IN2(sub_x_10_n29), .QN(
        sub_x_10_n27) );
  NOR2X0 sub_x_10_U53 ( .IN1(sub_x_10_n61), .IN2(n293), .QN(sub_x_10_n52) );
  NOR2X0 sub_x_10_U31 ( .IN1(sub_x_10_n45), .IN2(sub_x_10_n38), .QN(
        sub_x_10_n36) );
  NOR2X0 sub_x_10_U93 ( .IN1(sub_x_10_n89), .IN2(sub_x_10_n82), .QN(
        sub_x_10_n80) );
  NAND2X0 sub_x_10_U83 ( .IN1(sub_x_10_n87), .IN2(sub_x_10_n75), .QN(
        sub_x_10_n73) );
  NAND2X0 sub_x_10_U135 ( .IN1(n64), .IN2(B[2]), .QN(sub_x_10_n108) );
  NAND2X0 sub_x_10_U129 ( .IN1(sub_x_10_n141), .IN2(B[3]), .QN(sub_x_10_n105)
         );
  NAND2X0 sub_x_10_U112 ( .IN1(n66), .IN2(B[5]), .QN(sub_x_10_n94) );
  NAND2X0 sub_x_10_U100 ( .IN1(n67), .IN2(B[6]), .QN(sub_x_10_n85) );
  NAND2X0 sub_x_10_U90 ( .IN1(n68), .IN2(B[7]), .QN(sub_x_10_n78) );
  NAND2X0 sub_x_10_U43 ( .IN1(sub_x_10_n47), .IN2(sub_x_10_n59), .QN(
        sub_x_10_n45) );
  NAND2X0 sub_x_10_U9 ( .IN1(sub_x_10_n31), .IN2(sub_x_10_n22), .QN(
        sub_x_10_n20) );
  NAND2X0 sub_x_10_U35 ( .IN1(sub_x_10_n117), .IN2(n305), .QN(sub_x_10_n5) );
  NAND2X0 sub_x_10_U57 ( .IN1(n282), .IN2(n280), .QN(sub_x_10_n7) );
  NAND2X0 sub_x_10_U13 ( .IN1(sub_x_10_n22), .IN2(n327), .QN(sub_x_10_n3) );
  NAND2X0 sub_x_10_U47 ( .IN1(sub_x_10_n118), .IN2(n294), .QN(sub_x_10_n6) );
  NAND2X0 sub_x_10_U69 ( .IN1(sub_x_10_n120), .IN2(n271), .QN(sub_x_10_n8) );
  NAND2X0 sub_x_10_U25 ( .IN1(sub_x_10_n116), .IN2(n94), .QN(sub_x_10_n4) );
  NAND2X0 sub_x_10_U132 ( .IN1(sub_x_10_n127), .IN2(sub_x_10_n108), .QN(
        sub_x_10_n15) );
  NAND2X0 sub_x_10_U139 ( .IN1(sub_x_10_n128), .IN2(n185), .QN(sub_x_10_n16)
         );
  NAND2X0 sub_x_10_U109 ( .IN1(sub_x_10_n124), .IN2(sub_x_10_n94), .QN(
        sub_x_10_n12) );
  NAND2X0 sub_x_10_U77 ( .IN1(sub_x_10_n68), .IN2(n261), .QN(sub_x_10_n9) );
  NAND2X0 sub_x_10_U87 ( .IN1(sub_x_10_n122), .IN2(sub_x_10_n78), .QN(
        sub_x_10_n10) );
  NAND2X0 sub_x_10_U117 ( .IN1(sub_x_10_n96), .IN2(sub_x_10_n99), .QN(
        sub_x_10_n13) );
  NAND2X0 sub_x_10_U126 ( .IN1(sub_x_10_n126), .IN2(sub_x_10_n105), .QN(
        sub_x_10_n14) );
  NAND2X0 sub_x_10_U97 ( .IN1(sub_x_10_n123), .IN2(sub_x_10_n85), .QN(
        sub_x_10_n11) );
  DFFSSRX1 A_reg_10_ ( .D(n351), .RSTB(io_operands_bits_A[10]), .SETB(n278), 
        .CLK(net80), .QN(sub_x_10_n134) );
  DFFSSRX1 A_reg_11_ ( .D(n286), .RSTB(n335), .SETB(n287), .CLK(net80), .QN(
        n71) );
  DFFSSRX1 A_reg_13_ ( .D(n311), .RSTB(n335), .SETB(n312), .CLK(net80), .QN(
        n73) );
  DFFSSRX1 B_reg_11_ ( .D(n351), .RSTB(io_operands_bits_B[11]), .SETB(n125), 
        .CLK(net86), .Q(B[11]) );
  DFFSSRX1 B_reg_10_ ( .D(T25[10]), .RSTB(n131), .SETB(n124), .CLK(net86), .Q(
        B[10]) );
  DFFSSRX1 B_reg_13_ ( .D(T25[13]), .RSTB(n131), .SETB(n128), .CLK(net86), .Q(
        B[13]) );
  DFFX1 state_reg_0_ ( .D(n26), .CLK(clk), .Q(state[0]), .QN(n343) );
  DFFX1 state_reg_1_ ( .D(n27), .CLK(clk), .Q(state[1]), .QN(n350) );
  DFFX1 A_reg_9_ ( .D(N29), .CLK(net80), .Q(A[9]), .QN(n70) );
  DFFX1 A_reg_8_ ( .D(N28), .CLK(net80), .Q(A[8]), .QN(n69) );
  DFFX1 A_reg_7_ ( .D(N27), .CLK(net80), .Q(A[7]), .QN(n68) );
  DFFX1 A_reg_6_ ( .D(N26), .CLK(net80), .Q(A[6]), .QN(n67) );
  DFFX1 A_reg_5_ ( .D(N25), .CLK(net80), .Q(A[5]), .QN(n66) );
  DFFX1 A_reg_4_ ( .D(N24), .CLK(net80), .Q(A[4]), .QN(n65) );
  DFFX1 A_reg_3_ ( .D(N23), .CLK(net80), .Q(A[3]), .QN(sub_x_10_n141) );
  DFFX1 A_reg_2_ ( .D(N22), .CLK(net80), .Q(A[2]), .QN(n64) );
  DFFX1 A_reg_1_ ( .D(N21), .CLK(net80), .Q(A[1]), .QN(sub_x_10_n143) );
  DFFX1 A_reg_0_ ( .D(N20), .CLK(net80), .Q(A[0]), .QN(n63) );
  DFFX1 A_reg_12_ ( .D(N32), .CLK(net80), .Q(A[12]), .QN(n72) );
  DFFX1 A_reg_14_ ( .D(N34), .CLK(net80), .Q(A[14]), .QN(n74) );
  DFFX1 A_reg_15_ ( .D(N35), .CLK(net80), .Q(A[15]), .QN(n75) );
  DFFX1 B_reg_8_ ( .D(N45), .CLK(net86), .Q(B[8]), .QN(n57) );
  DFFX1 B_reg_7_ ( .D(N44), .CLK(net86), .Q(B[7]), .QN(n55) );
  DFFX1 B_reg_6_ ( .D(N43), .CLK(net86), .Q(B[6]), .QN(n39) );
  DFFX1 B_reg_5_ ( .D(N42), .CLK(net86), .Q(B[5]), .QN(n40) );
  DFFX1 B_reg_4_ ( .D(N41), .CLK(net86), .Q(B[4]), .QN(n36) );
  DFFX1 B_reg_3_ ( .D(N40), .CLK(net86), .Q(B[3]), .QN(n44) );
  DFFX1 B_reg_9_ ( .D(N46), .CLK(net86), .Q(B[9]), .QN(n54) );
  DFFX1 B_reg_12_ ( .D(N49), .CLK(net86), .Q(B[12]), .QN(n37) );
  DFFX1 B_reg_14_ ( .D(N51), .CLK(net86), .Q(B[14]), .QN(n52) );
  DFFX1 B_reg_2_ ( .D(N39), .CLK(net86), .Q(B[2]), .QN(n42) );
  DFFX1 B_reg_1_ ( .D(N38), .CLK(net86), .Q(B[1]), .QN(n47) );
  DFFX1 B_reg_0_ ( .D(N37), .CLK(net86), .Q(B[0]), .QN(n136) );
  DFFX1 B_reg_15_ ( .D(N52), .CLK(net86), .Q(B[15]), .QN(n50) );
  NOR4X1 U83 ( .IN1(n256), .IN2(n255), .IN3(n254), .IN4(n253), .QN(n290) );
  NOR2X0 U84 ( .IN1(n39), .IN2(A[6]), .QN(n233) );
  NOR2X0 U86 ( .IN1(n40), .IN2(A[5]), .QN(n220) );
  NAND2X1 U87 ( .IN1(sub_x_10_n143), .IN2(B[1]), .QN(n185) );
  NAND2X1 U88 ( .IN1(n186), .IN2(n185), .QN(n188) );
  NOR2X0 U90 ( .IN1(n86), .IN2(n233), .QN(n243) );
  NAND2X1 U91 ( .IN1(n243), .IN2(n242), .QN(n246) );
  NAND2X2 U92 ( .IN1(n188), .IN2(n187), .QN(n217) );
  INVX0 U93 ( .INP(n243), .ZN(n248) );
  NOR2X2 U94 ( .IN1(n136), .IN2(A[0]), .QN(n184) );
  NAND2X1 U95 ( .IN1(n177), .IN2(n176), .QN(n349) );
  NOR2X1 U96 ( .IN1(n77), .IN2(n193), .QN(n202) );
  NOR2X1 U97 ( .IN1(n42), .IN2(A[2]), .QN(n193) );
  NAND2X0 U98 ( .IN1(n218), .IN2(n245), .QN(n232) );
  NAND2X0 U99 ( .IN1(n323), .IN2(n305), .QN(n308) );
  NAND2X0 U101 ( .IN1(n294), .IN2(n293), .QN(n295) );
  NOR2X0 U102 ( .IN1(n290), .IN2(n289), .QN(n323) );
  NOR2X0 U103 ( .IN1(n71), .IN2(B[11]), .QN(n296) );
  NAND2X0 U107 ( .IN1(n244), .IN2(n245), .QN(n204) );
  NOR2X2 U108 ( .IN1(n349), .IN2(reset), .QN(n335) );
  NOR2X1 U110 ( .IN1(n36), .IN2(A[4]), .QN(n208) );
  NOR2X1 U111 ( .IN1(n220), .IN2(n208), .QN(n242) );
  NAND2X0 U112 ( .IN1(state[0]), .IN2(state[1]), .QN(n34) );
  NOR2X0 U114 ( .IN1(n35), .IN2(n34), .QN(io_result_val) );
  NOR2X1 U115 ( .IN1(sub_x_10_n141), .IN2(B[3]), .QN(n134) );
  NAND2X0 U117 ( .IN1(n117), .IN2(n116), .QN(N43) );
  NAND2X0 U118 ( .IN1(n351), .IN2(io_operands_bits_B[6]), .QN(n116) );
  NAND2X0 U119 ( .IN1(T25[6]), .IN2(n131), .QN(n117) );
  NAND2X0 U120 ( .IN1(n111), .IN2(n110), .QN(N40) );
  NAND2X0 U121 ( .IN1(n351), .IN2(io_operands_bits_B[3]), .QN(n110) );
  NAND2X0 U122 ( .IN1(T25[3]), .IN2(n131), .QN(n111) );
  NAND2X0 U123 ( .IN1(n113), .IN2(n112), .QN(N41) );
  NAND2X0 U124 ( .IN1(n351), .IN2(io_operands_bits_B[4]), .QN(n112) );
  NAND2X0 U125 ( .IN1(T25[4]), .IN2(n131), .QN(n113) );
  NAND2X0 U126 ( .IN1(n119), .IN2(n118), .QN(N44) );
  NAND2X0 U127 ( .IN1(n351), .IN2(io_operands_bits_B[7]), .QN(n118) );
  NAND2X0 U128 ( .IN1(T25[7]), .IN2(n131), .QN(n119) );
  NAND2X0 U129 ( .IN1(n121), .IN2(n120), .QN(N45) );
  NAND2X0 U130 ( .IN1(n351), .IN2(io_operands_bits_B[8]), .QN(n120) );
  NAND2X0 U131 ( .IN1(T25[8]), .IN2(n131), .QN(n121) );
  NAND2X0 U132 ( .IN1(n115), .IN2(n114), .QN(N42) );
  NAND2X0 U133 ( .IN1(n351), .IN2(io_operands_bits_B[5]), .QN(n114) );
  NAND2X0 U134 ( .IN1(T25[5]), .IN2(n131), .QN(n115) );
  NAND2X0 U135 ( .IN1(n107), .IN2(n106), .QN(N38) );
  NAND2X0 U136 ( .IN1(n351), .IN2(io_operands_bits_B[1]), .QN(n106) );
  NAND2X0 U137 ( .IN1(n131), .IN2(T25[1]), .QN(n107) );
  NAND2X0 U138 ( .IN1(n109), .IN2(n108), .QN(N39) );
  NAND2X0 U139 ( .IN1(n351), .IN2(io_operands_bits_B[2]), .QN(n108) );
  NAND2X0 U140 ( .IN1(n131), .IN2(T25[2]), .QN(n109) );
  NAND2X0 U141 ( .IN1(n105), .IN2(n104), .QN(N37) );
  NAND2X0 U142 ( .IN1(n351), .IN2(io_operands_bits_B[0]), .QN(n104) );
  NAND2X0 U143 ( .IN1(n131), .IN2(T25[0]), .QN(n105) );
  NAND2X0 U144 ( .IN1(n269), .IN2(n268), .QN(N29) );
  NAND2X0 U145 ( .IN1(n351), .IN2(io_operands_bits_A[9]), .QN(n268) );
  NAND2X0 U146 ( .IN1(n335), .IN2(n267), .QN(n269) );
  NAND2X0 U147 ( .IN1(n260), .IN2(n259), .QN(N28) );
  NAND2X0 U148 ( .IN1(n351), .IN2(io_operands_bits_A[8]), .QN(n259) );
  NAND2X0 U149 ( .IN1(n335), .IN2(n258), .QN(n260) );
  NAND2X0 U150 ( .IN1(n229), .IN2(n228), .QN(N26) );
  NAND2X0 U151 ( .IN1(n351), .IN2(io_operands_bits_A[6]), .QN(n228) );
  NAND2X0 U152 ( .IN1(n335), .IN2(n227), .QN(n229) );
  NAND2X0 U153 ( .IN1(n224), .IN2(n247), .QN(n226) );
  NAND2X0 U154 ( .IN1(n216), .IN2(n215), .QN(N25) );
  NAND2X0 U155 ( .IN1(n351), .IN2(io_operands_bits_A[5]), .QN(n215) );
  NAND2X0 U156 ( .IN1(n335), .IN2(n214), .QN(n216) );
  NAND2X0 U157 ( .IN1(n207), .IN2(n206), .QN(N24) );
  NAND2X0 U158 ( .IN1(n351), .IN2(io_operands_bits_A[4]), .QN(n206) );
  NAND2X0 U159 ( .IN1(n335), .IN2(n205), .QN(n207) );
  NAND2X0 U160 ( .IN1(n241), .IN2(n240), .QN(N27) );
  NAND2X0 U161 ( .IN1(n351), .IN2(io_operands_bits_A[7]), .QN(n240) );
  NAND2X0 U162 ( .IN1(n335), .IN2(n239), .QN(n241) );
  NAND2X0 U163 ( .IN1(n236), .IN2(n235), .QN(n238) );
  NAND2X0 U164 ( .IN1(n201), .IN2(n200), .QN(N23) );
  NAND2X0 U165 ( .IN1(n351), .IN2(io_operands_bits_A[3]), .QN(n200) );
  NAND2X0 U166 ( .IN1(n335), .IN2(n199), .QN(n201) );
  NAND2X0 U167 ( .IN1(n196), .IN2(n195), .QN(n198) );
  NAND2X0 U168 ( .IN1(n217), .IN2(n194), .QN(n196) );
  NAND2X0 U169 ( .IN1(n192), .IN2(n191), .QN(N22) );
  NAND2X0 U170 ( .IN1(n351), .IN2(io_operands_bits_A[2]), .QN(n191) );
  NAND2X0 U171 ( .IN1(n335), .IN2(n190), .QN(n192) );
  NAND2X0 U172 ( .IN1(n183), .IN2(n182), .QN(N21) );
  NAND2X0 U173 ( .IN1(n351), .IN2(io_operands_bits_A[1]), .QN(n182) );
  NAND2X0 U174 ( .IN1(n335), .IN2(n181), .QN(n183) );
  NAND2X0 U175 ( .IN1(n180), .IN2(n179), .QN(N20) );
  NAND2X0 U176 ( .IN1(n351), .IN2(io_operands_bits_A[0]), .QN(n179) );
  NAND2X0 U177 ( .IN1(n335), .IN2(n178), .QN(n180) );
  NAND2X0 U178 ( .IN1(n277), .IN2(n335), .QN(n278) );
  NAND2X0 U179 ( .IN1(n351), .IN2(io_operands_bits_B[13]), .QN(n128) );
  NAND2X0 U180 ( .IN1(n123), .IN2(n122), .QN(N46) );
  NAND2X0 U181 ( .IN1(n351), .IN2(io_operands_bits_B[9]), .QN(n122) );
  NAND2X0 U182 ( .IN1(T25[9]), .IN2(n131), .QN(n123) );
  NAND2X0 U183 ( .IN1(T25[11]), .IN2(n131), .QN(n125) );
  NAND2X0 U184 ( .IN1(n130), .IN2(n129), .QN(N51) );
  NAND2X0 U185 ( .IN1(n351), .IN2(io_operands_bits_B[14]), .QN(n129) );
  NAND2X0 U186 ( .IN1(T25[14]), .IN2(n131), .QN(n130) );
  NAND2X0 U187 ( .IN1(n351), .IN2(io_operands_bits_B[10]), .QN(n124) );
  NAND2X0 U188 ( .IN1(n127), .IN2(n126), .QN(N49) );
  NAND2X0 U189 ( .IN1(n351), .IN2(io_operands_bits_B[12]), .QN(n126) );
  NAND2X0 U190 ( .IN1(T25[12]), .IN2(n131), .QN(n127) );
  NAND2X0 U191 ( .IN1(n304), .IN2(n303), .QN(N32) );
  NAND2X0 U192 ( .IN1(n351), .IN2(io_operands_bits_A[12]), .QN(n303) );
  NAND2X0 U193 ( .IN1(n302), .IN2(n335), .QN(n304) );
  NAND2X0 U194 ( .IN1(n133), .IN2(n132), .QN(N52) );
  NAND2X0 U195 ( .IN1(n351), .IN2(io_operands_bits_B[15]), .QN(n132) );
  NAND2X0 U196 ( .IN1(T25[15]), .IN2(n131), .QN(n133) );
  NAND2X0 U199 ( .IN1(n99), .IN2(n172), .QN(n100) );
  NAND2X0 U200 ( .IN1(n168), .IN2(n98), .QN(n99) );
  NAND2X0 U201 ( .IN1(n96), .IN2(n95), .QN(n103) );
  NAND2X0 U202 ( .IN1(n93), .IN2(n92), .QN(n96) );
  NAND2X0 U203 ( .IN1(n91), .IN2(n294), .QN(n92) );
  NAND2X0 U204 ( .IN1(n90), .IN2(n151), .QN(n91) );
  NAND2X1 U205 ( .IN1(n89), .IN2(n288), .QN(n93) );
  NAND2X1 U206 ( .IN1(n88), .IN2(n87), .QN(n89) );
  NAND2X0 U207 ( .IN1(n146), .IN2(n250), .QN(n87) );
  NAND2X1 U208 ( .IN1(n84), .IN2(n243), .QN(n88) );
  NAND2X1 U209 ( .IN1(n83), .IN2(n82), .QN(n84) );
  NAND2X0 U210 ( .IN1(n140), .IN2(n81), .QN(n82) );
  NAND2X1 U211 ( .IN1(n80), .IN2(n242), .QN(n83) );
  NAND2X1 U212 ( .IN1(n79), .IN2(n245), .QN(n80) );
  NAND2X0 U214 ( .IN1(n351), .IN2(io_operands_bits_A[11]), .QN(n287) );
  NAND2X0 U215 ( .IN1(n292), .IN2(n280), .QN(n281) );
  NAND2X0 U216 ( .IN1(n279), .IN2(n280), .QN(n283) );
  NAND2X0 U217 ( .IN1(n351), .IN2(io_operands_bits_A[13]), .QN(n312) );
  NAND2X0 U218 ( .IN1(n325), .IN2(n305), .QN(n306) );
  NAND2X0 U219 ( .IN1(n320), .IN2(n319), .QN(N34) );
  NAND2X0 U220 ( .IN1(n351), .IN2(io_operands_bits_A[14]), .QN(n319) );
  NAND2X0 U221 ( .IN1(n318), .IN2(n335), .QN(n320) );
  NAND2X0 U222 ( .IN1(n325), .IN2(n313), .QN(n314) );
  NAND2X0 U223 ( .IN1(n323), .IN2(n313), .QN(n315) );
  NAND2X0 U224 ( .IN1(n338), .IN2(n337), .QN(N35) );
  NAND2X0 U225 ( .IN1(n351), .IN2(io_operands_bits_A[15]), .QN(n337) );
  NAND2X0 U228 ( .IN1(n336), .IN2(n335), .QN(n338) );
  NAND2X0 U229 ( .IN1(n173), .IN2(n172), .QN(n174) );
  NAND2X0 U230 ( .IN1(n171), .IN2(n170), .QN(n173) );
  NAND2X0 U231 ( .IN1(n327), .IN2(n98), .QN(n171) );
  NAND2X0 U233 ( .IN1(n170), .IN2(n331), .QN(n168) );
  NAND2X0 U235 ( .IN1(n159), .IN2(sub_x_10_n118), .QN(n160) );
  NAND2X0 U236 ( .IN1(n157), .IN2(n291), .QN(n159) );
  NAND2X0 U237 ( .IN1(n155), .IN2(n154), .QN(n161) );
  NAND2X0 U238 ( .IN1(n273), .IN2(n263), .QN(n152) );
  NAND2X0 U240 ( .IN1(n248), .IN2(n251), .QN(n149) );
  NAND2X1 U241 ( .IN1(n148), .IN2(n147), .QN(n150) );
  NAND2X0 U242 ( .IN1(n251), .IN2(n85), .QN(n146) );
  NAND2X1 U243 ( .IN1(n145), .IN2(n144), .QN(n148) );
  NAND2X0 U244 ( .IN1(n143), .IN2(n221), .QN(n144) );
  NAND2X1 U245 ( .IN1(n142), .IN2(n141), .QN(n145) );
  NAND2X0 U246 ( .IN1(n221), .IN2(n219), .QN(n140) );
  NAND2X1 U247 ( .IN1(n231), .IN2(n139), .QN(n142) );
  NAND2X1 U248 ( .IN1(n135), .IN2(n137), .QN(n231) );
  NAND2X0 U249 ( .IN1(n328), .IN2(n327), .QN(n329) );
  NAND2X0 U250 ( .IN1(n325), .IN2(n324), .QN(n330) );
  NAND2X0 U252 ( .IN1(n292), .IN2(n291), .QN(n299) );
  NAND2X0 U253 ( .IN1(n274), .IN2(n273), .QN(n292) );
  NAND2X0 U254 ( .IN1(n272), .IN2(n271), .QN(n274) );
  NAND2X0 U255 ( .IN1(n323), .IN2(n324), .QN(n332) );
  NAND2X0 U256 ( .IN1(n94), .IN2(n305), .QN(n322) );
  NAND2X0 U257 ( .IN1(n271), .IN2(n261), .QN(n270) );
  NAND2X0 U258 ( .IN1(n294), .IN2(n280), .QN(n156) );
  NAND2X0 U259 ( .IN1(n252), .IN2(n251), .QN(n253) );
  NAND2X0 U260 ( .IN1(n250), .IN2(n249), .QN(n252) );
  NAND2X1 U261 ( .IN1(n217), .IN2(n202), .QN(n244) );
  NOR2X2 U262 ( .IN1(n345), .IN2(io_result_val), .QN(n342) );
  NAND2X0 U263 ( .IN1(n263), .IN2(n261), .QN(n257) );
  NAND2X0 U266 ( .IN1(n55), .IN2(A[7]), .QN(n251) );
  NAND2X0 U267 ( .IN1(n271), .IN2(n273), .QN(n265) );
  NAND2X0 U272 ( .IN1(n327), .IN2(n331), .QN(n53) );
  NAND2X1 U273 ( .IN1(n52), .IN2(A[14]), .QN(n331) );
  NAND2X1 U274 ( .IN1(n74), .IN2(B[14]), .QN(n327) );
  NAND2X0 U275 ( .IN1(n170), .IN2(n98), .QN(n51) );
  NAND2X0 U276 ( .IN1(n75), .IN2(B[15]), .QN(n98) );
  NAND2X0 U277 ( .IN1(n50), .IN2(A[15]), .QN(n170) );
  NAND2X0 U278 ( .IN1(n71), .IN2(B[11]), .QN(n294) );
  NAND2X0 U279 ( .IN1(n73), .IN2(B[13]), .QN(n94) );
  NAND2X0 U280 ( .IN1(n185), .IN2(n187), .QN(n48) );
  NAND2X1 U281 ( .IN1(n47), .IN2(A[1]), .QN(n187) );
  NAND2X1 U282 ( .IN1(n42), .IN2(A[2]), .QN(n195) );
  NAND2X0 U283 ( .IN1(n81), .IN2(n221), .QN(n212) );
  NAND2X0 U284 ( .IN1(n40), .IN2(A[5]), .QN(n221) );
  NAND2X0 U285 ( .IN1(n39), .IN2(A[6]), .QN(n85) );
  NAND2X0 U286 ( .IN1(n307), .IN2(n305), .QN(n300) );
  NAND2X1 U287 ( .IN1(n72), .IN2(B[12]), .QN(n305) );
  NAND2X0 U289 ( .IN1(n203), .IN2(n172), .QN(n38) );
  INVX0 U291 ( .INP(io_result_rdy), .ZN(n35) );
  NOR2X0 U292 ( .IN1(n346), .IN2(reset), .QN(n26) );
  NOR2X0 U293 ( .IN1(n345), .IN2(n344), .QN(n346) );
  NOR2X0 U294 ( .IN1(io_result_val), .IN2(n343), .QN(n344) );
  NAND2X0 U295 ( .IN1(n349), .IN2(n352), .QN(N63) );
  NAND2X0 U296 ( .IN1(n348), .IN2(n352), .QN(N67) );
  INVX0 U297 ( .INP(sub_x_10_n82), .ZN(sub_x_10_n123) );
  INVX0 U298 ( .INP(n134), .ZN(sub_x_10_n126) );
  INVX0 U299 ( .INP(sub_x_10_n77), .ZN(sub_x_10_n122) );
  INVX0 U300 ( .INP(sub_x_10_n88), .ZN(sub_x_10_n90) );
  INVX0 U301 ( .INP(sub_x_10_n87), .ZN(sub_x_10_n89) );
  INVX0 U302 ( .INP(sub_x_10_n93), .ZN(sub_x_10_n124) );
  INVX0 U303 ( .INP(sub_x_10_n99), .ZN(sub_x_10_n97) );
  INVX0 U304 ( .INP(sub_x_10_n98), .ZN(sub_x_10_n96) );
  INVX0 U305 ( .INP(sub_x_10_n101), .ZN(sub_x_10_n100) );
  NAND2X0 U306 ( .IN1(n339), .IN2(state[1]), .QN(n340) );
  INVX0 U307 ( .INP(sub_x_10_n111), .ZN(sub_x_10_n128) );
  INVX0 U308 ( .INP(sub_x_10_n107), .ZN(sub_x_10_n127) );
  INVX0 U309 ( .INP(sub_x_10_n110), .ZN(sub_x_10_n109) );
  NOR2X0 U310 ( .IN1(n264), .IN2(n272), .QN(n266) );
  NOR2X0 U311 ( .IN1(n290), .IN2(n262), .QN(n264) );
  INVX0 U312 ( .INP(n261), .ZN(n262) );
  NOR2X0 U313 ( .IN1(n245), .IN2(n208), .QN(n209) );
  NOR2X0 U314 ( .IN1(n244), .IN2(n208), .QN(n211) );
  NOR2X0 U315 ( .IN1(n234), .IN2(n249), .QN(n235) );
  NOR2X0 U316 ( .IN1(n247), .IN2(n233), .QN(n234) );
  INVX0 U317 ( .INP(n233), .ZN(n230) );
  INVX0 U318 ( .INP(n217), .ZN(n218) );
  INVX0 U319 ( .INP(n193), .ZN(n194) );
  NOR2X0 U320 ( .IN1(n279), .IN2(n292), .QN(n276) );
  INVX0 U321 ( .INP(n165), .ZN(sub_x_10_n116) );
  INVX0 U322 ( .INP(sub_x_10_n65), .ZN(sub_x_10_n120) );
  INVX0 U324 ( .INP(sub_x_10_n70), .ZN(sub_x_10_n68) );
  INVX0 U325 ( .INP(n296), .ZN(sub_x_10_n118) );
  INVX0 U326 ( .INP(sub_x_10_n60), .ZN(sub_x_10_n62) );
  INVX0 U327 ( .INP(sub_x_10_n59), .ZN(sub_x_10_n61) );
  INVX0 U328 ( .INP(sub_x_10_n32), .ZN(sub_x_10_n30) );
  INVX0 U329 ( .INP(sub_x_10_n31), .ZN(sub_x_10_n29) );
  INVX0 U331 ( .INP(sub_x_10_n38), .ZN(sub_x_10_n117) );
  INVX0 U332 ( .INP(sub_x_10_n46), .ZN(sub_x_10_n44) );
  INVX0 U333 ( .INP(sub_x_10_n45), .ZN(sub_x_10_n43) );
  NOR2X0 U334 ( .IN1(n323), .IN2(n325), .QN(n301) );
  NOR2X0 U335 ( .IN1(n101), .IN2(n100), .QN(n102) );
  NOR2X0 U336 ( .IN1(n326), .IN2(n171), .QN(n101) );
  NOR2X0 U337 ( .IN1(n322), .IN2(n171), .QN(n95) );
  INVX0 U339 ( .INP(sub_x_10_n24), .ZN(sub_x_10_n22) );
  NOR2X0 U340 ( .IN1(n290), .IN2(n270), .QN(n279) );
  INVX0 U341 ( .INP(n322), .ZN(n313) );
  NOR2X0 U342 ( .IN1(n175), .IN2(n174), .QN(n176) );
  NOR2X0 U343 ( .IN1(n169), .IN2(n168), .QN(n175) );
  NOR2X0 U344 ( .IN1(n167), .IN2(n166), .QN(n169) );
  NOR2X0 U345 ( .IN1(n165), .IN2(n305), .QN(n167) );
  INVX0 U346 ( .INP(n307), .ZN(n162) );
  NOR2X0 U348 ( .IN1(n153), .IN2(n152), .QN(n154) );
  INVX0 U349 ( .INP(n151), .ZN(n153) );
  NOR2X0 U350 ( .IN1(n296), .IN2(n293), .QN(n151) );
  INVX0 U351 ( .INP(n146), .ZN(n147) );
  INVX0 U352 ( .INP(n242), .ZN(n143) );
  INVX0 U353 ( .INP(n140), .ZN(n141) );
  INVX0 U354 ( .INP(n134), .ZN(n137) );
  INVX0 U355 ( .INP(n202), .ZN(n135) );
  INVX0 U356 ( .INP(n326), .ZN(n328) );
  NOR2X0 U357 ( .IN1(n97), .IN2(n165), .QN(n326) );
  NOR2X0 U358 ( .IN1(n166), .IN2(n307), .QN(n97) );
  NOR2X0 U359 ( .IN1(n297), .IN2(n296), .QN(n298) );
  INVX0 U360 ( .INP(n295), .ZN(n297) );
  INVX0 U361 ( .INP(n156), .ZN(n291) );
  INVX0 U362 ( .INP(n263), .ZN(n272) );
  NOR2X0 U363 ( .IN1(n322), .IN2(n321), .QN(n324) );
  INVX0 U364 ( .INP(n327), .ZN(n321) );
  INVX0 U365 ( .INP(n288), .ZN(n289) );
  NOR2X0 U366 ( .IN1(n156), .IN2(n270), .QN(n288) );
  INVX0 U367 ( .INP(n86), .ZN(n250) );
  NOR2X0 U368 ( .IN1(n248), .IN2(n247), .QN(n254) );
  NOR2X0 U369 ( .IN1(n223), .IN2(n222), .QN(n247) );
  INVX0 U370 ( .INP(n221), .ZN(n222) );
  NOR2X0 U371 ( .IN1(n220), .IN2(n219), .QN(n223) );
  NOR2X0 U372 ( .IN1(n246), .IN2(n245), .QN(n255) );
  NOR2X0 U373 ( .IN1(n77), .IN2(n195), .QN(n78) );
  NOR2X0 U374 ( .IN1(n244), .IN2(n246), .QN(n256) );
  INVX0 U375 ( .INP(n184), .ZN(n186) );
  NOR2X0 U376 ( .IN1(n342), .IN2(sub_x_10_n143), .QN(io_result_bits_data[1])
         );
  NOR2X0 U377 ( .IN1(n342), .IN2(n63), .QN(io_result_bits_data[0]) );
  NOR2X0 U378 ( .IN1(n342), .IN2(sub_x_10_n141), .QN(io_result_bits_data[3])
         );
  NOR2X0 U379 ( .IN1(n342), .IN2(n65), .QN(io_result_bits_data[4]) );
  NOR2X0 U380 ( .IN1(n342), .IN2(n66), .QN(io_result_bits_data[5]) );
  NOR2X0 U381 ( .IN1(n342), .IN2(n67), .QN(io_result_bits_data[6]) );
  NOR2X0 U382 ( .IN1(n342), .IN2(n68), .QN(io_result_bits_data[7]) );
  NOR2X0 U383 ( .IN1(n342), .IN2(n69), .QN(io_result_bits_data[8]) );
  NOR2X0 U384 ( .IN1(n342), .IN2(n70), .QN(io_result_bits_data[9]) );
  NOR2X0 U385 ( .IN1(n342), .IN2(sub_x_10_n134), .QN(io_result_bits_data[10])
         );
  NOR2X0 U386 ( .IN1(n342), .IN2(n71), .QN(io_result_bits_data[11]) );
  NOR2X0 U387 ( .IN1(n342), .IN2(n72), .QN(io_result_bits_data[12]) );
  NOR2X0 U388 ( .IN1(n342), .IN2(n73), .QN(io_result_bits_data[13]) );
  NOR2X0 U389 ( .IN1(n342), .IN2(n74), .QN(io_result_bits_data[14]) );
  NOR2X0 U390 ( .IN1(n342), .IN2(n75), .QN(io_result_bits_data[15]) );
  NOR2X0 U391 ( .IN1(n342), .IN2(n64), .QN(io_result_bits_data[2]) );
  INVX0 U392 ( .INP(n257), .ZN(n58) );
  NOR2X0 U393 ( .IN1(n56), .IN2(n86), .QN(n237) );
  NOR2X0 U394 ( .IN1(n55), .IN2(A[7]), .QN(n86) );
  INVX0 U395 ( .INP(n251), .ZN(n56) );
  NOR2X0 U396 ( .IN1(n275), .IN2(n265), .QN(n59) );
  INVX0 U397 ( .INP(n293), .ZN(n282) );
  INVX0 U399 ( .INP(n53), .ZN(n316) );
  INVX0 U400 ( .INP(n51), .ZN(n333) );
  NOR2X0 U401 ( .IN1(n49), .IN2(n296), .QN(n284) );
  INVX0 U402 ( .INP(n294), .ZN(n49) );
  NOR2X0 U403 ( .IN1(n166), .IN2(n165), .QN(n309) );
  INVX0 U404 ( .INP(n94), .ZN(n166) );
  NOR2X0 U405 ( .IN1(n77), .IN2(n134), .QN(n197) );
  NOR2X0 U406 ( .IN1(n43), .IN2(n193), .QN(n189) );
  INVX0 U407 ( .INP(n195), .ZN(n43) );
  NOR2X0 U408 ( .IN1(n41), .IN2(n212), .QN(n45) );
  INVX0 U409 ( .INP(n220), .ZN(n81) );
  INVX0 U410 ( .INP(n225), .ZN(n41) );
  NOR2X0 U411 ( .IN1(n249), .IN2(n233), .QN(n225) );
  INVX0 U412 ( .INP(n85), .ZN(n249) );
  NOR2X0 U413 ( .IN1(state[0]), .IN2(state[1]), .QN(n172) );
  NOR2X0 U414 ( .IN1(n210), .IN2(n208), .QN(n203) );
  INVX0 U415 ( .INP(n219), .ZN(n210) );
  XOR2X1 U416 ( .IN1(A[0]), .IN2(B[0]), .Q(n178) );
  NOR3X0 U417 ( .IN1(n38), .IN2(n178), .IN3(n300), .QN(n46) );
  NAND4X0 U418 ( .IN1(n46), .IN2(n45), .IN3(n189), .IN4(n197), .QN(n62) );
  XOR2X1 U419 ( .IN1(n48), .IN2(n184), .Q(n181) );
  NAND4X0 U420 ( .IN1(n309), .IN2(n284), .IN3(n333), .IN4(n316), .QN(n61) );
  NAND3X0 U421 ( .IN1(n59), .IN2(n237), .IN3(n58), .QN(n60) );
  NOR4X0 U422 ( .IN1(n62), .IN2(n181), .IN3(n61), .IN4(n60), .QN(n345) );
  NAND3X0 U423 ( .IN1(n202), .IN2(n76), .IN3(n185), .QN(n79) );
  NAND3X0 U424 ( .IN1(n152), .IN2(n280), .IN3(n271), .QN(n90) );
  NAND3X0 U425 ( .IN1(n185), .IN2(A[0]), .IN3(n136), .QN(n138) );
  NAND4X0 U426 ( .IN1(n138), .IN2(n137), .IN3(n187), .IN4(n195), .QN(n139) );
  NAND3X0 U427 ( .IN1(n270), .IN2(n282), .IN3(n273), .QN(n157) );
  NOR3X0 U428 ( .IN1(n168), .IN2(n162), .IN3(n165), .QN(n163) );
  XOR2X1 U429 ( .IN1(n217), .IN2(n189), .Q(n190) );
  XOR2X1 U430 ( .IN1(n198), .IN2(n197), .Q(n199) );
  XOR2X1 U431 ( .IN1(n204), .IN2(n203), .Q(n205) );
  NOR3X0 U432 ( .IN1(n211), .IN2(n210), .IN3(n209), .QN(n213) );
  XOR2X1 U433 ( .IN1(n213), .IN2(n212), .Q(n214) );
  NAND3X0 U434 ( .IN1(n232), .IN2(n242), .IN3(n231), .QN(n224) );
  XOR2X1 U435 ( .IN1(n226), .IN2(n225), .Q(n227) );
  NAND4X0 U436 ( .IN1(n232), .IN2(n242), .IN3(n231), .IN4(n230), .QN(n236) );
  XOR2X1 U437 ( .IN1(n238), .IN2(n237), .Q(n239) );
  XOR2X1 U438 ( .IN1(n290), .IN2(n257), .Q(n258) );
  XOR2X1 U439 ( .IN1(n266), .IN2(n265), .Q(n267) );
  XOR2X1 U440 ( .IN1(n276), .IN2(n275), .Q(n277) );
  NAND3X0 U441 ( .IN1(n283), .IN2(n282), .IN3(n281), .QN(n285) );
  XOR2X1 U442 ( .IN1(n285), .IN2(n284), .Q(n286) );
  XOR2X1 U443 ( .IN1(n301), .IN2(n300), .Q(n302) );
  NAND3X0 U444 ( .IN1(n308), .IN2(n307), .IN3(n306), .QN(n310) );
  XOR2X1 U445 ( .IN1(n310), .IN2(n309), .Q(n311) );
  NAND3X0 U446 ( .IN1(n315), .IN2(n326), .IN3(n314), .QN(n317) );
  XOR2X1 U447 ( .IN1(n317), .IN2(n316), .Q(n318) );
  NAND4X0 U448 ( .IN1(n332), .IN2(n331), .IN3(n330), .IN4(n329), .QN(n334) );
  XOR2X1 U449 ( .IN1(n334), .IN2(n333), .Q(n336) );
  NAND3X0 U450 ( .IN1(n342), .IN2(n341), .IN3(n340), .QN(n27) );
  NOR2X0 U452 ( .IN1(state[0]), .IN2(n350), .QN(io_operands_rdy) );
  INVX0 U100 ( .INP(n351), .ZN(n352) );
  NAND2X1 U198 ( .IN1(n103), .IN2(n102), .QN(n348) );
  INVX0 U116 ( .INP(reset), .ZN(n341) );
  NOR2X0 U85 ( .IN1(n44), .IN2(A[3]), .QN(n77) );
  NOR2X0 U106 ( .IN1(n78), .IN2(n134), .QN(n245) );
  NAND2X0 U234 ( .IN1(n161), .IN2(n160), .QN(n164) );
  NAND2X0 U232 ( .IN1(n164), .IN2(n163), .QN(n177) );
  NOR2X1 U197 ( .IN1(n348), .IN2(reset), .QN(n131) );
  NAND2X0 U271 ( .IN1(sub_x_10_n134), .IN2(B[10]), .QN(n280) );
  NAND2X0 U270 ( .IN1(n282), .IN2(n280), .QN(n275) );
  NAND2X0 U239 ( .IN1(n150), .IN2(n149), .QN(n155) );
  NOR2X0 U109 ( .IN1(n73), .IN2(B[13]), .QN(n165) );
  NAND2X0 U290 ( .IN1(n36), .IN2(A[4]), .QN(n219) );
  NOR2X0 U398 ( .IN1(sub_x_10_n134), .IN2(B[10]), .QN(n293) );
  NAND2X0 U227 ( .IN1(io_operands_rdy), .IN2(io_operands_val), .QN(n339) );
  NAND2X0 U226 ( .IN1(n339), .IN2(n341), .QN(n351) );
  NAND2X0 U288 ( .IN1(n37), .IN2(A[12]), .QN(n307) );
  NAND2X0 U265 ( .IN1(n57), .IN2(A[8]), .QN(n263) );
  NAND2X0 U268 ( .IN1(n54), .IN2(A[9]), .QN(n273) );
  NAND2X0 U269 ( .IN1(n70), .IN2(B[9]), .QN(n271) );
  NAND2X0 U264 ( .IN1(n69), .IN2(B[8]), .QN(n261) );
  NAND2X0 U251 ( .IN1(n299), .IN2(n298), .QN(n325) );
  NAND2X0 U213 ( .IN1(n187), .IN2(n184), .QN(n76) );
  NAND2X0 sub_x_10_U120 ( .IN1(n65), .IN2(B[4]), .QN(sub_x_10_n99) );
  AO21X1 U105 ( .IN1(sub_x_10_n1), .IN2(sub_x_10_n18), .IN3(sub_x_10_n19), .Q(
        sub_x_10_n17) );
endmodule

