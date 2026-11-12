`timescale 1ns / 1ps

module alu4_fixed (
    input wire [3:0] a, b,
    input wire [3:0] op,
    output reg [3:0] result,
    output reg carry, overflow, zero
    );
    
    reg [4:0] temp;
    
    always @(*) begin
        // non-arithmetic ops or unhandled opcodes
        result   = 4'b0000;
        temp     = 5'b00000;
        carry    = 1'b0;
        overflow = 1'b0;
        
        case (op)
            4'b0000: result = a & b;
            4'b0001: result = a | b;
            4'b0010: begin
                temp     = a + b;
                result   = temp[3:0];
                carry    = temp[4]; // Bit 4 represents carry-out past bit 3
                overflow = (a[3] == b[3]) && (result[3] != a[3]);
            end
            4'b0110: begin
                temp     = a - b;
                result   = temp[3:0];
                carry    = (a < b); // Carry = 1 if an unsigned borrow is required
                overflow = (a[3] != b[3]) && (result[3] != a[3]); // Correct SUB overflow detection
            end
            4'b0111: begin
                // Signed comparison ($signed) for Set Less Than
                result   = ($signed(a) < $signed(b)) ? 4'b0001 : 4'b0000;
            end
            4'b1100: result = ~(a | b);
            
            // All unhandled opcodes default to result=0000, carry=0, overflow=0
            default: result = 4'b0000;
        endcase
        
        // Zero flag evaluated on the final 4-bit result for ALL opcodes
        zero = (result == 4'b0000);
    end

endmodule