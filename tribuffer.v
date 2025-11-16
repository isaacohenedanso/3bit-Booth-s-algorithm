module tribuffer(X, en, Y);
input [7: 0] X;
input en;
output [7: 0] Y;

assign y = enable? X: Z;

endmodule
