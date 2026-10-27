`timescale 1ns / 1ps

module mux_16bit(
    input [15:0] i0, i1,
    input s,
    output [15:0] y
    );
    
    generate 
    genvar j;
        for (j = 0; j<16; j = j + 1) begin: mux_stage
            mux_2bit mux_inst(
                .i0(i0[j]),
                .i1(i1[j]),
                .s(s),
                .y(y[j])
                );
        end
    endgenerate 
endmodule
