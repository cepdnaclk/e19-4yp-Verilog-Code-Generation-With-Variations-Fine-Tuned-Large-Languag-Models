```verilog
package DataPackage;
  typedef struct {
    rand bit [7:0] DataIn;
  } DataComponent_t;
endpackage

module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

DataPackage::DataComponent_t DataStruct;

initial begin
  DataStruct = new;
  $display("Randomized DataIn value: %0d", DataStruct.DataIn);
end

assign DataOut = DataStruct.DataIn;

endmodule
```

In this code, we have created a struct package containing a struct with a rand member. Then, we instantiate this struct and randomize it at the beginning. The randomized value is assigned to the DataOut output. This allows us to test the randomization capabilities in Verilog. Note that, it would not work if the struct is instantiated inside the module. In this case, we need to instantiate it before the module instantiation because we are doing randomization in the initial block.