#### Verilog module:
```verilog
module dynamic_dff(D, Clock, Resetn, Q);
input [1000:0] D;
input Clock, Resetn;
output [1000:0] Q;
genvar i;
generate
for (i=0; i<1001; i=i+1) begin: flipflop
lpm_ff_inst flipflop(.data(D[i]),.aclr(Resetn),.clock(Clock),.q(Q[i]));
defparam flipflop.lpm_width = 1;
end
endgenerate
endmodule
```

#### Testbench:
```verilog
module dynamic_dff_tb;
reg [1000:0] D;
reg Clock, Resetn;
wire [1000:0] Q;
dynamic_dff dut(D, Clock, Resetn, Q);
initial begin
    Resetn = 0;
    Clock = 'b0;
    #5
    Resetn = 1;
    #5
    D = <<1001{1'b1}};
    #10
    $display("D = %b", D);
    $display("Q = %b", Q);
    #10
    Clock = 'b1;
    #5
    Clock = 'b0;
    #5
    $display("Q = %b", Q);
    #10
    $finish;
end
always begin
    #5 Clock = ~Clock;
end
endmodule
```

This testbench uses the dynamic_dff module to test the flip flop with various dynamic values stored in the D register. The testbench first asserts the resetn and then asserts D values. After that, it asserts Clock and checks the Q values until completion. The dynamic value assignment is using the bit-vector '<<' operator to create a large bit vector of all ones. #10 is used to show the time elapsed after D is asserted. 

This dynamic_dff module can be further enhanced to support more complex operations in the D input register and verify the output