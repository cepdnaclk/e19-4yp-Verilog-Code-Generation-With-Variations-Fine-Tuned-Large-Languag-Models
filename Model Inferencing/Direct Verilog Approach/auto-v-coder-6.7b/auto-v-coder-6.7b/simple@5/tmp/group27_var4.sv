```verilog
typedef struct packed {
    logic a;
    logic b;
} in_struct;

typedef struct packed {
    logic s;
    logic ca;
} out_struct;

module struct_module(out_struct, in_struct);
   input in_struct;
   output out_struct;
   
   ha_9 hh(.s(out_struct.s),.ca(out_struct.ca),.a(in_struct.a),.b(in_struct.b));
   
   initial begin
      $monitor($time, " a = %b, b