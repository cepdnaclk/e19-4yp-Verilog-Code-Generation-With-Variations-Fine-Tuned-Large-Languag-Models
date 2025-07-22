```verilog
module testbench ();
`include "uvm_macros.svh"
import uvm_pkg::*;

struct packed{
  bit [3:0] rand_member;
} data;

`uvm_object_utils(testbench)

function new(string name = "testbench");
  super.new(name);
endfunction

task run_phase(uvm_phase phase);
  `uvm_info("TEST", "Running testbench", UVM_LOW)

  // Set a seed for randomization
  uvm_random::seed(12345);
  
  // Randomize the struct
  assert(data.randomize());

  // Print the value of rand_member
  `uvm_info("TEST", $sformatf("Randomized rand_member is: %0h", data.rand_member), UVM_LOW)

  // Get the value of rand_member
  if (data.rand_member == 1) begin
    `uvm_info("TEST", "rand_member equals 1", UVM_LOW)
  end else begin
    `uvm_error("TEST", "rand_member does not equal 1")
  end
endtask
endmodule
```

In this code, we have replaced the `data` construct with a struct and randomized it. The randomization is done by `randize()` function. It will produce a random value of `rand_member`. You can change the seed value for the randomization to allow different random sequences. The testbench class is a UVM component and has a run_phase method in which we can randomize and assert the rand_member member. If the rand_member is equal to 1, it will print a success message; otherwise, it logs an error.