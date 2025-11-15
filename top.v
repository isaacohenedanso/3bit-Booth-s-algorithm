module top(clk, rst, multiplicand, multiplier, product);
input [7: 0] multiplicand;
input [3: 0] multiplier;
input clk, rst;
output [8: 0] product;

wire [2: 0] to_cmp0, to_cmp1, Tshift_amount, shift_amount, ALUop;
wire load, muxsel, shift_direction, out_enable;


CU CU1(.clk(clk), .rst(rst), .load(load), .muxsel(muxsel), .cmp0(to_cmp0), .cmp1(to_cmp1), .shift_direction(shift_direction), .Tshift_amount(Tshift_amount), .shift_amount(shift_amount), .ALUop(ALUop), .out_enable(out_enable));

DP DP1(.clk(clk), .rst(rst), .load(load), .muxsel(muxsel), .multiplicand(multiplicand), .multiplier(multiplier), .product(product), .cmp0(to_cmp0), .cmp1(to_cmp1), .out_enable(out_enable), .ALUop(ALUop), .shift_direction(shift_direction), .Tshift_amount(Tshift_amount), .shift_amount(shift_amount));

endmodule
