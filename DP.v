module DP(clk, rst, load, muxsel, multiplicand, multiplier, product, cmp0, cmp1, out_enable, ALUop, shift_direction, Tshift_amount, shift_amount, Cout);
input signed [7: 0] multiplicand;
input [3: 0] multiplier;
input [3: 0] ALUop;
input [2: 0] Tshift_amount, shift_amount;
input clk, rst, load, muxsel, out_enable, shift_direction;
output [7: 0] product;
output [2: 0] cmp0, cmp1;
output Cout;

wire [7: 0] fromP,  to_A, to_ALU_A, fromALU;

// comparator(X, Y);
comparator compare0({multiplier[1:0],1'b0}, cmp0);
comparator compare1(multiplier[3:1], cmp1);

// mux8(A, B, sel, outp);
mux8 mux (multiplicand, 8'b0, muxsel, to_A);

// shifter(data, shamt, shdir, outp);
shifter Tshift (to_A, Tshift_amount, shift_direction, to_ALU_A);

// alu(X, Y, S, shift_amount, shift_direction, Outp, Cout);
alu alu1(fromP, to_ALU_A, ALUop, shift_amount, shift_direction, fromALU, Cout);

// tribuffer(X, en, Y);
assign product = (out_enable)? fromALU : 8'bZ;

register #(8) regP(clk, rst, load, fromALU, fromP);

endmodule
