```verilog
module aoi_gate(o,a1,a2,b1,b2);
input a1,a2,b1,b2; // a1,a2,b1,b2 form the input
//ports of the module
output o; //o is the single output port of the module
wire o1,o2; //o1 and o2 are intermediate signals
//within the module
and g1(o1,a1,a2); //The AND gate primitive has two
and g2(o2,b1,b2);// instantiations with assigned
//names g1 & g2.
nor g3(o,o1,o2);//The nor gate has one instantiation
//with assigned name g3.

// Assuming XMR values from 0 to 31 and 0x00000000 to 0x7FFFFFFF as input
reg [4:0] XMR [0:31]; // Packed Array
initial begin
  XMR[0] = 5'b10000;
  XMR[1] = 5'b01000;
  XMR[2] = 5'b00100;
  XMR[3] = 5'b00010;
  XMR[4] = 5'b00001;
  //...
  XMR[30] = 5'b01110;
  XMR[31] = 5'b01111;
end

always @(*) begin
  case(XMR[31])
    5'b10000: 
      a1 = XMR[0];
    5'b01000: 
      a2 = XMR[1];
    5'b00100: 
      b1 = XMR[2];
    5'b00010: 
      b2 = XMR[3];
    5'b00001: 
      o1 = XMR[4];
    //...
    default: 
      o = XMR[31];
  endcase
end