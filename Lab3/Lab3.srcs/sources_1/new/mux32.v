`timescale 1ns / 1ps
module mux32(
    input [31:0] d0,  // 0000: AND
    input [31:0] d1,  // 0001: OR
    input [31:0] d2,  // 0010: ADD
    input [31:0] d3,  // Unused
    input [31:0] d4,  // Unused
    input [31:0] d5,  // Unused
    input [31:0] d6,  // 0110: SUB
    input [31:0] d7,  // 0111: Pass "b"
    input [31:0] d8,  // Unused
    input [31:0] d9,  // Unused
    input [31:0] d10, // Unused
    input [31:0] d11, // Unused
    input [31:0] d12, // 1100: NOR
    input [31:0] d13, // Unused
    input [31:0] d14, // Unused
    input [31:0] d15, // Unused
    input [3:0] sel,
    output [31:0] out
    );

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : bit_mux
            wire m0, m1, m2, m3, m4, m5, m6, m7;
            wire n0, n1, n2, n3;
            wire p0, p1;

            // Level 1: sel[0]
            mux21 mux_l1_0 (.out(m0), .s(sel[0]), .a(d0[i]),  .b(d1[i]));
            mux21 mux_l1_1 (.out(m1), .s(sel[0]), .a(d2[i]),  .b(d3[i]));
            mux21 mux_l1_2 (.out(m2), .s(sel[0]), .a(d4[i]),  .b(d5[i]));
            mux21 mux_l1_3 (.out(m3), .s(sel[0]), .a(d6[i]),  .b(d7[i]));
            mux21 mux_l1_4 (.out(m4), .s(sel[0]), .a(d8[i]),  .b(d9[i]));
            mux21 mux_l1_5 (.out(m5), .s(sel[0]), .a(d10[i]), .b(d11[i]));
            mux21 mux_l1_6 (.out(m6), .s(sel[0]), .a(d12[i]), .b(d13[i]));
            mux21 mux_l1_7 (.out(m7), .s(sel[0]), .a(d14[i]), .b(d15[i]));

            // Level 2: sel[1]
            mux21 mux_l2_0 (.out(n0), .s(sel[1]), .a(m0), .b(m1));
            mux21 mux_l2_1 (.out(n1), .s(sel[1]), .a(m2), .b(m3));
            mux21 mux_l2_2 (.out(n2), .s(sel[1]), .a(m4), .b(m5));
            mux21 mux_l2_3 (.out(n3), .s(sel[1]), .a(m6), .b(m7));

            // Level 3: sel[2]
            mux21 mux_l3_0 (.out(p0), .s(sel[2]), .a(n0), .b(n1));
            mux21 mux_l3_1 (.out(p1), .s(sel[2]), .a(n2), .b(n3));

            // Level 4: sel[3]
            mux21 mux_l4_0 (.out(out[i]), .s(sel[3]), .a(p0), .b(p1));
        end
    endgenerate
    
endmodule
