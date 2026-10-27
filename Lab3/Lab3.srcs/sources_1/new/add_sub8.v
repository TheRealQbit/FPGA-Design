`timescale 1ns / 1ps
module add_sub8(
    input [7:0] a, b, 
    input sub,
    output [7:0] s,
    output carryOut, overflow
    );
    
    wire [8:0] c_wire;
    
    assign c_wire[0] = sub;
    
    genvar j;
    generate
        for(j=0; j<8; j = j+1) begin: adder_stage
            full_adder1 full_adder_inst(
                .a(a[j]),
                .b(sub ^ b[j]),
                .carryIn(c_wire[j]),                
                .s(s[j]),
                .carryOut(c_wire[j+1])
            );        
        end
    endgenerate
    
    assign carryOut = c_wire[8];
    assign overflow = c_wire[7] ^ c_wire[8];
endmodule
