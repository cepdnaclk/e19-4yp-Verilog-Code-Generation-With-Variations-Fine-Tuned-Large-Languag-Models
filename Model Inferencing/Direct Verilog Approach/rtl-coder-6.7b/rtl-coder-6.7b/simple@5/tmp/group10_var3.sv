module alu_4(output [3:0]d,out_cout, input [3:0]a,b,input [1:0]f, input cout); // Add inout cout
  always @(*) // Altera's Verilog Syntax
    case(f)
      2'b00 : {d,out_cout}=a+b;
      2'b01 : {d,out_cout}=a-b;
      2'b10 : {d,out_cout}=a|b;
      2'b11 : {d,out_cout}=a&b;
    endcase
endmodule