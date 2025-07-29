module show_aa(ao,ai); // NOT gate with delay 2
  output ao; input ai; wire ao, ai;
  parameter A_DEF = 3'b101;
  parameter B_DEF = 3'b110;
  parameter A_NON_DEFAULT = 3'b100;
  parameter B_NON_DEFAULT = 3'b011;
  parameter WIDTH_DEF = 3; 
  parameter WIDTH_NON_DEFAULT = 3;
  localparam DEFAULT_WIDTH = 8;
  localparam DEFAULT_WIDTH_2  = 8;
  typedef enum logic [WIDTH_NON_DEFAULT-1:0] {
    ENUM_ZERO = 3'b000,
    ENUM_ONE = 3'b001,
    ENUM_TWO = 3'b010,
    ENUM_THREE = 3'b011,
    ENUM_FOUR = 3'b100,
    ENUM_FIVE = 3'b101,
    ENUM_SIX = 3'b110,
    ENUM_SEVEN = 3'b111
  } packed_enum;
  logic [WIDTH_DEF-1:0] a;
  logic [WIDTH_DEF-1:0] b;
  always_comb begin
    a = ai;
    b = ai;
  end
  packed_enum a_packed;
  packed_enum b_packed;
  always_comb begin
    a_packed = a;
    b_packed = b;
  end
  always_comb ao = (a_packed == ENUM_ONE && b_packed == ENUM_TWO);
endmodule
### Unit Under Test (UUT):
module top ();
  wire a;
  wire b;
  wire ao;
  show_aa SHOW_AA_inst0 (ao, a);
  show_aa SHOW_AA_inst1 (b, a);
  assign a = 3'b001;