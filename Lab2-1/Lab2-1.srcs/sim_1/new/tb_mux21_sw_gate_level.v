`timescale 1ns / 1ps

module tb_mux21_sw_gate_level;
    reg s, a, b;
    wire out;

    // Instantiate Unit Under Test (UUT)
    mux21_sw_gate_level uut (
        .out(out), 
        .s(s), 
        .a(a), 
        .b(b)
    );

    // Continuous signal generators with offset periods to show all input combinations
    initial begin
        a = 0;
        b = 0;
    end

    always #10 a = ~a; // 'a' toggles every 10 ns (Period = 20 ns)
    always #20 b = ~b; // 'b' toggles every 20 ns (Period = 40 ns)

    // Drive Select signal and control test run time
    initial begin
        s = 0;
        
        // --- Phase 1: Test s = 0 (out must mirror 'a' continuously) ---
        #80; 
        
        // --- Phase 2: Test s = 1 (out must mirror 'b' continuously) ---
        s = 1;
        #80;
        
        // --- Phase 3: Toggle 's' rapidly to show live MUX switching ---
        s = 0; #20;
        s = 1; #20;
        s = 0; #20;
        
        $finish; // Stops simulation at 220 ns total runtime
    end

    // Real-time console output monitor
    initial begin
        $monitor("Time=%0t ns | Select(s)=%b | Input A=%b | Input B=%b | Output=%b", 
                 $time, s, a, b, out);
    end

endmodule