```verilog
package comparator_pkg;
  integer [31:0] a[10] = 32'h00000000;
  integer [31:0] b[10] = 32'h10000000;
endpackage

module TOP(input CLK, input RST_X);
  reg [31:0] x;
  wire [3:0] comparator;
  comparator_pkg::a[0] = 1;
  comparator_pkg::a[1] = 2;
  comparator_pkg::a[2] = 4;
  comparator_pkg::a[3] = 8;
  comparator_pkg::a[4] = 16;
  comparator_pkg::a[5] = 32;
  comparator_pkg::a[6] = 64;
  comparator_pkg::a[7] = 128;
  comparator_pkg::a[8] = 256;
  comparator_pkg::a[9] = 512;

  comparator_pkg::b[0] = 1;
  comparator_pkg::b[1] = 2;
  comparator_pkg::b[2] = 4;
  comparator_pkg::b[3] = 8;
  comparator_pkg::b[4] = 16;
  comparator_pkg::b[5] = 32;
  comparator_