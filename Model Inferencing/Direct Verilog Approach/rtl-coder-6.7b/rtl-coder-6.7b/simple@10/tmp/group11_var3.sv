module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

typedef struct {
  rand bit [7:0] Data;
} DataStruct;

DataStruct DataStruct_instance0;
DataStruct DataStruct_instance1;

endmodule
### Randomization Code:
initial begin
  $display("Testing DataComponent");
  repeat (10) begin
    DataComponent.DataStruct_instance0.randomize();
    DataComponent.DataStruct_instance1.randomize();
  end
end
### Expected Result:
- Replace the data construct with a struct containing a rand member to test randomization inside a structure.