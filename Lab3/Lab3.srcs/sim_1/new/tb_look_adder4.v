`timescale 1ns / 1ps
module tb_look_adder4;
    reg [3:0] a, b;
    reg c0;
    
    wire [3:0] s;
    wire c4, c3, g, p;
    
    look_adder4 uut (
        .a(a),
        .b(b),
        .c0(c0),
        .s(s),
        .c4(c4),
        .c3(c3),
        .g(g),
        .p(p)
    );
    
    initial begin
        // Case 1: Simple addition
        a = 4'd5;
        b = 4'd3;
        c0 = 1'b0;
        
        // Case 2: Simple addition with carry-in
        #50;
        c0 = 1'b1;
        
        // Case 3: Zeroes test
        #50;
        a = 4'd0;
        b = 4'd0;
        c0 = 1'b0;
        
        // Case 4: Addition causing a carry-out
        #50;
        a = 4'd10; // 1010
        b = 4'd7;  // 0111
        c0 = 1'b0;
        
        // Case 5: Max value
        #50;
        a = 4'd15;
        b = 4'd15;
        c0 = 1'b1;
        
        // Case 6: Full propagate
        #50;
        a = 4'd8;
        b = 4'd7;
        c0 = 1'b0;
        
        #50;
        $finish;
    end
endmodule
