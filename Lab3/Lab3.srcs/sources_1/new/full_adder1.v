`timescale 1ns / 1ps
module full_adder1(
    input a, b , carryIn,
    output s, carryOut
    );
    
    wire w0, w1, w2;
    assign w0 = a ^ b;
    assign s = w0 ^ carryIn;
    assign w1 = w0 & carryIn;
    assign w2 = a & b;
    assign carryOut = w1 | w2;
endmodule
