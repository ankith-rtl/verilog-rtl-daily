//clk div test bench stimulus application for checking the functionality of the clk divider


//`define "clk_divider.v"
`timescale 1ns/1ps
module clk_div_1tb();
reg clk,rstn,enable;
wire clk_en;

clk_div_1 u1(.clk(clk), .enable(enable), .clk_en(clk_en), .rstn(rstn));

always #5 clk=~clk;

initial begin
clk=0;
rstn=0;
enable=0;

#50 enable=1;
#5 rstn=1;
#400
rstn=0;

#150 rstn=1;
#65 enable =0;
#155 enable=1;

#200 rstn=0;
enable=1;

#100
$finish;
end

initial begin
    $monitor("t=%0t clk=%b rst=%b en=%b clk_en=%b",
              $time, clk, rstn, enable, clk_en);
end

initial begin
    $dumpfile("clk_divider_wave1.vcd");
    $dumpvars(0, clk_div_1tb);
end

endmodule