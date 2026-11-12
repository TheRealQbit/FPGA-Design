`timescale 1ns / 1ps
module display_top(
    input  wire clk,
    input  wire btnC,
    input  wire [15:0] sw,
    output wire [6:0]  seg,
    output wire dp,
    output wire [3:0]  an
);
    reg [1:0] rst_sync;
    always @(posedge clk) rst_sync <= {rst_sync[0], btnC};
    wire reset = rst_sync[1];

    scn_controller u_scan(
        .clk(clk),
        .reset(reset),
        .clk_locked(1'b1),
        .an(an),
        .clk_out()
    );

    reg [3:0] digit;
    always @(*) begin
        case (an)
            4'b1110: digit = sw[3:0];
            4'b1101: digit = sw[7:4];
            4'b1011: digit = sw[11:8];
            4'b0111: digit = sw[15:12];
            default: digit = 4'h0;
        endcase
    end

    segment_decoder u_dec(
        .value(digit),
        .seg(seg)
    );

    assign dp = 1'b1;
endmodule
