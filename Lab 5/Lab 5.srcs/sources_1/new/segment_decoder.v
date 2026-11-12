`timescale 1ns / 1ps
module segment_decoder(
    input  wire [3:0] value,
    output reg  [6:0] seg
);
    reg [6:0] on;

    always @(*) begin
        case (value)
            4'h0: on = 7'b0111111;
            4'h1: on = 7'b0000110;
            4'h2: on = 7'b1011011;
            4'h3: on = 7'b1001111;
            4'h4: on = 7'b1100110;
            4'h5: on = 7'b1101101;
            4'h6: on = 7'b1111101;
            4'h7: on = 7'b0000111;
            4'h8: on = 7'b1111111;
            4'h9: on = 7'b1101111;
            4'hA: on = 7'b1110111;
            4'hB: on = 7'b1111100;
            4'hC: on = 7'b0111001;
            4'hD: on = 7'b1011110;
            4'hE: on = 7'b1111001;
            4'hF: on = 7'b1110001;
            default: on = 7'b0000000;
        endcase
        seg = ~on;
    end
endmodule