`timescale 1ns/10ps

module SRAM2RW128x16 ( A1, CE1, WEB1, OEB1, CSB1, I1, O1, A2, CE2, WEB2, OEB2, CSB2, I2, O2 );
input CE1;
input WEB1;
input OEB1;
input CSB1;
input [6:0] A1;
input [15:0] I1;
output [15:0] O1;
input CE2;
input WEB2;
input OEB2;
input CSB2;
input [6:0] A2;
input [15:0] I2;
output [15:0] O2;

reg notifier;

specify
$setuphold(posedge CE1, WEB1, 0, 0, notifier);
$setuphold(posedge CE1, OEB1, 0, 0, notifier);
$setuphold(posedge CE1, CSB1, 0, 0, notifier);
$setuphold(posedge CE1, A1[0], 0, 0, notifier);
$setuphold(posedge CE1, A1[1], 0, 0, notifier);
$setuphold(posedge CE1, A1[2], 0, 0, notifier);
$setuphold(posedge CE1, A1[3], 0, 0, notifier);
$setuphold(posedge CE1, A1[4], 0, 0, notifier);
$setuphold(posedge CE1, A1[5], 0, 0, notifier);
$setuphold(posedge CE1, A1[6], 0, 0, notifier);
$setuphold(posedge CE1, I1[0], 0, 0, notifier);
$setuphold(posedge CE1, I1[1], 0, 0, notifier);
$setuphold(posedge CE1, I1[2], 0, 0, notifier);
$setuphold(posedge CE1, I1[3], 0, 0, notifier);
$setuphold(posedge CE1, I1[4], 0, 0, notifier);
$setuphold(posedge CE1, I1[5], 0, 0, notifier);
$setuphold(posedge CE1, I1[6], 0, 0, notifier);
$setuphold(posedge CE1, I1[7], 0, 0, notifier);
$setuphold(posedge CE1, I1[8], 0, 0, notifier);
$setuphold(posedge CE1, I1[9], 0, 0, notifier);
$setuphold(posedge CE1, I1[10], 0, 0, notifier);
$setuphold(posedge CE1, I1[11], 0, 0, notifier);
$setuphold(posedge CE1, I1[12], 0, 0, notifier);
$setuphold(posedge CE1, I1[13], 0, 0, notifier);
$setuphold(posedge CE1, I1[14], 0, 0, notifier);
$setuphold(posedge CE1, I1[15], 0, 0, notifier);
(posedge CE1 => O1[0]) = (0, 0);
(posedge CE1 => O1[1]) = (0, 0);
(posedge CE1 => O1[2]) = (0, 0);
(posedge CE1 => O1[3]) = (0, 0);
(posedge CE1 => O1[4]) = (0, 0);
(posedge CE1 => O1[5]) = (0, 0);
(posedge CE1 => O1[6]) = (0, 0);
(posedge CE1 => O1[7]) = (0, 0);
(posedge CE1 => O1[8]) = (0, 0);
(posedge CE1 => O1[9]) = (0, 0);
(posedge CE1 => O1[10]) = (0, 0);
(posedge CE1 => O1[11]) = (0, 0);
(posedge CE1 => O1[12]) = (0, 0);
(posedge CE1 => O1[13]) = (0, 0);
(posedge CE1 => O1[14]) = (0, 0);
(posedge CE1 => O1[15]) = (0, 0);
$setuphold(posedge CE2, WEB2, 0, 0, notifier);
$setuphold(posedge CE2, OEB2, 0, 0, notifier);
$setuphold(posedge CE2, CSB2, 0, 0, notifier);
$setuphold(posedge CE2, A2[0], 0, 0, notifier);
$setuphold(posedge CE2, A2[1], 0, 0, notifier);
$setuphold(posedge CE2, A2[2], 0, 0, notifier);
$setuphold(posedge CE2, A2[3], 0, 0, notifier);
$setuphold(posedge CE2, A2[4], 0, 0, notifier);
$setuphold(posedge CE2, A2[5], 0, 0, notifier);
$setuphold(posedge CE2, A2[6], 0, 0, notifier);
$setuphold(posedge CE2, I2[0], 0, 0, notifier);
$setuphold(posedge CE2, I2[1], 0, 0, notifier);
$setuphold(posedge CE2, I2[2], 0, 0, notifier);
$setuphold(posedge CE2, I2[3], 0, 0, notifier);
$setuphold(posedge CE2, I2[4], 0, 0, notifier);
$setuphold(posedge CE2, I2[5], 0, 0, notifier);
$setuphold(posedge CE2, I2[6], 0, 0, notifier);
$setuphold(posedge CE2, I2[7], 0, 0, notifier);
$setuphold(posedge CE2, I2[8], 0, 0, notifier);
$setuphold(posedge CE2, I2[9], 0, 0, notifier);
$setuphold(posedge CE2, I2[10], 0, 0, notifier);
$setuphold(posedge CE2, I2[11], 0, 0, notifier);
$setuphold(posedge CE2, I2[12], 0, 0, notifier);
$setuphold(posedge CE2, I2[13], 0, 0, notifier);
$setuphold(posedge CE2, I2[14], 0, 0, notifier);
$setuphold(posedge CE2, I2[15], 0, 0, notifier);
(posedge CE2 => O2[0]) = (0, 0);
(posedge CE2 => O2[1]) = (0, 0);
(posedge CE2 => O2[2]) = (0, 0);
(posedge CE2 => O2[3]) = (0, 0);
(posedge CE2 => O2[4]) = (0, 0);
(posedge CE2 => O2[5]) = (0, 0);
(posedge CE2 => O2[6]) = (0, 0);
(posedge CE2 => O2[7]) = (0, 0);
(posedge CE2 => O2[8]) = (0, 0);
(posedge CE2 => O2[9]) = (0, 0);
(posedge CE2 => O2[10]) = (0, 0);
(posedge CE2 => O2[11]) = (0, 0);
(posedge CE2 => O2[12]) = (0, 0);
(posedge CE2 => O2[13]) = (0, 0);
(posedge CE2 => O2[14]) = (0, 0);
(posedge CE2 => O2[15]) = (0, 0);
endspecify

reg [15:0] memory[127:0];
reg [15:0] data_out1;
always @ (posedge CE1)
begin
  if (~CSB1 & WEB1)
    data_out1 <= memory[A1];
  else if (~CSB1 & ~WEB1)
  begin
    memory[A1] <= I1;
  end
end

assign O1 = OEB1 ? 16'bz : data_out1;
reg [15:0] data_out2;
always @ (posedge CE2)
begin
  if (~CSB2 & WEB2)
    data_out2 <= memory[A2];
  else if (~CSB2 & ~WEB2)
  begin
    memory[A2] <= I2;
  end
end

assign O2 = OEB2 ? 16'bz : data_out2;

endmodule
