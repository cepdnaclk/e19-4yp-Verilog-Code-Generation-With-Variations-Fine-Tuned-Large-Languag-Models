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
always @(*) begin
case(a1)
1'b0: case(a2)
1'b0: case(b1)
1'b0: case(b2)
1'b0: begin
o=1'b0;//This instruction is the new instruction.
end
1'b1: case(b2)
1'b0: begin
o=1'b0;//This instruction is the new instruction.
end
1'b1: begin
o=1'b1;//This instruction is the new instruction.
end
default: begin
o=1'bx;//This instruction is the new instruction.
end
endcase
1'b1: case(b2)
1'b0: begin
o=1'b1;//This instruction is the new instruction.
end
1'b1: begin
o=1'bx;//This instruction is the new instruction.
end
default: begin
o=1'bx;//This instruction is the new instruction.
end
endcase
default: case(a2)
1'b0: case(b1)
1'b0: case(b2)
1'b0: begin
o=1'b0;//This instruction is the new instruction.
end
1'b1: case(b2)
1'b0: begin
o=1'b1;//This instruction is the new instruction.
end
1'b1: begin
o=1'bx;//This instruction is the new instruction.
end
default: begin
o=1'bx;//This instruction is the new instruction.
end
endcase
1'b1: case(b1)
1'b0: case(b2)
1'b0: begin
o=1'b1;//This instruction is the new instruction.
end
1'b1: begin
o=1'bx;//This instruction is the new instruction.
end
default: begin
o=1'bx;//This instruction is the new instruction.
end
endcase
default: case(b1)
1'b0: case(b2)
1'b0: begin
o=1'b0;//This instruction is the new instruction.
end
1'b1: begin
o=1'bx;//This instruction is the new instruction.
end
default: begin
o=1'bx;//This instruction is the new instruction.
end
endcase
default: case(b2)
1'b0: begin
o=1'b0;//This instruction is the new instruction.
end
1'b1: begin
o=1'bx;//This instruction is the new instruction.
end
default: begin
o=1'bx;//This instruction is the new instruction.
end
endcase
default: begin
o=1'bx;//This instruction is the new instruction.
end
endcase
default: case(a1)
1'b0: case(a2)
1'b0: case(b1)
1'b0: case(b2)
1'b0: begin
o=1'b0;//This instruction is the new instruction.
end
1'b1: case(b2)
1'b0: begin
o=1'b1;//This instruction is the new instruction.
end
1'b1: begin
o=1'bx;//This instruction is the new instruction.
end
default: begin
o=1'bx;//This instruction is the new instruction.
end
endcase
1'b1: case(b1)
1'b0: case(b2