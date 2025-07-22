module or_fr_rl(output [0:0]  DataOut,
				input [0:0]  DataIn);
  // Declare DataOut and DataIn as unpacked structures
  // containing both logic and string fields
  // Declare DataOut and DataIn as unpacked structures
  // containing both logic and string fields
  typedef struct packed { logic [0:0] Data; string name; } DataPacked;
  DataPacked DataIn1, DataOut1;
  assign DataOut1.Data = DataIn1.Data; // Assign output to input
  initial begin
    $monitor("DataIn %b %s @ %0t", DataIn1.Data, DataIn1.name, $time);
    $monitor("DataOut %b %s @ %0t", DataOut1.Data, DataOut1.name, $time);
    DataIn1=1'b0; DataIn1.name = "DataIn"; // Set input to 0
    #10 DataIn1=1'b1; DataIn1.name = "DataIn"; // Set input to 1
    #40 DataIn1=1'b0; DataIn1.name = "DataIn"; // Set input to 0
    $monitor("DataOut1.name: %s", DataOut1.name);
  end
  // Force DataOut to 0 at time 0
  initial force DataOut1.Data = 1'b0, DataOut1.name = "DataOut";
  // Release DataOut at time 20
  initial release DataOut1;
  // Force DataOut to 1 at time 30
  initial force DataOut1.Data = 1'b1, DataOut1.name = "DataOut";
  // Release DataOut at time 40
  initial release DataOut1;
endmodule
### Testbench:
module orfr_tst; // Testbench for OR gate with force/release
  reg b,c; wire a;
  initial begin b=1'b0; c=1'b0; #20 $stop; end // Initialize inputs
  always #3 c = ~c; // Toggle input 'c' every 3 time units
  or_fr_rl dd(a,b,c); // Instantiate the module containing force/release
endmodule
### Output:
DataIn 0 DataIn @ 0
DataOut 0 DataOut @ 0
DataIn 1 DataIn @ 3
DataOut 0 DataOut @ 3
DataIn 0 DataIn @ 6
DataOut 0 DataOut @ 6
DataIn 1 DataIn @ 9
DataOut 1 DataOut @ 9
DataIn 0 DataIn @ 12
DataOut 1 DataOut @ 12
DataIn 1 DataIn @ 15
DataOut 1 DataOut @ 15
DataIn 0 DataIn @ 18
DataOut 1 DataOut @ 18
DataOut1.name: DataOut