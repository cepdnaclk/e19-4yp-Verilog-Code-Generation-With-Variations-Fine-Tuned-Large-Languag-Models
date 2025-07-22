```
class SchedDelayA;
    reg a, b;
    task update;
        input reg b;
        begin
            a = b;
        end
    endtask
    task update2;
        input reg a;
        begin
            b <= a;
        end
    endtask
endclass

module top;
    SchedDelayA a;
    initial begin
        a = new;
        #10;
        a.update2(1'b1);
        #10;
        a.update(1'b0);
    end
endmodule
```
This code creates a class SchedDelayA with two reg variables. One task updates a based on input from b (the same as the other verilog code), and another task updates b based on input from a.
We create an instance of the class in the top module, and use the tasks to change the values of a and b.

Please note that this code is a bit different from the initial base verilog code because of the class-based structure. Also, the delay of the tasks may vary based on the simulation environment, you may need to adjust the delays as needed.

You should have a simulator installed to run the verilog code. After writing the code, you can compile the code and run in your simulator to verify the results. If you need to test the functionality of the class-based access, you can create additional tests within the top module to verify the functionality of the class. 

Remember that the code above does not involve any hardware simulation so it's just an example and might not give the same output as the original Verilog code. In a real-world scenario you might need to set up a Verilog simulation environment, write a testbench and verify the functionality of the tasks with the simulation results. In this case, you can use the built-in tasks in your Verilog environment for debugging, testing and verifying the functionality.

To run this code, you can copy it into a Verilog file and then run it in your Verilog simulator. The output will depend on the values you set after the a.update2(1'b1); and a.update(1'b0); lines. As per the initial code, depending on the b value after the update, the a value