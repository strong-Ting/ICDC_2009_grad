/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sun Feb 21 14:14:29 2021
/////////////////////////////////////////////////////////////


module NFC_DW01_add_0 ( A, B, CI, SUM, CO );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4;
  wire   [6:1] carry;

  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFHX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  CLKAND2X8 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2XL U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  NAND2X1 U3 ( .A(B[2]), .B(carry[2]), .Y(n2) );
  NAND2X1 U4 ( .A(A[2]), .B(carry[2]), .Y(n3) );
  NAND2X1 U5 ( .A(A[2]), .B(B[2]), .Y(n4) );
  NAND3X1 U6 ( .A(n2), .B(n3), .C(n4), .Y(carry[3]) );
  XOR3XL U7 ( .A(carry[2]), .B(A[2]), .C(B[2]), .Y(SUM[2]) );
endmodule


module NFC_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module NFC ( clk, rst, cmd, done, M_RW, M_A, M_D, F_IO, F_CLE, F_ALE, F_REN, 
        F_WEN, F_RB );
  input [32:0] cmd;
  output [6:0] M_A;
  inout [7:0] M_D;
  inout [7:0] F_IO;
  input clk, rst, F_RB;
  output done, M_RW, F_CLE, F_ALE, F_REN, F_WEN;
  wire   n137, n138, n139, n140, n141, n142, N156, N157, N180, N181, N182,
         N183, N184, N185, N186, N195, N196, N197, N198, N199, N200, N201,
         N203, N204, N205, N206, N207, N208, N209, n12, n13, n14, n15, n16,
         n17, n18, n19, n21, n25, n26, n27, n28, n29, n32, n34, n35, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n49, n50, n51, n52, n53,
         n54, n55, n56, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n73, n74, n76, n77, n78, n79, n80, n82, n89, n91, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n106, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n128, n129, n130, n131, n132, n133, n134, n135, n136;
  wire   [3:0] ns;
  wire   [3:0] ns_f;
  wire   [6:0] len_counter;
  assign M_RW = 1'b1;
  assign F_ALE = N157;

  TBUFX16 \M_D_tri[0]  ( .A(1'b0), .OE(1'b0), .Y(M_D[0]) );
  TBUFX16 \M_D_tri[1]  ( .A(1'b0), .OE(1'b0), .Y(M_D[1]) );
  TBUFX16 \M_D_tri[2]  ( .A(1'b0), .OE(1'b0), .Y(M_D[2]) );
  TBUFX16 \M_D_tri[3]  ( .A(1'b0), .OE(1'b0), .Y(M_D[3]) );
  TBUFX16 \M_D_tri[4]  ( .A(1'b0), .OE(1'b0), .Y(M_D[4]) );
  TBUFX16 \M_D_tri[5]  ( .A(1'b0), .OE(1'b0), .Y(M_D[5]) );
  TBUFX16 \M_D_tri[6]  ( .A(1'b0), .OE(1'b0), .Y(M_D[6]) );
  TBUFX16 \M_D_tri[7]  ( .A(1'b0), .OE(1'b0), .Y(M_D[7]) );
  TBUFX16 \F_IO_tri[0]  ( .A(n89), .OE(n114), .Y(F_IO[0]) );
  TBUFX16 \F_IO_tri[1]  ( .A(n124), .OE(n114), .Y(F_IO[1]) );
  TBUFX16 \F_IO_tri[2]  ( .A(n123), .OE(n114), .Y(F_IO[2]) );
  TBUFX16 \F_IO_tri[3]  ( .A(n122), .OE(n114), .Y(F_IO[3]) );
  TBUFX16 \F_IO_tri[4]  ( .A(n121), .OE(n114), .Y(F_IO[4]) );
  TBUFX16 \F_IO_tri[5]  ( .A(n120), .OE(n114), .Y(F_IO[5]) );
  TBUFX16 \F_IO_tri[6]  ( .A(n119), .OE(n114), .Y(F_IO[6]) );
  TBUFX16 \F_IO_tri[7]  ( .A(n118), .OE(n114), .Y(F_IO[7]) );
  NAND2X4 U65 ( .A(clk), .B(n114), .Y(F_WEN) );
  NAND2BX4 U66 ( .AN(clk), .B(n19), .Y(F_REN) );
  DFFRX1 \len_counter_reg[6]  ( .D(N201), .CK(clk), .RN(n116), .Q(
        len_counter[6]), .QN(n76) );
  DFFRX1 \len_counter_reg[5]  ( .D(N200), .CK(clk), .RN(n116), .Q(
        len_counter[5]), .QN(n78) );
  DFFRX1 \len_counter_reg[4]  ( .D(N199), .CK(clk), .RN(n116), .Q(
        len_counter[4]), .QN(n77) );
  DFFRX1 \len_counter_reg[1]  ( .D(N196), .CK(clk), .RN(n116), .Q(
        len_counter[1]) );
  DFFRX1 \len_counter_reg[3]  ( .D(N198), .CK(clk), .RN(n116), .Q(
        len_counter[3]) );
  DFFRX1 \len_counter_reg[0]  ( .D(N195), .CK(clk), .RN(n116), .Q(
        len_counter[0]) );
  DFFRX1 \len_counter_reg[2]  ( .D(N197), .CK(clk), .RN(n116), .Q(
        len_counter[2]) );
  DFFRX1 \cs_reg[3]  ( .D(ns[3]), .CK(clk), .RN(n116), .Q(n136), .QN(n91) );
  DFFRX1 \cs_reg[2]  ( .D(ns[2]), .CK(clk), .RN(n116), .Q(n135), .QN(n93) );
  DFFRX1 \cs_reg[1]  ( .D(ns[1]), .CK(clk), .RN(n116), .Q(n130), .QN(n94) );
  DFFRX1 \cs_reg[0]  ( .D(ns[0]), .CK(clk), .RN(n116), .QN(n79) );
  DFFRX1 \cs_f_reg[1]  ( .D(ns_f[1]), .CK(clk), .RN(n116), .QN(n96) );
  DFFRX1 \cs_f_reg[2]  ( .D(ns_f[2]), .CK(clk), .RN(n116), .QN(n95) );
  DFFRX1 \cs_f_reg[3]  ( .D(ns_f[3]), .CK(clk), .RN(n116), .QN(n80) );
  DFFRX1 \cs_f_reg[0]  ( .D(ns_f[0]), .CK(clk), .RN(n116), .Q(n133), .QN(n97)
         );
  INVXL U106 ( .A(n82), .Y(n98) );
  OAI211XL U107 ( .A0(n97), .A1(n25), .B0(n128), .C0(n106), .Y(n82) );
  CLKINVX1 U108 ( .A(n98), .Y(n99) );
  AND2XL U109 ( .A(n128), .B(n17), .Y(N156) );
  INVXL U110 ( .A(n100), .Y(n101) );
  INVXL U111 ( .A(F_RB), .Y(n100) );
  DLY4X1 U112 ( .A(n101), .Y(n102) );
  NOR2BXL U113 ( .AN(n21), .B(n14), .Y(ns_f[1]) );
  BUFX12 U114 ( .A(n137), .Y(M_A[5]) );
  INVX20 U115 ( .A(n103), .Y(M_A[6]) );
  NAND2X2 U116 ( .A(N209), .B(n113), .Y(n103) );
  INVX12 U117 ( .A(n29), .Y(done) );
  INVX12 U118 ( .A(N156), .Y(F_CLE) );
  AND2X2 U119 ( .A(N208), .B(n113), .Y(n137) );
  AND2X2 U120 ( .A(n134), .B(n12), .Y(n106) );
  INVX12 U121 ( .A(n106), .Y(N157) );
  NAND2XL U122 ( .A(n15), .B(n16), .Y(n13) );
  AOI21XL U123 ( .A0(n25), .A1(n26), .B0(n14), .Y(ns_f[0]) );
  NOR3BXL U124 ( .AN(n80), .B(n96), .C(n95), .Y(n59) );
  AOI32XL U125 ( .A0(n15), .A1(n133), .A2(cmd[31]), .B0(cmd[22]), .B1(n131), 
        .Y(n73) );
  NOR2BX1 U126 ( .AN(n61), .B(n96), .Y(n19) );
  AND3XL U127 ( .A(n80), .B(n133), .C(n95), .Y(n61) );
  CLKBUFX3 U128 ( .A(n43), .Y(n115) );
  NAND2XL U129 ( .A(n97), .B(n59), .Y(n35) );
  NAND2XL U130 ( .A(n102), .B(n133), .Y(n16) );
  CLKINVX1 U131 ( .A(n37), .Y(n129) );
  CLKINVX1 U132 ( .A(n65), .Y(n128) );
  NOR2X2 U133 ( .A(n12), .B(n129), .Y(n64) );
  CLKINVX1 U134 ( .A(n115), .Y(n113) );
  NAND2X1 U135 ( .A(n59), .B(n133), .Y(n12) );
  CLKINVX1 U136 ( .A(n15), .Y(n134) );
  OR2X1 U137 ( .A(ns[0]), .B(ns[1]), .Y(n14) );
  CLKINVX1 U138 ( .A(n46), .Y(n126) );
  OAI211X1 U139 ( .A0(n115), .A1(n27), .B0(n39), .C0(n40), .Y(n46) );
  AOI21X1 U140 ( .A0(n17), .A1(n18), .B0(n14), .Y(ns_f[2]) );
  NAND2X1 U141 ( .A(n19), .B(n125), .Y(n18) );
  NAND2X1 U142 ( .A(n19), .B(n27), .Y(n26) );
  AOI21X1 U143 ( .A0(n12), .A1(n13), .B0(n14), .Y(ns_f[3]) );
  CLKINVX1 U144 ( .A(n27), .Y(n125) );
  OAI211X1 U145 ( .A0(n16), .A1(n134), .B0(n17), .C0(n132), .Y(n21) );
  NOR2X2 U146 ( .A(n129), .B(n135), .Y(n65) );
  NOR2X1 U147 ( .A(n42), .B(n130), .Y(n37) );
  NOR3X2 U148 ( .A(n129), .B(n133), .C(n134), .Y(n63) );
  NOR2X1 U149 ( .A(n135), .B(n130), .Y(n34) );
  NAND2X1 U150 ( .A(n34), .B(n47), .Y(n29) );
  AND2X2 U151 ( .A(n115), .B(n132), .Y(n60) );
  CLKINVX1 U152 ( .A(n19), .Y(n132) );
  NOR2BX1 U153 ( .AN(N185), .B(n60), .Y(N200) );
  NOR2BX1 U154 ( .AN(N184), .B(n60), .Y(N199) );
  NOR2BX1 U155 ( .AN(N183), .B(n60), .Y(N198) );
  NOR2BX1 U156 ( .AN(N182), .B(n60), .Y(N197) );
  NOR2BX1 U157 ( .AN(N181), .B(n60), .Y(N196) );
  OAI211X1 U158 ( .A0(n73), .A1(n129), .B0(n128), .C0(n74), .Y(n89) );
  AOI22X1 U159 ( .A0(cmd[14]), .A1(n64), .B0(cmd[23]), .B1(n63), .Y(n74) );
  CLKINVX1 U160 ( .A(n17), .Y(n131) );
  NAND2X1 U161 ( .A(n95), .B(n96), .Y(n25) );
  NOR2X1 U162 ( .A(n25), .B(n80), .Y(n15) );
  CLKINVX1 U163 ( .A(n62), .Y(n118) );
  AOI221XL U164 ( .A0(cmd[30]), .A1(n63), .B0(cmd[21]), .B1(n64), .C0(n65), 
        .Y(n62) );
  CLKINVX1 U165 ( .A(n66), .Y(n119) );
  AOI221XL U166 ( .A0(cmd[29]), .A1(n63), .B0(cmd[20]), .B1(n64), .C0(n65), 
        .Y(n66) );
  CLKINVX1 U167 ( .A(n67), .Y(n120) );
  AOI221XL U168 ( .A0(cmd[28]), .A1(n63), .B0(cmd[19]), .B1(n64), .C0(n65), 
        .Y(n67) );
  CLKINVX1 U169 ( .A(n68), .Y(n121) );
  AOI221XL U170 ( .A0(cmd[27]), .A1(n63), .B0(cmd[18]), .B1(n64), .C0(n65), 
        .Y(n68) );
  CLKINVX1 U171 ( .A(n69), .Y(n122) );
  AOI221XL U172 ( .A0(cmd[26]), .A1(n63), .B0(cmd[17]), .B1(n64), .C0(n65), 
        .Y(n69) );
  CLKINVX1 U173 ( .A(n70), .Y(n123) );
  AOI221XL U174 ( .A0(cmd[25]), .A1(n63), .B0(cmd[16]), .B1(n64), .C0(n65), 
        .Y(n70) );
  CLKINVX1 U175 ( .A(n71), .Y(n124) );
  AOI221XL U176 ( .A0(cmd[24]), .A1(n63), .B0(cmd[15]), .B1(n64), .C0(n65), 
        .Y(n71) );
  CLKBUFX3 U177 ( .A(n99), .Y(n114) );
  XOR2X1 U178 ( .A(len_counter[1]), .B(cmd[1]), .Y(n56) );
  OAI211X1 U179 ( .A0(n28), .A1(n117), .B0(n126), .C0(n32), .Y(ns[2]) );
  AOI33X1 U180 ( .A0(n79), .A1(n136), .A2(n34), .B0(n35), .B1(n135), .B2(n37), 
        .Y(n32) );
  CLKINVX1 U181 ( .A(cmd[32]), .Y(n117) );
  NAND4X1 U182 ( .A(n49), .B(n50), .C(n51), .D(n52), .Y(n27) );
  XOR2X1 U183 ( .A(n76), .B(cmd[6]), .Y(n49) );
  XOR2X1 U184 ( .A(n78), .B(cmd[5]), .Y(n50) );
  XOR2X1 U185 ( .A(n77), .B(cmd[4]), .Y(n51) );
  NOR4X1 U186 ( .A(n53), .B(n54), .C(n55), .D(n56), .Y(n52) );
  XOR2X1 U187 ( .A(len_counter[3]), .B(cmd[3]), .Y(n53) );
  XOR2X1 U188 ( .A(len_counter[0]), .B(cmd[0]), .Y(n54) );
  XOR2X1 U189 ( .A(len_counter[2]), .B(cmd[2]), .Y(n55) );
  NAND4BX1 U190 ( .AN(n38), .B(n39), .C(n40), .D(n41), .Y(ns[1]) );
  AOI211X1 U191 ( .A0(n35), .A1(n94), .B0(n93), .C0(n42), .Y(n38) );
  AOI2BB2X1 U192 ( .B0(n42), .B1(n34), .A0N(n115), .A1N(n125), .Y(n41) );
  NAND3BX1 U193 ( .AN(n44), .B(n45), .C(n126), .Y(ns[0]) );
  OA22X1 U194 ( .A0(n93), .A1(n91), .B0(n79), .B1(n94), .Y(n45) );
  OAI221XL U195 ( .A0(n28), .A1(cmd[32]), .B0(n35), .B1(n129), .C0(n128), .Y(
        n44) );
  NAND2X1 U196 ( .A(n79), .B(n91), .Y(n42) );
  OAI21XL U197 ( .A0(cmd[32]), .A1(n28), .B0(n29), .Y(ns[3]) );
  NAND2X1 U198 ( .A(n61), .B(n96), .Y(n17) );
  NOR2X1 U199 ( .A(n136), .B(n79), .Y(n47) );
  NAND3BX1 U200 ( .AN(n42), .B(n93), .C(n130), .Y(n43) );
  NAND4X1 U201 ( .A(n79), .B(n93), .C(n130), .D(n136), .Y(n28) );
  NAND3X1 U202 ( .A(n47), .B(n130), .C(n93), .Y(n39) );
  NAND3X1 U203 ( .A(n47), .B(n135), .C(n94), .Y(n40) );
  NOR2BX1 U204 ( .AN(N186), .B(n60), .Y(N201) );
  NOR2BX1 U205 ( .AN(N180), .B(n60), .Y(N195) );
  INVX3 U206 ( .A(rst), .Y(n116) );
  BUFX12 U207 ( .A(n142), .Y(M_A[0]) );
  NOR2BX1 U208 ( .AN(N203), .B(n115), .Y(n142) );
  BUFX12 U209 ( .A(n141), .Y(M_A[1]) );
  NOR2BX1 U210 ( .AN(N204), .B(n115), .Y(n141) );
  BUFX12 U211 ( .A(n140), .Y(M_A[2]) );
  NOR2BX1 U212 ( .AN(N205), .B(n115), .Y(n140) );
  BUFX12 U213 ( .A(n139), .Y(M_A[3]) );
  NOR2BX1 U214 ( .AN(N206), .B(n115), .Y(n139) );
  BUFX12 U215 ( .A(n138), .Y(M_A[4]) );
  NOR2BX1 U216 ( .AN(N207), .B(n115), .Y(n138) );
  NFC_DW01_add_0 add_219_S2 ( .A(len_counter), .B(cmd[13:7]), .CI(1'b0), .SUM(
        {N209, N208, N207, N206, N205, N204, N203}) );
  NFC_DW01_inc_0 r377 ( .A(len_counter), .SUM({N186, N185, N184, N183, N182, 
        N181, N180}) );
endmodule

