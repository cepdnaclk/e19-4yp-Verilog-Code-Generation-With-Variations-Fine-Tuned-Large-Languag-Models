module orfr_tst(
); // Testbench for OR gate with force/release
  reg b,c; wire a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,b,c); // Instantiate the module containing force/release
endmodule
module or_fr_rl(
    output wire a, input wire b, input wire c
); // Module containing force/release
    typedef struct packed {
        logic [7:0] data_in;
        string msg_in;
    } or_struct;
    or_struct data_in;
    or_struct data_out;
    
    always_comb begin
        data_in.data_in = b;
        data_in.msg_in = "I am B.";
        data_out.data_in = data_in.data_in | c;
        data_out.msg_in = data_in.msg_in;
        $display("%s", data_out.msg_in);
        $display("%b",data_out.data_in);
    end
                
    assign a = data_out.data_in;
endmodule
### Test:
```
vlib work
vlog orfr_tst.v or_fr_rl.v
vsim -novopt work.orfr_tst
```
Result:
```
Testbench initialisation

b = 0
data_in.data_in = 0
"I am B."
data_out.data_in = 0

b = 0
data_in.data_in = 0
"I am B."
data_out.data_in = 1

b = 1
data_in.data_in = 1
"I am B."
data_out.data_in = 1

b = 0
data_in.data_in = 0
"I am B."
data_out.data_in = 0

b = 1
data_