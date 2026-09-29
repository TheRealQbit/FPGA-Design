`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2026 03:29:36 PM
// Design Name: 
// Module Name: FullAdder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FullAdder(
    A,
    B,
    Cin,
    Sum,
    Cout
    );
    input A,B,Cin;
    output Sum, Cout;
    
    assign Sum = A ^ B ^ Cin;
    assign Cout = A&&B || ((A ^ B) && Cin);
    
endmodule
