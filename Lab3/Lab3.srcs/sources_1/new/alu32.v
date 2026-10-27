`timescale 1ns / 1ps

module alu32(
    input [31:0] a, b,
    input [3:0] alu_control,   
    output [31:0] result,
    output zero,
    output overflow
    );
    
    wire is_sub;
    assign is_sub = ~alu_control[3] & alu_control[2] & alu_control[1] & ~alu_control[0];
    
    wire [31:0] b_mod;
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : b_invert_gen
            assign b_mod[i] = b[i] ^ is_sub;
        end
    endgenerate
    
    wire [31:0] adder_result;
    wire c32, c31, adder_g, adder_p;

    look_adder32 adder_inst (
        .a(a),
        .b(b_mod),
        .c0(is_sub),
        .s(adder_result),
        .c32(c32),
        .c31(c31),
        .g(adder_g),
        .p(adder_p)
    );
    
    wire [31:0] and_result, or_result, nor_result;
    generate
        for (i = 0; i < 32; i = i + 1) begin : logic_gen
            assign and_result[i] = a[i] & b[i];
            assign or_result[i]  = a[i] | b[i];
            assign nor_result[i] = ~(a[i] | b[i]);
        end
    endgenerate

    mux32 mux_inst (
        .d0(and_result),     // 0000: AND
        .d1(or_result),      // 0001: OR
        .d2(adder_result),   // 0010: ADD
        .d3(32'b0),
        .d4(32'b0),
        .d5(32'b0),
        .d6(adder_result),   // 0110: SUB
        .d7(b),              // 0111: Pass "b"
        .d8(32'b0),
        .d9(32'b0),
        .d10(32'b0),
        .d11(32'b0),
        .d12(nor_result),    // 1100: NOR
        .d13(32'b0),
        .d14(32'b0),
        .d15(32'b0),
        .sel(alu_control),
        .out(result)
    );
    
    assign zero = ~(|result);
    wire signed_overflow = c32 ^ c31;
    assign overflow = signed_overflow & (~alu_control[3] & alu_control[1]);
endmodule
