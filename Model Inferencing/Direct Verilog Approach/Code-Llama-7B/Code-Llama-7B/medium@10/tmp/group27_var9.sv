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




// Original verilog code from: http://www.sunburst-design.com/papers/CummingsSNUG2000SJ_NBA.zip
//
// The aoi_gate module is the basic building block for a
// AOI array.
//


module aoi_gate(o,a1,a2,b1,b2);
  input a1,a2,b1,b2;
  output o;

  wire o2, o1;

  and g1(o1,a1,a2);
  and g2(o2,b1,b2);
  nor g3(o,o1,o2);
endmodule

//
// AOI_array is the module that constructs the full sized
// AOI array from an AOI_gate
//

module aoi_array(o, a);
  parameter width = 8;
  input [width-1:0] a;
  output [width-1:0] o;

  wire [width-1:0] o2;
  aoi_gate g [0:width-1] (o2, a[0:width-1]);

  aoi_gate g1(o[0], a[1:width], o2[1:width]);
endmodule

//
// aoi_array_test is the top level module for the test
//

module aoi_array_test;
  reg [3:0]  a;
  wire [3:0]  o;

  aoi_array i1 (o, a);

  initial begin
    $display("AOI_array_test");
    $display("Initial values o=%b", o);

    a = 4'b0001;
    #10 $display("a=%b o=%b", a, o);

    a = 4'b0010;
    #10 $display("a=%b o=%b", a, o);

    a = 4'b0100;
    #10 $display("a=%b o=%b", a, o);

    a = 4'b1000;
    #10 $display("a=%b o=%b", a, o);

    a = 4'b1111;
    #10 $display("a=%b o=%b", a, o);

    a = 4'b0011;
    #10 $display("a=%b o=%b", a, o);

    a = 4'b1010;
    #10 $display("a=%b o=%b", a, o);

    a = 4'b1100;
    #10 $display("a=%b o=%b", a, o);

    a = 4'b0111;
    #10 $display("a=%b o=%b", a, o);

    a = 4'b1110;
    #10 $display("a=%b o=%b", a, o);

    a = 4'b0000;
    #10 $display("a=%b o=%b", a, o);

  end
endmodule


// Original verilog code from: http://www.sunburst-design.com/papers/CummingsSNUG2000SJ_NBA.zip
//
// The oai_gate module is the basic building block for a
// OAI