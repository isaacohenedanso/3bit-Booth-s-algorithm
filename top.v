module top(clk, rst, multiplicand, multiplier, product, cout);
input [7: 0] multiplicand;
input [3: 0] multiplier;
input clk, rst;
output [7: 0] product;
output cout;

wire [3: 0] ALUop;
wire [2: 0] to_cmp0, to_cmp1, Tshift_amount, shift_amount;
wire load, muxsel, shift_direction, out_enable;

// CU(clk, rst, load, muxsel, cmp0, cmp1, shift_direction, Tshift_amount, shift_amount, ALUop, out_enable);
CU CU1(clk, rst, load, muxsel, to_cmp0, to_cmp1, shift_direction, Tshift_amount, shift_amount, ALUop, out_enable);

// DP(clk, rst, load, muxsel, multiplicand, multiplier, product, cmp0, cmp1, out_enable, ALUop, shift_direction, Tshift_amount, shift_amount, Cout);
DP DP1(clk, rst, load, muxsel, multiplicand, multiplier, product, to_cmp0, to_cmp1, out_enable, ALUop, shift_direction, Tshift_amount, shift_amount, Cout);

endmodule
