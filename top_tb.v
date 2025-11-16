`timescale 1ns / 1ps
module top_tb;

reg clk, rst;
reg [7: 0] multiplicand;
reg [3: 0] multiplier;

wire [7: 0] product;
wire cout;

// top(clk, rst, multiplicand, multiplier, product, cout);
top dut(clk, rst, multiplicand, multiplier, product, cout);

initial clk = 1'b0;
always #5 clk <= ~clk;

initial begin
    rst = 0;
    #2 rst = 1;
    multiplicand = 8'b1111_1010;
    multiplier = 8'b0000_0110;
    #50;
    $finish;
end

initial begin
        $dumpfile("top.vcd");
        $dumpvars(0);
end
endmodule
