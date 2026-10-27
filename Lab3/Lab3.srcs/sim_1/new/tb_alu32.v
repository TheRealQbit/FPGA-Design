`timescale 1ns / 1ps
module tb_alu32;
    reg [31:0] a, b;
    reg [3:0] alu_control;
    
    wire [31:0] result;
    wire zero, overflow;
    
    // Instantiate the 32-bit ALU
    alu32 uut (
        .a(a),
        .b(b),
        .alu_control(alu_control),
        .result(result),
        .zero(zero),
        .overflow(overflow)
    );
    
    initial begin
        // Initialize inputs
        a = 32'h0;
        b = 32'h0;
        alu_control = 4'b0000;
        
        // Case 1: AND (0000)[cite: 1]
        #50;
        a = 32'h0F0F0F0F;
        b = 32'h33333333;
        alu_control = 4'b0000;
        
        // Case 2: OR (0001)[cite: 1]
        #50;
        a = 32'h0F0F0F0F;
        b = 32'h33333333;
        alu_control = 4'b0001;
        
        // Case 3: Add (0010)[cite: 1]
        #50;
        a = 32'd12345;
        b = 32'd67890;
        alu_control = 4'b0010;
        
        // Case 4: Subtract (0110)[cite: 1]
        #50;
        a = 32'd100000;
        b = 32'd45678;
        alu_control = 4'b0110;
        
        // Case 5: Pass "b" (0111)[cite: 1]
        #50;
        a = 32'hAAAAAAAA;
        b = 32'h55555555;
        alu_control = 4'b0111;
        
        // Case 6: NOR (1100)[cite: 1]
        #50;
        a = 32'h0000FFFF;
        b = 32'h00000000;
        alu_control = 4'b1100;
        
        // Case 7: Test Zero Flag (Result becomes 0)
        #50;
        a = 32'd50;
        b = 32'd50;
        alu_control = 4'b0110; // SUB -> 50 - 50 = 0
        
        #50;
        $finish;
    end
endmodule
