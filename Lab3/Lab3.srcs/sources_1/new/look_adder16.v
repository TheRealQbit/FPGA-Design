`timescale 1ns / 1ps
module look_adder16(
    input [15:0] a, b,
    input c0,
    output [15:0] s,
    output c16, c15, g, p
    );
     
    wire [3:0] g_wire, p_wire;
    wire [4:0] c_wire;
    wire [3:0] c3_wire;
    
    assign c_wire[0] = c0;
    
    look_ahead4 lcu (
        .g3(g_wire[3]), .g2(g_wire[2]), .g1(g_wire[1]), .g0(g_wire[0]),
        .p3(p_wire[3]), .p2(p_wire[2]), .p1(p_wire[1]), .p0(p_wire[0]),
        .c0(c0),
        .c4(c_wire[4]),
        .c3(c_wire[3]),
        .c2(c_wire[2]),
        .c1(c_wire[1]),
        .g(g),
        .p(p)
    );
    
    assign c16 = c_wire[4];
    assign c15 = c3_wire[3];
    
    genvar j;
    generate
        for (j = 0; j < 4; j = j + 1) begin : adder_stage
            look_adder4 look_adder4_inst (
                .a(a[j*4 +: 4]),
                .b(b[j*4 +: 4]),
                .c0(c_wire[j]),
                .s(s[j*4 +: 4]),
                .c4(),
                .c3(c3_wire[j]),
                .g(g_wire[j]),
                .p(p_wire[j])
            );
        end
    endgenerate
endmodule
