`timescale 1ns / 1ps
module tb_scn_controller;
    reg  clk;
    reg  reset;
    reg  clk_locked;
    wire clk_out;
    wire [3:0] an;

    wire an0 = an[0];
    wire an1 = an[1];
    wire an2 = an[2];
    wire an3 = an[3];

    wire [15:0] counter = uut.counter;

    scn_controller uut(
        .clk(clk),
        .reset(reset),
        .clk_locked(clk_locked),
        .an(an),
        .clk_out(clk_out)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        clk_locked = 1'b0;
        reset      = 1'b1;

        #100;
        clk_locked = 1'b1;

        #100;
        reset = 1'b0;

        #10_000_000;

        $finish;
    end
endmodule