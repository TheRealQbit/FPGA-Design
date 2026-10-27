`timescale 1ns / 1ps
module tb_look_adder16;
    reg [15:0] a, b;
    reg c0;
    
    wire [15:0] s;
    wire c16, c15, g, p;
    
    look_adder16 uut (
        .a(a),
        .b(b),
        .c0(c0),
        .s(s),
        .c16(c16),
        .c15(c15),
        .g(g),
        .p(p)
    );
    
    initial begin
        // Case 1: Simple small numbers
        a = 16'd1234;
        b = 16'd5678;
        c0 = 1'b0;
        
        // Case 2: Addition with initial carry-in
        #50;
        a = 16'd100;
        b = 16'd200;
        c0 = 1'b1;
        
        // Case 3: Block boundary check
        #50;
        a = 16'd15;   // 4'hf in lowest block
        b = 16'd1;
        c0 = 1'b0;
        
        // Case 4: Major block transition
        #50;
        a = 16'h0FFF; 
        b = 16'h0001;
        c0 = 1'b0;
        
        // Case 5: Global Carry-Out
        #50;
        a = 16'hFFFF;
        b = 16'h0001;
        c0 = 1'b0;
        
        // Case 6: Max values with carry-in
        #50;
        a = 16'hFFFF;
        b = 16'hFFFF;
        c0 = 1'b1;
        
        #50;
        $finish;
    end
endmodule
