`timescale 1ns / 1ps

module tb_look_ahead4;
    reg g3, g2, g1, g0;
    reg p3, p2, p1, p0;
    reg c0;
    
    wire c4, c3, c2, c1;
    wire g, p;
    
    look_ahead4 uut (
        .g3(g3), .g2(g2), .g1(g1), .g0(g0),
        .p3(p3), .p2(p2), .p1(p1), .p0(p0),
        .c0(c0),
        .c4(c4), .c3(c3), .c2(c2), .c1(c1),
        .g(g), .p(p)
    );
    
    initial begin
        // Test Case 1: All zeroes, c0 = 0
        {g3, g2, g1, g0} = 4'b0000;
        {p3, p2, p1, p0} = 4'b0000;
        c0 = 1'b0;
        
        // Test Case 2: All zeroes, c0 = 1 (should ripple through nothing)
        #50;
        c0 = 1'b1;
        
        // Test Case 3: All propagate bits high (`p` = 1111), c0 = 0
        #50;
        {p3, p2, p1, p0} = 4'b1111;
        {g3, g2, g1, g0} = 4'b0000;
        c0 = 1'b0;
        
        // Test Case 4: All propagate bits high, c0 = 1 (c0 should ripple all the way to c4)
        #50;
        c0 = 1'b1;
        
        // Test Case 5: Generate at bit 0 only (`g0` = 1), rest propagate
        #50;
        {p3, p2, p1, p0} = 4'b1111;
        {g3, g2, g1, g0} = 4'b0001;
        c0 = 1'b0;
        
        // Test Case 6: Generate at bit 2 (`g2` = 1), c0 = 0
        #50;
        {p3, p2, p1, p0} = 4'b1111;
        {g3, g2, g1, g0} = 4'b0100;
        c0 = 1'b0;
        
        // Test Case 7: Mixed generate and propagate conditions
        #50;
        {p3, p2, p1, p0} = 4'b1010;
        {g3, g2, g1, g0} = 4'b0101;
        c0 = 1'b1;
        
        #50;
        $finish;
    end
endmodule
