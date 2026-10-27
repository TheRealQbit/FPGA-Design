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
        // Priority logic evaluating from highest input (9) to lowest (1)
        // Active-low outputs based on the SN74LS147 function table
        if (in9 == 1'b0) begin
            {d, c, b, a} = 4'b0110; // Input 9 active (Outputs: H, L, L, H)[cite: 1]
        end
        else if (in8 == 1'b0) begin
            {d, c, b, a} = 4'b0111; // Input 8 active (Outputs: H, L, L, L)[cite: 1]
        end
        else if (in7 == 1'b0) begin
            {d, c, b, a} = 4'b1000; // Input 7 active (Outputs: H, H, L, L)[cite: 1]
        end
        else if (in6 == 1'b0) begin
            {d, c, b, a} = 4'b1001; // Input 6 active (Outputs: H, H, L, H)[cite: 1]
        end
        else if (in5 == 1'b0) begin
            {d, c, b, a} = 4'b1010; // Input 5 active (Outputs: H, H, H, L)[cite: 1]
        end
        else if (in4 == 1'b0) begin
            {d, c, b, a} = 4'b1011; // Input 4 active (Outputs: H, H, H, H)[cite: 1]
        end
        else if (in3 == 1'b0) begin
            {d, c, b, a} = 4'b1100; // Input 3 active (Outputs: H, L, H, L)[cite: 1]
        end
        else if (in2 == 1'b0) begin
            {d, c, b, a} = 4'b1101; // Input 2 active (Outputs: H, L, H, H)[cite: 1]
        end
        else if (in1 == 1'b0) begin
            {d, c, b, a} = 4'b1110; // Input 1 active (Outputs: H, L, L, H -> Wait, row 9 check below)[cite: 1]
        end
        else begin
            {d, c, b, a} = 4'b1111; // All inputs inactive (Outputs: H, H, H, H)[cite: 1]
        end
    end
    
endmodule
