`timescale 1ns / 1ps
module look_adder32(
    input [31:0] a, b,
    input c0,
    output [31:0] s,
    output c32, c31, g, p
    );
    
    wire [1:0] g_wire, p_wire;
    wire [2:0] c_wire;
    wire [1:0] c15_wire;
    
    assign c_wire[0] = c0;
    
    assign c_wire[1] = g_wire[0] | (p_wire[0] & c_wire[0]);
    assign c_wire[2] = g_wire[1] | (p_wire[1] & g_wire[0]) | (p_wire[1] & p_wire[0] & c_wire[0]);
    assign g = g_wire[1] | (p_wire[1] & g_wire[0]);
    assign p = p_wire[1] & p_wire[0];
    
    assign c32 = c_wire[2];
    assign c31 = c15_wire[1];
    
    genvar j;
    generate
        for (j = 0; j < 2; j = j + 1) begin : adder16_stage
            look_adder16 look_adder16_inst (
                .a(a[j*16 +: 16]),
                .b(b[j*16 +: 16]),
                .c0(c_wire[j]),
                .s(s[j*16 +: 16]),
                .c16(),
                .c15(c15_wire[j]),
                .g(g_wire[j]),
                .p(p_wire[j])
            );
        end
    endgenerate
    
endmodule
