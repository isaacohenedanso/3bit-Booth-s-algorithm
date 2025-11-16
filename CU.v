module CU(clk, rst, load, muxsel, cmp0, cmp1, shift_direction, Tshift_amount, shift_amount, ALUop, out_enable);
input [2: 0] cmp0, cmp1;
input clk, rst;
output reg [3: 0] ALUop;
output reg [2: 0] Tshift_amount, shift_amount;
output reg load, muxsel, out_enable, shift_direction;

reg [1: 0] PS, NS;
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

always @(posedge clk or negedge rst) begin
    if(!rst)
        PS <= S0;
    else
        PS <= NS;
end

always @(PS or cmp0 or cmp1) begin
    case (PS)
        S0: begin
            load <= 1'b1;
            shift_direction <= 1'b0;
            Tshift_amount <= 3'b000;
            out_enable <= 1'b0;
            if(cmp0 == 3'b000) begin
                muxsel <= 1'b1;
                ALUop <= 4'b0010;
                shift_amount <= 3'b000;
            end
            else if(cmp0 == 3'b001) begin
                muxsel <= 1'b0;
                ALUop <= 4'b0010;
                shift_amount <= 3'b000;
            end
            else if(cmp0 == 3'b010) begin
                muxsel <= 1'b0;
                ALUop <= 4'b0010;
                shift_amount <= 3'b001;
            end
            else if(cmp0 == 3'b011) begin
                muxsel <= 1'b0;
                ALUop <= 4'b0101;
                shift_amount <= 3'b001;
            end
            else if(cmp0 == 3'b100) begin
                muxsel <= 1'b0;
                ALUop <= 4'b0101;
                shift_amount <= 3'b000;
            end
            NS <= S1;
        end
        S1: begin
            load <= 1'b1;
            shift_direction <= 1'b0;
            shift_amount <= 3'b000;
            out_enable <= 1'b0;
            if(cmp1 == 3'b000) begin
                muxsel <= 1'b1;
                ALUop <= 4'b0010;
                Tshift_amount <= 3'b010;
            end
            else if(cmp1 == 3'b001) begin
                muxsel <= 1'b0;
                ALUop <= 4'b0010;
                Tshift_amount <= 3'b010;
            end
            else if(cmp1 == 3'b010) begin
                muxsel <= 1'b0;
                ALUop <= 4'b0010;
                Tshift_amount <= 3'b011;
            end
            else if(cmp1 == 3'b011) begin
                muxsel <= 1'b0;
                ALUop <= 4'b0101;
                Tshift_amount <= 3'b011;
            end
            else if(cmp1 == 3'b100) begin
                muxsel <= 1'b0;
                ALUop <= 4'b0101;
                Tshift_amount <= 3'b010;
            end
            NS <= S2;
        end
        S2: begin
            load <= 1'b0;
            muxsel <= 1'b0;
            out_enable <= 1'b1;
            shift_direction <= 1'b0;
            ALUop <= 4'b0000;
            Tshift_amount <= 3'b000;
            shift_amount <= 3'b000;
            NS <= S2;
        end
    endcase
end
endmodule

