// ====================================================================
// Source: Lab 1-1 Instructions [1]
// ====================================================================
`timescale 1ns / 1ps

module mux21_sw_rtl_signal (out, s, a, b);

    output out;     // mux output
    input s, a, b;  // mux inputs
    
    wire t1, t2, sbar;
    assign sbar = ~ s;
    assign t1 = b & s;
    assign t2 = a & sbar;
    assign out = t1 | t2;
    
endmodule