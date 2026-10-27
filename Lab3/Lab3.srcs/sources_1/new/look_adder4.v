`timescale 1ns / 1ps
module look_adder4(
    input [3:0] a, b,
    input c0,
    output [3:0] s,
    output c4, c3, g, p
    );
    
    wire [4:0] c_wire;
    wire [3:0] g_in, p_in;
    
    assign c_wire[0] = c0;    
    assign g_in = a & b;      // G_i = A_i AND B_i
    assign p_in = a ^ b;      // P_i = A_i XOR B_i
    
    //input g3, g2, g1, g0, p3, p2, p1, p0, c0,
    //output c4, c3, c2, c1, g, p
    look_ahead4 lcu_inst(
        .g3(g_in[3]),
        .g2(g_in[2]),
        .g1(g_in[1]),
        .g0(g_in[0]),
        .p3(p_in[3]),
        .p2(p_in[2]),
        .p1(p_in[1]),
        .p0(p_in[0]),
        .c0(c0),
        .c4(c_wire[4]),
        .c3(c_wire[3]),
        .c2(c_wire[2]),
        .c1(c_wire[1]),
        .g(g),
        .p(p)
    );
    
    genvar j;
    
    generate
        for(j=0; j < 4; j = j+1) begin: adder_stage
            full_adder1 full_adder_inst(
                    .a(a[j]),
                    .b(b[j]),
                    .carryIn(c_wire[j]),                
                    .s(s[j]),
                    .carryOut()
                );  
        end 
    endgenerate
    
    assign c4 = c_wire[4];    
    assign c3 = c_wire[3];
    
endmodule
