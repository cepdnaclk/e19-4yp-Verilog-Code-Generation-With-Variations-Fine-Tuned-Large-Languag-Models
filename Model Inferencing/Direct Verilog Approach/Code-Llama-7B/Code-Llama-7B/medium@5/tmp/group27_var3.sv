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

// Original testbench
module testbench();
    reg o1, o2;
    reg [1:0] a = 2'b00, b = 2'b00;

    aoi_gate uut (.o(o1),.a1(a[0]),.a2(a[1]),.b1(b[0]),.b2(b[1]));

    initial begin
        $monitor("\t %b %b %b %b %b", o1, a[0], a[1], b[0], b[1]);
        #5 a[0] = 1;
        #5 a[1] = 0;
        #5 b[0] = 0;
        #5 b[1] = 1;
        #5 a[0] =