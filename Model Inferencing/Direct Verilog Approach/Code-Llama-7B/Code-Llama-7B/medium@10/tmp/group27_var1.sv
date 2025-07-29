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
case (g_a_i[mux_sel][j][k])
   3'b010: g_m_2_i[j][k] = 1'b1;
   3'b111: if (g_m_1_i[j][k] == 1'b0)
            g_m_2_i[j][k] = 1'b1;
          else
            g_m_2_i[j][k] = 1'b0;
   3'b101: if (g_m_1_i[j][k] == 1'b0)
            g_m_2_i[j][k] = 1'b0;
          else
            g_m_2_i[j][k] = 1'b1;
   3'b001: if (g_m_1_i[j][k-1] == 1'b1)
            g_m_2_i[j][k] = 1'b0;
          else
            g_m_2_i[j][k] = 1'b1;
   3'b011: if (g_m_1_i[j][k] == 1'b1)
            g_m_2_i[j][k] = 1'b0;