`timescale 1ns / 1ps

module tb_alu4;

    reg [3:0] a;
    reg [3:0] b;
    reg [3:0] op;

    wire [3:0] result;
    wire carry;
    wire overflow;
    wire zero;
    
    integer total_tests = 0;
    integer mismatch_count = 0;
    
    reg [3:0] exp_R;
    reg exp_C;
    reg exp_V;
    reg exp_Z;
    reg [4:0] add_ext;
    
    alu4_fixed uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .carry(carry),
        .overflow(overflow),
        .zero(zero)
    );

    integer total_tests = 0;
    integer mismatch_count = 0;

    reg [3:0] exp_R;
    reg exp_C;
    reg exp_V;
    reg exp_Z;
    reg [4:0] add_ext;

    // Apply vectors, wait and report failures
    task run_test;
        input [3:0] test_a;
        input [3:0] test_b;
        input [3:0] test_op;
        begin
            a  = test_a;
            b  = test_b;
            op = test_op;

            #50;

            exp_R = 4'b0000;
            exp_C = 1'b0;
            exp_V = 1'b0;

            case (op)
                4'b0000: exp_R = a & b; // AND 
                4'b0001: exp_R = a | b; // OR
                4'b0010: begin // ADD
                    add_ext = {1'b0, a} + {1'b0, b};
                    exp_R   = add_ext[3:0];
                    exp_C   = add_ext[4];
                    exp_V   = (a[3] == b[3]) && (exp_R[3] != a[3]);
                end
                4'b0110: begin // SUB
                    exp_R   = a - b;
                    exp_C   = (a < b);
                    exp_V   = (a[3] != b[3]) && (exp_R[3] != a[3]);
                end
                4'b0111: exp_R = ($signed(a) < $signed(b)) ? 4'b0001 : 4'b0000; // SLT
                4'b1100: exp_R = ~(a | b); // NOR
                default: exp_R = 4'b0000; // Invalid opcodes default to 0
            endcase

            exp_Z = (exp_R == 4'b0000);
            total_tests = total_tests + 1;

            // Use !== to ensure X or Z states cannot silently pass
            if ((result !== exp_R) || (carry !== exp_C) || (overflow !== exp_V) || (zero !== exp_Z)) begin
                $display("[%0t ns] FAIL: a=%h, b=%h, op=%b | OBSERVED: R=%h C=%b V=%b Z=%b | EXPECTED: R=%h C=%b V=%b Z=%b",
                         $time, a, b, op, result, carry, overflow, zero, exp_R, exp_C, exp_V, exp_Z);
                mismatch_count = mismatch_count + 1;
            end
        end
    endtask

    // Control variables for loops
    integer op_idx, a_val, b_val;
    reg [3:0] legal_ops [0:5];

    initial begin
    
        exp_R  = 4'b0;
        exp_C  = 1'b0;
        exp_V  = 1'b0;
        exp_Z  = 1'b0;
        op_idx = 0;
        a_val  = 0;
        b_val  = 0;
        
        legal_ops[0] = 4'b0000; // AND
        legal_ops[1] = 4'b0001; // OR
        legal_ops[2] = 4'b0010; // ADD
        legal_ops[3] = 4'b0110; // SUB
        legal_ops[4] = 4'b0111; // SLT
        legal_ops[5] = 4'b1100; // NOR

        $display("Starting Comprehensive Self-Checking ALU Testbench");

        run_test(4'h7, 4'h3, 4'b0010); // ADD Positive Overflow
        run_test(4'hF, 4'h1, 4'b0010); // ADD Carry-out & Zero
        run_test(4'h0, 4'h1, 4'b0110); // SUB Unsigned Borrow
        run_test(4'h8, 4'h1, 4'b0110); // SUB Negative Overflow
        run_test(4'h0, 4'h1, 4'b0111); // SLT True
        run_test(4'h7, 4'h8, 4'b0111); // SLT False
        run_test(4'h0, 4'h0, 4'b1100); // NOR
        run_test(4'hC, 4'h3, 4'b0000); // AND Zero flag

        // P, Q Tests (P=0, Q=8)
        run_test(4'h0, 4'h8, 4'b0110); // SUB P(0), Q(8)
        run_test(4'h0, 4'h8, 4'b0111); // SLT P(0), Q(8)

        // All 16x16 combinations
        for (op_idx = 0; op_idx < 6; op_idx = op_idx + 1) begin
            for (a_val = 0; a_val < 16; a_val = a_val + 1) begin
                for (b_val = 0; b_val < 16; b_val = b_val + 1) begin
                    run_test(a_val[3:0], b_val[3:0], legal_ops[op_idx]);
                end
            end
        end

        // Unhandled Opcode Test (e.g., 4'b1111)
        run_test(4'h5, 4'h3, 4'b1111);

        a = 4'hC; b = 4'h3;
        op = 4'b0000; #50 run_test(4'hC, 4'h3, 4'b0000);
        op = 4'b0001; #50 run_test(4'hC, 4'h3, 4'b0001);
        op = 4'b0010; #50 run_test(4'hC, 4'h3, 4'b0010);
        op = 4'b0110; #50 run_test(4'hC, 4'h3, 4'b0110);
        op = 4'b0111; #50 run_test(4'hC, 4'h3, 4'b0111);
        op = 4'b1100; #50 run_test(4'hC, 4'h3, 4'b1100);

              #50;

        // Summary Report
        $display("Testbench Complete");
        $display("Total Tests Executed : %0d", total_tests);
        $display("Total Mismatches     : %0d", mismatch_count);
        if (mismatch_count == 0) begin
            $display("STATUS: PASS");
        end else begin
            $display("STATUS: FAIL");
        end

        $finish;
    end

endmodule