module show_aaaaaaaa(ao,ai); // NOT gate with delay 2
  output [1:0] ao; // packed enum
  input [1:0] ai; // packed enum
  wire [1:0] ao, ai; // packed enum
  not #2 (ao,ai);
endmodule
### Verilator Code:
module show_aaaaaaaa(const_char* showname, const_char* filename, const_char* dirname); // Verilator main function
  input [1:0] ai; // packed enum
  output [1:0] ao; // packed enum
  showshow(showname,filename,dirname); // shows show
  show_aaaaaaaa(showname,filename,dirname); // shows show_aaaaaaaa
 ...
endmodule
### Testbench Code:
const_char* showname = "show_aaaaaaaa.sv"; // show name
const_char* filename = "show_aaaaaaaa.sv"; // shows show_aaaaaaaa
const