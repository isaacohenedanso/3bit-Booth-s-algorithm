module DP(clk, rst, load, muxsel, multiplicand, multiplier, product, cmp0, cmp1, out_enable, ALUop, shift_direction, Tshift_amount, shift_amount);
input signed [7: 0] multiplicand;
input [3: 0] multiplier;
input [2: 0] ALUop, Tshift_amount, shift_amount;
input clk, rst, load, muxsel, out_enable, shift_direction;
output [8: 0] product;
output [2: 0] cmp0, cmp1;

wire [8: 0] fromALU, to_ALU_A;
wire [7: 0] fromP,  to_A;


comparator compare0({multiplier[1:0],1'b0}, cmp0);
comparator compare1(multiplier[3:1], cmp1);

// register #(4) regQ(clk, rst, load, multiplier, fromQ);
// register #(8) regM(clk, rst, load, multiplicand, fromM);

mux8 mux (multiplicand, 8'b0, muxsel, to_A);

assign to_ALU_A = (shift_direction)? (to_A >> Tshift_amount) : (to_A << Tshift_amount);


shifter Tshift ({1'b0, to_A}, Tshift_amount, shift_direction, to_ALU_A);

alu alu1(to_ALU_A[7: 0], fromP, ALUop, shift_direction, shift_amount,fromALU);

assign product = (out_enable)? fromALU : 9'bZ;

register #(8) regP(clk, rst, load, fromALU[7: 0], fromP);

endmodule
