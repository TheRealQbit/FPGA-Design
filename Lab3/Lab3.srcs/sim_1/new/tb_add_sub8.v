`timescale 1ns / 1ps

module tb_add_sub8;
    reg [7:0] a, b;
    reg sub;
    wire [7:0] s;
    wire carryOut, overflow;
    
    add_sub8 uut(
        .a(a),
        .b(b),
        .sub(sub),
        .s(s),
        .carryOut(carryOut),
        .overflow(overflow)
    );
    
    initial begin
        // Case1: Simple addition -> 10 + 5 = 15
        sub = 0;
        a = 8'd10;
        b = 8'd5;
        // Case2: Unsigned Carry-out -> (200 + 100 = 300 (Sum wraps to 44, carryOut = 1)
        #50
        a = 8'd200;
        b = 8'd100;
        // Case3: Signed Overflow -> 100 + 50 (Positive + Positive = Negative, triggers overflow)
        #50
        a = 8'd100;
        b = 8'd50;        
        // Case4: Simple subtraction -> 10 - 5 = 5
        #50
        sub = 1;
        a = 8'd10;
        b = 8'd5;
        // Case5: Subtraction resulting in negative -> 10-25
         #50
        a = 8'd10;
        b = 8'd25;
        
        #50// wait for so that the last state can be viewed
        $finish;
    end
endmodule
