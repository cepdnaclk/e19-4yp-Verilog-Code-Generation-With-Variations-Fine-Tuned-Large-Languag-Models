```
class SchedDelayA;
  reg a, b;
  
  function new();
    a = 0; 
    b = 0;
  endfunction
  
  task setAB(input reg a_val, b_val);
    a <= a_val;
    b <= b_val;
  endtask
  
  task run();
    fork 
      forever begin
        a = b;
      end
      forever begin
        b <= a;
      end
    join
  endtask
  
endclass

initial begin
  SchedDelayA sched_delay_a = new(); // Create object of the class
  sched_delay_a.setAB(1'b1, 1'b0);
  sched_delay_a.run();
end
```

In this code, we have created the SchedDelayA class with two reg type variables a and b. The `new()` method is used to initialize the values of the variables. The `setAB` method is used to set the values of a and b. The `run` task is a method to start the simulation.

In the initial block, an object is created from the class `SchedDelayA` and set its values using the `setAB` method. Then the `run` method is called to start the simulation. The values of a and b are switched as per the base verilog code.

The fork and join constructs are used to start the tasks concurrently as they represent independent processes in the system. The code block inside the fork is executed concurrently with other forked tasks. The join statement waits for all forked tasks to finish their tasks. 

This code should be synthesizable and can be run on a simulator or synthesis tool to verify the implementation. 

Please make sure to run the code in a proper environment as it might not work properly on all software simulators.

Note: This code only demonstrates a simplified version of the base verilog code. The actual verilog code is more complex and might need additional features like clocking for proper simulation. This is also a bit simplified version of the verilog code, actual Verilog codes might require a proper clocking block for proper simulation. 

Also, this code should be synthesizable and can