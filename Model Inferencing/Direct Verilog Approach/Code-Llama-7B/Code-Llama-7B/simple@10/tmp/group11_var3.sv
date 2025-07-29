module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;

typedef struct packed {logic [7:0] rand; logic [7:0] rand2;} DataType;
DataType Data;
Data = '{rand: DataIn, rand2: DataIn};

endmodule
### Test Bench Coding:
### Base Test Bench:
initial begin
  #20;
  $finish;
end

module DataComponent_tb;
  logic [7:0] DataIn, DataOut;
  logic ControlSignals;
  DataComponent U0 (.*);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    DataIn = 8'h88;
    ControlSignals = 1'b1;
    //$monitor("dataIn = %b, ControlSignals = %b, DataOut = %b", DataIn, ControlSignals, DataOut);

    #10;
    DataIn = 8'h11;
    #10 DataOut = 8'h11;
    #10;
    DataIn = 8'h22;
    #10 DataOut = 8'h22;
    #10;
    DataIn = 8'h33;
    #10 DataOut = 8'h33;
    #10;
    DataIn = 8'h44;
    #10 DataOut = 8'h44;
    #10;
    DataIn = 8'h55;
    #10 DataOut = 8'h55;
    #10;
    DataIn = 8'h66;
    #10 DataOut = 8'h66;
    #10;
    DataIn = 8'h77;
    #10 DataOut = 8'h77