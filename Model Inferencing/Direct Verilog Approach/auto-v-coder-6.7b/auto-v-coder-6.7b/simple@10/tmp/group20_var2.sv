```verilog
module latch (input d, c, output q, q_b, output logic [1:0] q_un );

// Define a packed union
typedef union packed {
    logic [7:0] q_un_packed;
    logic [1:0] q_un_ind;
} q_union;

q_union q_union_inst;

always begin
    wait ( c );
    q <= d;
    q_union_inst.q_un_ind[1] = d;
    q_union_inst.q_un_ind[0] =!d;
end

assign q_un[7:0] = q_union_inst.q_un_packed;
assign q_un[1:0] = q_union_inst.q_un_ind;

endmodule
```
In this code, we have created a packed union and an instance of it. 

The union allows us to have multiple types of data on the same wire. We assign one variable to the packed union, and the other variable to the individual bits. This allows us to define the output with two-bit or eight-bit widths, depending on the assignment.

The "q_b" output is declared using the bitwise negation (!d) of the bit "d".

Please remember to assign the module to a testbench and change the input and output signals accordingly for your own test case.

The testbench code may look like:
```verilog
module testbench;
    reg d, c;
    wire q, q_b;
    wire [1:0] q_un;

    latch UUT(d, c, q, q_b, q_un);

    initial begin
        d = 1'b0; c = 1'b0;
        #10;
        c = 1'b1;
        #10;
        d = 1'b1; c = 1'b0;
        #10;
        c = 1'b1;
        #10;
        $finish;
    end
endmodule
```
This testbench drives the "d" and "c" signals to test the two variations of output