// ====================================================================
// Source: Lab 1-1 Instructions [1]
// ====================================================================
`timescale 1ns / 1ps
module mux21_sw_rtl_direct (out, s, a, b);

    output out;     // mux output
    input s, a, b;  // mux inputs
    assign out = (a & (~ s)) | (b & s);
    
    //can also be expressed as a ternary operator
    // assign out = s ? b : a; 
    
endmodule