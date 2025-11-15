module comparator(X, Y);
input [2: 0] X;
output [2: 0] Y;

assign Y = (X == 3'b000 | X == 3'b111)? 3'b000: //+0// shift 2
            (X == 3'b001 | X == 3'b010)? 3'b001: //+M//shift 2
            (X == 3'b011)? 3'b010: //+2*M//shift 2
            (X == 3'b100)? 3'b011: //-2*M//shift 2
            3'b100; //-M//shift 2

endmodule
