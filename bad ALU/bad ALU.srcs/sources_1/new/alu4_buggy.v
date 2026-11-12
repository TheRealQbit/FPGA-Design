`timescale 1ns / 1ps
module alu4_buggy (
    input wire [3:0] a, b,
    input wire [3:0] op,
    output reg [3:0] result,
    output reg carry, overflow, zero
    );
    reg [3:0] temp;
    always @(a or b) begin
        temp = 4'b0000;
        carry = 1'b0;
        overflow = 1'b0;
        case (op)
            4'b0000: result = a & b;
            4'b0001: result = a | b;
            4'b0010: begin
                temp = a + b;
                result = temp;
                carry = temp[3];
                overflow = (a[3] == b[3]) && (result[3] != a[3]);
            end
            4'b0110: begin
                temp = a - b;
                result = temp;
                carry = (a >= b);
                overflow = (a[3] == b[3]) && (result[3] != a[3]);
            end
            4'b0111: result = (a < b);
            4'b1100: result = ~(a | b);
        endcase
        
        zero = (result == 4'b0000);
    end
endmodule
