`timescale 1ns / 1ps

module mux_2bit(
    input s, i0, i1,
    output y
    );
    
    wire w0, w1, sbar;
    
    assign sbar = ~s;
    
    assign w1 = sbar & i0;
    assign w2 = s & i1;
    
    assign y = w1 | w2;
endmodule
