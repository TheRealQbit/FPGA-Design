`timescale 1ns / 1ps

module ls_encoder_bm(
    input clk,
    input sw1, sw2, sw3, sw4, sw5, sw6, sw7, sw8, sw9,
    output reg d, c, b, a
    );
    
    wire in1 = ~sw1;
    wire in2 = ~sw2;
    wire in3 = ~sw3;
    wire in4 = ~sw4;
    wire in5 = ~sw5;
    wire in6 = ~sw6;
    wire in7 = ~sw7;
    wire in8 = ~sw8;
    wire in9 = ~sw9;
    
    always @(*) begin
        if (in9 == 1'b0) begin
            {d, c, b, a} = 4'b0110;
        end
        else if (in8 == 1'b0) begin
            {d, c, b, a} = 4'b0111;
        end
        else if (in7 == 1'b0) begin
            {d, c, b, a} = 4'b1000;
        end
        else if (in6 == 1'b0) begin
            {d, c, b, a} = 4'b1001;
        end
        else if (in5 == 1'b0) begin
            {d, c, b, a} = 4'b1010;
        end
        else if (in4 == 1'b0) begin
            {d, c, b, a} = 4'b1011;
        end
        else if (in3 == 1'b0) begin
            {d, c, b, a} = 4'b1100;
        end
        else if (in2 == 1'b0) begin
            {d, c, b, a} = 4'b1101;
        end
        else if (in1 == 1'b0) begin
            {d, c, b, a} = 4'b1110;
        end
        else begin
            {d, c, b, a} = 4'b1111;
        end
    end
    
endmodule
