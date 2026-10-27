`timescale 1ns / 1ps
module look_ahead4(
    input g3, g2, g1, g0, p3, p2, p1, p0, c0,
    output c4, c3, c2, c1, g, p
    );
    assign p = p3 & p2 & p1 & p0;
    assign g = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0);

    assign c1 = g0 | (p0 & c0);
    assign c2 = g1 | (p1 & g0) | (p1 & p0 & c0);
    assign c3 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & c0);
    assign c4 = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & c0);
endmodule