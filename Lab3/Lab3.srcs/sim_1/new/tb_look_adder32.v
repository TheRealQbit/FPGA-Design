`timescale 1ns / 1ps
module tb_look_adder32;
    reg [31:0] a, b;
    reg c0;
    
    wire [31:0] s;
    wire c32, c31, g, p;
    
    look_adder32 uut (
        .a(a),
        .b(b),
        .c0(c0),
        .s(s),
        .c32(c32),
        .c31(c31),
        .g(g),
        .p(p)
    );
    
    initial begin
        // Case 1: Simple small numbers
        a = 32'd123456;
        b = 32'd789012;
        c0 = 1'b0;
        
        // Case 2: Addition with initial carry-in
        #50;
        a = 32'd1000;
        b = 32'd2000;
        c0 = 1'b1;
        
        // Case 3: Block boundary check
        #50;
        a = 32'd65535;
        b = 32'd1;
        c0 = 1'b0;
        
        // Case 4: Major block transition
        #50;
        a = 32'h0000FFFF; 
        b = 32'h00000001;
        c0 = 1'b0;
        
        // Case 5: Global Carry-Out
        #50;
        a = 32'hFFFFFFFF;
        b = 32'h00000001;
        c0 = 1'b0;
        
        // Case 6: Max values with carry-in
        #50;
        a = 32'hFFFFFFFF;
        b = 32'hFFFFFFFF;
        c0 = 1'b1;
        
        #50;
        $finish;
    end
endmodule
