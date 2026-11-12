`timescale 1ns / 1ps

module tb_mux_16bit;
    reg [15:0] i0, i1;
    reg s;
    wire [15:0] y;

    mux_16bit uut (
        .i0(i0),
        .i1(i1),
        .s(s),
        .y(y)
    );

    initial begin
        $monitor("Time=%0t ns | s=%b | i0=0x%h | i1=0x%h | y=0x%h", 
                 $time, s, i0, i1, y);
    end

    initial begin
        i0 = 16'h0000; i1 = 16'hFFFF; s = 0; #10;
        
        i0 = 16'h0000; i1 = 16'hFFFF; s = 1; #10;

        i0 = 16'h5555; i1 = 16'hAAAA; s = 0; #10;

        i0 = 16'h5555; i1 = 16'hAAAA; s = 1; #10;

        i0 = 16'h1234; i1 = 16'h89AB; s = 0; #10;
        s = 1; #10;

        $finish;
    end

endmodule