module DFF (input a, b, output y);
DFF_inst u_dff(a, b, y);
endmodule
module DFF_inst (input a, b, output y);