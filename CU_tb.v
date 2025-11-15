`timescale 1ns/1ps
module CU_tb;

    reg clk;
    reg rst;
    reg [2:0] cmp0, cmp1;
    wire load, muxsel, out_enable, shift_direction;
    wire [2:0] ALUop, shift_amount;

    CU dut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .muxsel(muxsel),
        .cmp0(cmp0),
        .cmp1(cmp1),
        .shift_direction(shift_direction),
        .shift_amount(shift_amount),
        .ALUop(ALUop),
        .out_enable(out_enable)
    );

    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        rst = 0;
        #5 rst = 1;
        cmp0 = 3'b100;
        cmp1 = 3'b000;
        #40;
        $finish;
    end

    // Monitor all relevant outputs
    initial begin
        $dumpfile("cu.vcd");
        $dumpvars(0);
    end

endmodule
