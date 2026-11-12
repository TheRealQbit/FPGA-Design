`timescale 1ns / 1ps

module comp_1usign(
    input a0, b0,
    output gt, eq, ls
    );
    
    wire abar, bbar, w0, w1;
    
    assign abar = ~a0;
    assign bbar = ~b0;
    
    assign gt = a0 & bbar;
    assign w0 = abar & bbar;
    assign w1 = a0 & b0; 
    assign ls = abar & b0;
    
    assign eq = w0 | w1; 
endmodule
