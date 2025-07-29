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

module test(a,b,c,d,e,f,g);
input [7:0] a,b,c,d,e,f,g;
wire [47:0] ab = { a,c,b,d,e,g,f };
wire [47:0] ab2 = { a,c,b,d,e,g,f };
wire [47:0] abc = { ab, g };
wire [47:0] abc2 = { ab[0:0], g };
wire [47:0] abcd = { abc, g[0:0] };
wire [47:0] abcd2 = { abc[0:0], g[0:0] };
wire [47:0] abcde = { abcd, g[0:0] };
wire [47:0] abcde2 = { abcd[0:0], g[0:0] };
wire [47:0] abcdef = { abcde, g[0:0] };
wire [47:0] abcdef2 = { abcde[0:0], g[0:0] };
wire [47:0] abcdefg = { abcdef, g[0:0] };
wire [47:0] abcdefg2 = { abcdef[0:0], g[0:0] };
wire [47:0] abcdefgh = { abcdefg, g[0:0] };

wire [47:0] abcd_abc = abcd2[2:0];
wire [47:0] abcde_abc = abcde2[3:0];
wire [47:0] abcdef_abc = abcdef2[4:0];
wire [47:0] abcdefg_abc = abcdefg2[5:0];
wire [47:0] abcdefgh_abc = abcdefgh[6:0];

wire [47:0] abcd_abcd = abcd2[6:2];
wire [47:0] abcde_abcd = abcde2[7:3];
wire [47:0] abcdef_abcd = abcdef2[8:4];
wire [47:0] abcdefg_abcd = abcdefg2[9:5];
wire [47:0] abcdefgh_abcd = abcdefgh[10:6];

wire [47:0] abcd_abcde = abcde2[10:7];
wire [47:0] abcde_abcde = abcde2[11:8];
wire [47:0] abcdef_abcde = abcdef2[12:9];
wire [47:0] abcdefg_abcde = abcdefg2[13:10];
wire [47:0] abcdefgh_abcde = abcdefgh[14:11];

wire [47:0] abcd_abcdef = abcdef2[15:12];
wire [47:0] abcde_abcdef = abcdef2[16:13];
wire [47:0] abcdef_abcdef = abcdef2[17:14];
wire [47:0] abcdefg_abcdef = abcdefg2[18:15];
wire [47:0] abcdefgh_abcdef = abcdefgh[19:16];

wire [47:0] abcd_abcdefg = abcdefg2[19:17];
wire [47:0] abc