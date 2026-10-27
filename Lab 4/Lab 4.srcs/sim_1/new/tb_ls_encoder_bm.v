`timescale 1ns / 1ps

module tb_ls_encoder_bm;
    reg clk;
    reg sw1, sw2, sw3, sw4, sw5, sw6, sw7, sw8, sw9;
    wire d, c, b, a;
    
    ls_encoder_bm uut (
        .clk(clk),
        .sw1(sw1), 
        .sw2(sw2), 
        .sw3(sw3), 
        .sw4(sw4), 
        .sw5(sw5), 
        .sw6(sw6), 
        .sw7(sw7), 
        .sw8(sw8), 
        .sw9(sw9),
        .d(d),
        .c(c),
        .b(b),
        .a(a)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        sw1 = 1; sw2 = 1; sw3 = 1; sw4 = 1; sw5 = 1; 
        sw6 = 1; sw7 = 1; sw8 = 1; sw9 = 1;
        
        #50;
        sw9 = 0;
        
        #50;
        sw9 = 1; sw8 = 0;
        
        #50;
        sw8 = 1; sw7 = 0; 
        
        #50;
        sw7 = 1; sw6 = 0;   
        
        #50;
        sw6 = 1; sw5 = 0;  
        
        #50;
        sw5 = 1; sw4 = 0; 
        
        #50;
        sw4 = 1; sw3 = 0;
        
        #50;
        sw3 = 1; sw2 = 0;
        
        #50;
        sw2 = 1; sw1 = 0;

        #50;
        sw1 = 1;

        $finish;
    end
endmodule
