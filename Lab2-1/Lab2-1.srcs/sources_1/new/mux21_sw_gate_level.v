// ====================================================================
// Source: Lab 1-1 Instructions [1]
// ====================================================================
`timescale 1ns / 1ps

module mux21_sw_gate_level (out, s, a, b);

    output out;     // mux output
    input s, a, b;  // mux inputs
    
    wire t1, t2, sbar;
    not not1 (sbar, s);
    and and1 (t1, b, s);
    and and2 (t2, a, sbar);
    or or1 (out, t1, t2);
    
endmodule