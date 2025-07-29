module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
### Test Case:
module structL_in_byte_tb(dut_if dut);
reg [3:0] data_in; reg ena; reg clk; assign clk = 0;
wire [3:0] q; assign data_in = 'b1010; dut.D(data_in); dut.Ena(ena); dut.Clk(clk);
always begin #1 clk = ~clk; end
initial begin
  $dumpfile ("structL_in_byte.vcd");
  $dumpvars;
  ena = 1; #1 ena = 0; #1 ena = 1; #1 ena = 0;
  #200 $finish;
end
endmodule

"""
        self.vsrc = """
import "DPI-C" function void read_vfile(input string fname, output string data);
import "DPI-C" function void write_vfile(input string fname, input string data);
import "DPI-C" function void set_dump_file(input string fname);
module DFF (output wire Q, input wire D, input wire Clk);
endmodule

import "DPI-C" function void read_vfile(input string fname, output string data);
import "DPI-C" function void write_vfile(input string fname, input string data);
import "DPI-C" function void set_dump_file(input string fname);
module FourFlopsStructL #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3