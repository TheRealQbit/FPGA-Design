`timescale 1ns / 1ps

module tb_decimal_bcd_encoder;

    reg i1, i2, i3, i4, i5, i6, i7, i8, i9;
    wire d, c, b, a;
    
    decimal_bcd_encoderDF uut (
        .i1(i1), 
        .i2(i2), 
        .i3(i3), 
        .i4(i4), 
        .i5(i5), 
        .i6(i6), 
        .i7(i7), 
        .i8(i8), 
        .i9(i9),
        .d(d),
        .c(c),
        .b(b),
        .a(a)
    );
    
    initial begin
        i1 = 1; i2 = 1; i3 = 1; i4 = 1; i5 = 1; 
        i6 = 1; i7 = 1; i8 = 1; i9 = 1;
        
        #50;
        i9 = 0;
        
        #50;
        i9 = 1; i8 = 0;
        
        #50;
        i8 = 1; i7 = 0; 
        
        #50;
        i7 = 1; i6 = 0;   
        
        #50;
        i6 = 1; i5 = 0;  
        
        #50;
        i5 = 1; i4 = 0; 
        
        #50;
        i4 = 1; i3 = 0;
        
        #50;
        i3 = 1; i2 = 0;
        
        #50;
        i2 = 1; i1 = 0;

        #50;
        i1 = 1;

        $finish;
    end
    
endmodule
