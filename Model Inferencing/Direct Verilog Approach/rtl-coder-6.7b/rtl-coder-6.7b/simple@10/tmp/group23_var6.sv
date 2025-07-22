localparam DTot = DBuf + DClk;
DFF #(byte) DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
### Expected Output:
-Error (10164): Verilog HDL syntax error at Module(dff_struct_l.v,10)
### Actual Output:
-Error (10148): Verilog HDL syntax error at Module(dff_struct_l.v,9)
-Verilog HDL syntax error at Module(dff_struct_l.v,10)
-Error (3716): Invalid port connection in instantiation at Module(dff_struct_l.v,14)
-Error (3767): Invalid port connection in instantiation at Module(dff_struct_l.v,15)
-Error (3769): Invalid port connection in instantiation at Module(dff_struct_l.v,16)
-Error (3771): Invalid port connection in instantiation at Module(dff_struct_l.v,17)
-Error (3772): Invalid port connection in instantiation at Module(dff_struct_l.v,18)
-Error (3773): Invalid port connection in instantiation at Module(dff_struct_l.v,19)
-Error (3774): Invalid port connection in instantiation at Module(dff_struct_l.v,20)
-Error (3776): Invalid port connection in instantiation at Module(dff_struct_l.v,21)
-Error (3777): Invalid port connection in instantiation at Module(dff_struct_l.v,22)
-Error (3778): Invalid port connection in instantiation at Module(dff_struct_l.v,23)
-Error (3779): Invalid port connection in instantiation at Module(dff_struct_l.v,24)
-Error (3780): Invalid port connection in instant