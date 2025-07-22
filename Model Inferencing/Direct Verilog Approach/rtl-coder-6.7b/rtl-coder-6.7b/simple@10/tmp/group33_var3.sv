module ha_2(s,ca,a,b,struct_params); // Half Adder without gate delays
  input struct_params; // Use unpacked structure as parameters
  input a,b; output s,ca;
  xor #(struct_params.xor_delay) (s,a,b);
  and #(struct_params.and_delay) (ca,a,b);
  endmodule
### Verification Code:
module ha_2_test;
  localparam int unsigned struct_width = 4;
  localparam int signed struct_size = 2**struct_width;
  typedef enum logic signed [struct_width-1:0] {
    NPOS = 0,
    POS = 1,
    NEG = -1
  } delay_type;
  typedef struct packed {
    delay_type xor_delay;
    delay_type and_delay;
  } struct_params_t;
  typedef enum logic signed [3:0] {
    NAN = {POS,POS,-1},
    NEG_NEG = {NEG,NEG,0},
    NEG_POS = {NEG,POS,1},
    POS_NEG = {POS,NEG,-1},
    POS_POS = {POS,POS,2}
  } enum_type;
  // Verification Code:
  localparam int unsigned num_delays = 5;
  localparam int unsigned num_enum_types = 4; // 4 valid values
  enum_type enum_type_a;
  logic [struct_width-1:0] xor_delay_index, and_delay_index;
  struct_params_t struct_params;
  logic [struct_size-1:0] enum_delay_values;
  logic [struct_width-1:0] xor_delay_expected,and_delay_expected;
  typedef enum logic signed [struct_width-1:0] {
    NAN = -3,
    NEG_NEG = -2,
    NEG_POS = -1,
    POS_NEG = 0,
    POS_POS = 1
  } enum_type;
  typedef struct