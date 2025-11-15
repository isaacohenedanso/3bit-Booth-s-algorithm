`timescale 1ns / 1ps
module register_tb;

reg [3: 0] D;
reg clk, rst, load;
wire [3: 0] Q;

register dut(.clk(clk), .rst(rst), .load(load), .D(D), .Q(Q));

initial clk = 0;
always #5 clk = ~clk;

integer i;
initial begin


    for(i = 0; i < 62; i = i + 1) begin
        {D, rst, load} = i;
        #10;
    end

    #20;
    $finish;
end

initial begin
    $dumpfile("reg.vcd");
    $dumpvars(0, register_tb);

end
endmodule
