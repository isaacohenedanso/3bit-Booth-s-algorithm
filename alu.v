module alu(A, B, S, shdir, shamt, outp);
input [7: 0] A, B;
input [2: 0] S;
input [2: 0] shamt;
input shdir;
output [8: 0] outp;

wire [7: 0] sum;
wire cout;

//adder adder_subtractor(X, Y, S, Cout, G);
adder_subtractor add_sub(B, A, S, cout, sum);

//shifter(data, shamt, shdir, outp);
shifter shift({cout, sum}, shamt, shdir, outp);

endmodule
