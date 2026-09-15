module testAdder4; // Testbench module
    parameter N = 8; //size of the test set
    reg addend; // create the 4-bit addend variable A
    reg augend ; // create a 4-bit augend variable to hold B
    reg cin; // carry in
    wire sum; // a net to route sum as ouptut
    wire cout; // carry out
    reg addend_array [1:N];
    reg cin_array [1:N];
    reg augend_array [1:N];
    reg sum_array [1:N];
    reg cout_array [1:N];
    
    initial
    begin
        //initialization of addend_array
        addend_array[1] = 1'b0;
        addend_array[2] = 1'b0;
        addend_array[3] = 1'b0;
        addend_array[4] = 1'b0;
        addend_array[5] = 1'b1;
        addend_array[6] = 1'b1;
        addend_array[7] = 1'b1;
        addend_array[8] = 1'b1;
        //initialization of cin_array
        cin_array[1] = 1'b0;
        cin_array[2] = 1'b1;
        cin_array[3] = 1'b0;
        cin_array[4] = 1'b1;
        cin_array[5] = 1'b0;
        cin_array[6] = 1'b1;
        cin_array[7] = 1'b0;
        cin_array[8] = 1'b1;
        //initialization of augend_array
        augend_array[1] = 1'b0;
        augend_array[2] = 1'b0;
        augend_array[3] = 1'b1;
        augend_array[4] = 1'b1;
        augend_array[5] = 1'b0;
        augend_array[6] = 1'b0;
        augend_array[7] = 1'b1;
        augend_array[8] = 1'b1;
        //initialization of sum_array (expected sum outputs)
        sum_array[1] = 1'b0;
        sum_array[2] = 1'b1;
        sum_array[3] = 1'b1;
        sum_array[4] = 1'b0;
        sum_array[5] = 1'b1;
        sum_array[6] = 1'b0;
        sum_array[7] = 1'b0;
        sum_array[8] = 1'b1;
        //initialization of cout_array (expected carry output)
        cout_array[1] = 1'b0;
        cout_array[2] = 1'b0;
        cout_array[3] = 1'b0;cout_array[4] = 1'b1;
        cout_array[5] = 1'b0;
        cout_array[6] = 1'b1;
        cout_array[7] = 1'b1;
        cout_array[8] = 1'b1;
    end
    integer i;
    always
        begin
            for ( i = 1 ; i <= N ; i =i + 1 )
                begin
                    $display(i);
                    addend <= addend_array[i]; // assign test data to the addend vector
                    augend <= augend_array[i]; // assign test data to the augend vector
                    
                    cin <= cin_array[i]; // assign carry in
                    
                    #40; // delay for 40 time units
                    if (!(sum == sum_array[i] & cout == cout_array[i]))
                        begin
                            $write("ERROR: ");
                            $display("Wrong Answer ");
                        end
                    else
                        begin
                            $display("Correct!!");
                        end
                    end
                $display("Test Finished");
            end
    FullAdder add1(addend, augend, cin, sum, cout); // instantiate one-bit adder module
endmodule