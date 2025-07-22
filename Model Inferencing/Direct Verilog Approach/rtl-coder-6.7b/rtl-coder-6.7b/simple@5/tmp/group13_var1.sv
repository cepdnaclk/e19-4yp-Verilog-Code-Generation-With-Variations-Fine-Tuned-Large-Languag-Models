module Half_Adder_tb;
    reg A, B;
    logic [7:0] Sum, Carry;

    Half_Adder dut (
       .A(A),
       .B(B),
       .Sum(Sum),
       .Carry(Carry)
    );

    initial begin
        // Test case 1: A = 0, B = 0
        A = 0;
        B = 0;
        #10;
        $display("Sum: %b, Carry: %b", Sum, Carry);

        // Test case 2: A = 0, B = 1
        A = 0;
        B = 1;
        #10;
        $display("Sum: %b, Carry: %b", Sum, Carry);

        // Test case 3: A = 1, B = 0
        A = 1;
        B = 0;
        #10;
        $display("Sum: %b, Carry: %b", Sum, Carry);

        // Test case 4: A = 1, B = 1
        A = 1;
        B = 1;
        #10;
        $display("Sum: %b, Carry: %b", Sum, Carry);
    end
endmodule