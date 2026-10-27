// =============================================================== 
// Source: Lab 1-1 Instructions [1] 
//=============================================================== 

`timescale 1ns / 1ps 

module mux21_sw(out, s, a, b);   

    output out;     //mux in 
    input s,a,b;    //mux out 
    wire w;         //internal wire     

    inv_sw (w,s);   //instantiating an inverter module     
    cmos C1 (out, a, w, s); //instantiating cmos switch 
    cmos C2 (out, b, s, w); 

endmodule 