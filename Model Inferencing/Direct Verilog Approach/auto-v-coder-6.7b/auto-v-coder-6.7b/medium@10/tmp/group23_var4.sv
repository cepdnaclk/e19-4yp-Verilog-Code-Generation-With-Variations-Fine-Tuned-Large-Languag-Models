Let's add a while loop condition with inside with array-slice operand and a constant range. This will help us demonstrate the use of 'while' construct in Verilog.

```verilog
module RAM (output[7:0] Obus, input[7:0] Ibus, input[3:0] Adr, input Clk, Read);
reg[7:0] Storage[15:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
if (Read==1'b0)
    Storage[Adr] <= Ibus;
else
    ObusReg <= Storage[Adr];
end

integer i;
initial begin
    // initialize array with random data
    for (i=0; i<15; i=i+1) begin
        Storage[i] = $random;
    end
    // print out the random data
    for (i=0; i<15; i=i+1) begin
        $display("Storage[%d] = %h", i, Storage[i]);
    end
    // read and write data
    // read from Storage[2]
    ObusReg <= Storage[2];
    // write to Storage[2]
    Storage[2] = Storage[4] + Storage[5];
    $display("Storage[2] = %h", Storage[2]);
end
endmodule
```
In this modified code, we've added an initialization block that initializes the array `Storage` with random values. We've also added a read and write operation in the `initial` block. The `ObusReg` is assigned the value of `Storage[2]`, and a new value is written to `Storage[2]` with the sum of `Storage[4]` and `Storage[5]`. The simulation will print out the initial values, and then the updated value of `Storage[2]`. 

Please keep in mind that Verilog doesn't support procedural assignments as in C-like languages. The `Storage[2]` assignment in the initial block is meant to demonstrate that Verilog does support array indexing and simple operations on array values. 

This code is an example