`timescale 1ns / 1ps;
module alu_tb;

reg [7: 0]Y, X;
reg [3: 0] S;
reg [2: 0] shift_amount;
reg shift_direction;

wire [7: 0] Outp;
wire Cout;

// alu(X, Y, S, shift_amount, shift_direction, Outp, Cout);
alu dut(X, Y, S, shift_amount, shift_direction, Outp, Cout);

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0);
end

initial begin
     Y = 8'd10;  X = 8'd5;   S = 4'b0000;  shift_amount = 3'd0;  shift_direction = 1'b0;
        #10;
        Y = 8'd20;  X = 8'd7;   S = 4'b1001;  shift_amount = 3'd1;  shift_direction = 1'b0;
        #10;
        Y = 8'd50;  X = 8'd25;  S = 4'b0010;  shift_amount = 3'd2;  shift_direction = 1'b1;
        #10;
        Y = 8'd100; X = 8'd200; S = 4'b0011;  shift_amount = 3'd3;  shift_direction = 1'b1;
        #10;

        $finish;
end
endmodule

