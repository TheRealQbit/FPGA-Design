`timescale 1ns / 1ps
module tb_alu4_buggy;
    reg [3:0] a, b;
    reg [3:0] op;
    wire [3:0] result;
    wire carry, overflow, zero;
    
    alu4_buggy uut(
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .carry(carry),
        .overflow(overflow),
        .zero(zero)
    );
    
    initial begin
        // Test 1: a=7, b=3, OP=ADD
        a = 4'h7; b = 4'h3; op = 4'b0010;
        #50
        // Test 2: a=F, b=1, OP=ADD
        a = 4'hF; b = 4'h1; op = 4'b0010;
        #50
        // Test 3: a=0, b=1, OP=SUB
        a = 4'h0; b = 4'h1; op = 4'b0110;
        #50
        // Test 4: a=8, b=1, OP=SUB
        a = 4'h8; b = 4'h1; op = 4'b0110;
        #50
        // Test 5: a=8, b=1, OP=SLT
        a = 4'h8; b = 4'h1; op = 4'b0111;
        #50
        // Test 6: a=7, b=8, OP=SLT
        a = 4'h7; b = 4'h8; op = 4'b0111;
        #50
        // Test 7: a=0, b=0, OP=NOR
        a = 4'h0; b = 4'h0; op = 4'b1100;
        #50
        // Test 8: a=C, b=3, OP=AND
        a = 4'hC; b = 4'h3; op = 4'b0000;
        #50
        // Test 9: a=C, b=3, OP=OR
        a = 4'hC; b = 4'h3; op = 4'b0001;
        #50
        // Test 10: a=P (0), b=Q (8), OP=SUB
        a = 4'h0; b = 4'h8; op = 4'b0110;
        #50
        // Test 11: a=P (0), b=Q (8), OP=SLT
        a = 4'h0; b = 4'h8; op = 4'b0111;
        #50 // wait so that the last state can be viewed
        $finish;
    end   
    
endmodule
