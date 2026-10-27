`timescale 1ns / 1ps
module mux21(
    input s, a, b, 
    output out
    );
    wire w0, w1, sbar;      

    assign sbar = ~s;      

    assign w1 = sbar & a; 

    assign w2 = s & b;     

    assign out = w1 | w2; 
endmodule
