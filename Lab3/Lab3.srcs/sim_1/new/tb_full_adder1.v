`timescale 1ns / 1ps
module tb_full_adder1;
    reg a, b, carryIn;
    wire s, carryOut;
    
    full_adder1 uut(
        .a(a),
        .b(b),
        .carryIn(carryIn),
        .s(s),
        .carryOut(carryOut)
    );
    
    initial begin
        a = 0; b = 0; carryIn = 0;
        
        #50
        a = 0; b = 1;
        
        #50
        a = 1; b = 0;
        
        #50
        a = 1; b = 1;
        
        #50
        a = 0; b = 0; carryIn = 1;
        
        #50
        a = 0; b = 1;
        
        #50
        a = 1; b = 0;
        
        #50
        a = 1; b = 1;
        
        #50// wait for so that the last state can be viewed
        $finish;
    end
endmodule
