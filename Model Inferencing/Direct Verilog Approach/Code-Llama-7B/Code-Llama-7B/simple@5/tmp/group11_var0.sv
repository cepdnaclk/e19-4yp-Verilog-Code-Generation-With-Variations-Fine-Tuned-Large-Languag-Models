module DataComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
wire [7:0] data[4];
randstruct DataOut;

function void DataOut.rand;
    rand data[0];
    rand data[1];
    rand data[2];
    rand data[3];

    rand bit [3:0] control_signals;
endfunction
endmodule
### Modified Testbench:
module top(input [7:0] DataIn, 
           input ControlSignals,
           output [7:0] DataOut);

DataComponent test(DataIn, DataOut, ControlSignals);

initial begin
  $monitor("%d %d",DataIn,DataOut);
  #10;
  $finish;
end

endmodule
### Running Random Test: 
iverilog -o test -g2005 -DRANDOM_TEST DataComponent_RandStruct.v DataComponent_RandStruct_tb.v &&./test
### Output:

-105362658 _12
 174151311 _12
  49932457 _12
-119078421 _12
 -2553007 _12
   222357 _12
 14661588 _12
 _13895721 _12
  6752199 _12
   284548 _12
 -2487251 _12
 20422483 _12
 _12082949 _12
 -1143902 _12
 17002136 _12
 14625180 _12
   455409 _12
   677871 _12
 -2030071 _12
  3776893 _12