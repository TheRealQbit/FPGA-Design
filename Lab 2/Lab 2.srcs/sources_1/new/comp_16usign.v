`timescale 1ns / 1ps
module comp_16usign(
    input [15:0] a0, b0,
    output gt, eq, ls
    );
    
    wire [15:0] gt_bit;
    wire [15:0] eq_bit;
    wire [15:0] ls_bit;
    
    wire [15:0] gt_stage;
    wire [15:0] eq_stage;
    wire [15:0] ls_stage;
    
    genvar j;
    
    generate    
        for (j=0; j<16; j = j+1) begin: comp_stage
            comp_1usign comp_inst(
                .a0(a0[j]),
                .b0(b0[j]),
                .gt(gt_bit[j]),
                .eq(eq_bit[j]),
                .ls(ls_bit[j])
            ); 
        end
    endgenerate 
    
    assign gt_stage[15] = gt_bit[15];
    assign eq_stage[15] = eq_bit[15];
    assign ls_stage[15] = ls_bit[15];
    
    generate
        for (j = 14; j>=0; j = j-1) begin: gen_cascade_chain
            assign gt_stage[j] = gt_stage[j+1] | (eq_stage[j+1] & gt_bit[j]);
            assign ls_stage[j] = ls_stage[j+1] | (eq_stage[j+1] & ls_bit[j]);
            assign eq_stage[j] = eq_stage[j+1] & eq_bit[j];
        end
    endgenerate
    
    assign gt = gt_stage[0];
    assign eq = eq_stage[0];
    assign ls = ls_stage[0];
    
endmodule
