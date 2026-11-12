`timescale 1ns / 1ps
module scn_controller(
    input  wire clk,
    input  wire reset,
    input  wire clk_locked,
    output reg  [3:0] an,
    output reg  clk_out
);

    reg [15:0] counter;
    reg tick;

    always @(posedge clk or negedge clk_locked) begin
        if (!clk_locked) begin
            counter <= 16'd0;
            clk_out <= 1'b0;
            tick <= 1'b0;
        end else if (counter == 16'd49_999) begin
            counter <= 16'd0;
            clk_out <= ~clk_out;
            tick <= ~clk_out;
        end else begin
            counter <= counter + 1'b1;
            tick <= 1'b0;
        end
    end

    reg [1:0] state;
    always @(posedge clk) begin
        if (reset || !clk_locked) begin
            state <= 2'd0;
            an <= 4'b1111;
        end else if (tick) begin
            case (state)
                2'd0: an <= 4'b1110;
                2'd1: an <= 4'b1101;
                2'd2: an <= 4'b1011;
                2'd3: an <= 4'b0111;
            endcase
            state <= state + 1'b1;
        end
    end
endmodule