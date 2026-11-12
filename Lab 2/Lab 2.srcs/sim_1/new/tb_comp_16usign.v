`timescale 1ns / 1ps
module tb_comp_16usign;
    reg [15:0] a0;
    reg [15:0] b0;

    wire gt;
    wire eq;
    wire ls;

    comp_16usign uut (
        .a0(a0), 
        .b0(b0), 
        .gt(gt), 
        .eq(eq), 
        .ls(ls)
    );

    initial begin
        a0 = 16'h0000;
        b0 = 16'h0000;

        #100; // Wait
       
        // Tests Greater than
        a0 = 16'd500;
        b0 = 16'd200;
        #10; // Wait

        a0 = 16'h8000; // 32768
        b0 = 16'h7FFF; // 32767
        #10; // Wait

        // Tests Less than
        a0 = 16'd100;
        b0 = 16'd999;
        #10; // Wait

        a0 = 16'h0000; // 0
        b0 = 16'hFFFF; // 65535
        #10; // Wait

        // Test Equal
        a0 = 16'h0000;
        b0 = 16'h0000;
        #10; // Wait
        
        a0 = 16'hABCD;
        b0 = 16'hABCD;
        #10; // Wait

        $finish;
    end
endmodule
