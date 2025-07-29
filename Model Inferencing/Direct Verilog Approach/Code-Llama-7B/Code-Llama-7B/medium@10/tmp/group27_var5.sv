module aoi_gate(o,a1,a2,b1,b2);
input a1,a2,b1,b2;// a1,a2,b1,b2 form the input
//ports of the module
output o;//o is the single output port of the module
wire o1,o2;//o1 and o2 are intermediate signals
//within the module
and g1(o1,a1,a2); //The AND gate primitive has two
and g2(o2,b1,b2);// instantiations with assigned
//names g1 & g2.
nor g3(o,o1,o2);//The nor gate has one instantiation
//with assigned name g3.
endmodule

assert property (
@(posedge clk) (
                    (r_state[1]) && (r_state[2]) ||
                    (r_state[2]) && (r_state[3]) ||
                    (r_state[3]) && (r_state[1]) ||
                    (r_state[1]) ||
                    (r_state[2]) ||
                    (r_state[3])
               )?
                    ( r_packed[4:6] ) :
                    ( r_packed[0:3] )
                )
);
### Description of the testbench file:
#### Testbench:
module aoi_gate_tb;
reg a1, a2, b1, b2;
wire o;
aoi_gate dut(o, a1, a2, b1, b2);
initial begin
  a1 = 1'b0;
  a2 = 1'b0;
  b1 = 1'b0;
  b2 = 1'b0;
  #10;
  a1 = 1'b1;
  b1 = 1'b1;
  #10;
  a1 = 1'b0;
  b1 = 1'b0;
  #10;
  a1 = 1'b1;
  a2 = 1'b1;
  b2 = 1'b1;
  #10;
  a2 = 1'b0;
  b2 = 1'b0;
  #10;
  a1 = 1'b0;
  a2 = 1'b0;
  b1 = 1'b1;
  b2 = 1'b1;
  #10;
  a1 = 1'b1;
  a2 = 1'b1;
  b1 = 1'b0;
  b2 = 1'b0;
  #10;
  a1 = 1'b0;
  a2 = 1'b0;
  b1 = 1'b1;
  b2 = 1'b1;
  #10;
  a1 = 1'b1;
  a2 = 1'b1;
  b1 = 1'b1;
  b2 = 1'b0;
  #10;
  a1 = 1'b1;
  a2 = 1'b1;
  b1 = 1'b1;
  b2 = 1'b1;
  #10;
  a1 = 1'b1;
  a2 = 1'b1;
  b1 = 1'b0;
  b2 = 1'b0;
  #10;
end
endmodule
#### Output:

![simulation-2](/assets/images/simulation-2.png)

#### Simulation Screenshot:
![simulation-2-1](/assets/images/simulation-2-1.png)

---
### Top 5 Features to learn this Quarter:
#### 1. 
#### 2. 
#### 3. 
####