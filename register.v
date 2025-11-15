module register(clk, rst, load, D, Q);
parameter N= 4;
input [N-1: 0] D;
input clk, rst, load;
output reg [N-1: 0] Q;

always @(posedge clk or negedge rst) begin
   if(!rst)
        Q <= {N{1'b0}};
    else if(load)
        Q <= D;
end
endmodule
