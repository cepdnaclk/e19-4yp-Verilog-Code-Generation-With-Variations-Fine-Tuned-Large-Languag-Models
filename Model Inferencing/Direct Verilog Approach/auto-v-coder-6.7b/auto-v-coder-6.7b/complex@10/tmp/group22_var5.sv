```verilog
module tst_dffbehen;//test-bench
reg di,en;
wire do;
dffen d1(do,di,en); // Instantiate the D latch
initial
begin
en=0; // Latch initially disabled (opaque)
di=1'b0; // Initial data
end
always #7 en =~en; // Toggle enable every 7 time units
always #4 di=~di; // Toggle data every 4 time units
initial
$monitor($time,"en=%b, di=%b, do=%b",en,di,do);
initial #50 $stop; // Stop simulation

localparam [1:0] const_array[3] = '{1, 2, 3};
reg [1:0] s_cnt;

always @ (posedge en) 
begin
    if(const_array.find(s_cnt) inside {const_array})
    begin
        s_cnt <= const_array[s_cnt];
    end
    else
    begin
        s_cnt <= 0;
    end
end

generate 
begin:comb_block 
  combinational_block;
end 
endgenerate

endmodule 
```
In this revised version, the constant array `const_array` is defined with three elements. An instance variable `s_cnt` is declared as a register to keep track of the array index.

The `always` block updates `s_cnt` based on the enable signal `en`. If `s_cnt` is in the constant array, it is updated to the corresponding array element. If not, it resets to the first array element.

The `generate` block is used inside the `always` block to wrap the combinational logic inside a named escaped block `comb_block`. This is a common practice in Verilog to avoid combinational loop between D flip-flop and the combinational logic.

The combinational logic inside `comb_block` remains exactly the same as in the original code, it's simply a placeholder and not included in the original code. The combinational logic should be added here to avoid combinational loop between D flip