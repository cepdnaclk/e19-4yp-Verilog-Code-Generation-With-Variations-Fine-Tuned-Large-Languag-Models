module tstha_9();
  reg a,b; wire s,ca;
  ha_9 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  always begin #5 a=1;b=0; #5 a=0;b=1; #5 a=1;b=1; #5 a=0;b=0; end
//  initial #30 $stop;
endmodule
module ha_9(output s,ca,output ca,input a,input b);
  reg s;
  reg [3:0] clk; wire [3:0] clk2;
  assign clk2 = clk;
  adder add(.data1({a,b}),.data2({1'b1,1'b1}),.sum(s));
  alu alu_1 (.in1({a,b}),.in2(1'b1),.operation({ca}),.sum(ca),.carry(clk));
  always @(posedge clk2[0])
    begin
      clk=clk+1;
    end
endmodule
module adder(input logic [3:0][3:0] data1, data2, output logic [3:0] sum);
  assign sum = data1 + data2;
endmodule
module alu(.in1(data1),.in2(data2),.operation(operation),.sum(sum),.carry(carry));
//  reg [3:0] sum;
  reg carry;
  reg [3:0] data1,data2,operation;
  assign carry=0;
  assign sum=data1+data2;
endmodule
### Expected Result:
![simulation](https://github.com/johnnyawesome/COMP2200-DE1/blob/master/hw1/ex13/expected.PNG)
### My Simulation:
![simulation](https://github.com/johnnyawesome/COMP2200-DE1/blob/master/hw1/ex13/sim.PNG)