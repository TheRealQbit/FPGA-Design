`timescale 1ns / 1ps
module decimal_bcd_encoderDF(
    input i1, i2, i3, i4, i5, i6, i7, i8, i9,
    output d, c, b, a
    );
    
    wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9;
    
    assign w0 = i1 & i2 & i3 & i4 & i5 & i6 & i7 & i8 & i9;
    assign w1 = ~i1 & i2 & i3 & i4 & i5 & i6 & i7 & i8 & i9;
    assign w2 = ~i2 & i3 & i4 & i5 & i6 & i7 & i8 & i9;
    assign w3 = ~i3 & i4 & i5 & i6 & i7 & i8 & i9;
    assign w4 = ~i4 & i5 & i6 & i7 & i8 & i9;
    assign w5 = ~i5 & i6 & i7 & i8 & i9;
    assign w6 = ~i6 & i7 & i8 & i9;
    assign w7 = ~i7 & i8 & i9;
    assign w8 = ~i8 & i9;
    assign w9 = ~i9;
    
    assign d = w0 | w1 | w2 | w3 | w4 | w5 | w6 | w7 ;
    assign c = w0 | w1 | w2 | w3 | w8 | w9 ;
    assign b = w0 | w1 | w4 | w5 | w8 | w9 ;
    assign a = w0 | w2 | w4 | w6 | w8 ;
    
endmodule
