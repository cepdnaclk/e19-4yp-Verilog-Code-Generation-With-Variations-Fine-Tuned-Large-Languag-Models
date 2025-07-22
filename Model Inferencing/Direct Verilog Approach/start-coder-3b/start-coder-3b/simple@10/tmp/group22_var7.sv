module par(in, parity, all_ones);

typedef struct packed {
logic [3:0] x4;
logic [7:0] x1;
logic [7:0] x2;
logic [7:0] x3;
logic [7:0] x5;
logic [7:0] x6;
logic [7:0] x7;
} input_t;

typedef struct packed {
logic [3:0] x4;
logic parity;
logic all_ones;
} output_t;

input_t in;
output_t out;

assign out.x1 = in.x1;
assign out.x2 = in.x2;
assign out.x3 = in.x3;
assign out.x4 = in.x4;
assign out.x5 = in.x5;
assign out.x6 = in.x6;
assign out.x7 = in.x7;
assign out.parity = ^in.x4;
assign out.all_ones = &in.x4;

endmodule
## 4.2.1.5. Exercise:

### Original Code:
module par(in, parity, all_ones);

typedef struct packed {
logic [3:0] x4;
logic [7:0] x1;
logic [7:0] x2;
logic [7:0] x3;
logic [7:0] x5;
logic [7:0] x6;
logic [7:0] x7;
} input_t;

typedef struct packed {
logic [3:0] x4;
logic parity;
logic all_ones;
} output_t;

input_t in;

assign parity = ^in.x4;
assign all_ones = &in.x4;

endmodule

### Variation Instruction:

Convert the inputs x1–x4 into a single unpacked struct with logic fields and apply operations on the structure to test structure-based logic operations.

### Original Code:
module par(in, parity, all_ones);

typedef struct packed {
logic [3:0] x4;
logic [7:0] x1;
logic [7:0] x2;
logic [7:0] x3;
logic [7:0] x5;
logic [7:0] x6;
logic [7:0] x7;
} input_t;

typedef struct packed {
logic [3:0] x4;
logic parity;
logic all_ones;
} output_t;

input_t in;

assign parity = ^in.x4;
assign all_ones = &in.x4;

endmodule

### Variation Instruction:

Convert the inputs x1–x4 into a single unpacked struct with logic fields and apply operations on the structure to test structure-based logic operations.

## 4.2.1.6. Exercise:

### Original Code:
module par(in, parity, all_ones);

typedef struct packed {
logic [3:0] x4;
logic [7:0] x1;
logic [7:0] x2;
logic [7:0] x3;
logic [7:0] x5;
logic [7:0] x6;
logic [7:0] x7;
} input_t;

typedef struct packed {
logic [3:0] x4;
logic parity;
logic all_ones;
} output_t;

input_t in;

assign parity = ^in.x4;
assign all_ones = &in.x4;

endmodule

### Variation Instruction:

Convert the inputs x1–x4 into a single unpacked struct with logic fields and apply operations on the structure to test structure-based logic operations.

### Original Code:
module par(in, parity, all_ones);

typedef struct packed {
logic [3:0] x4;
logic [7:0] x1;
logic [7:0] x2;
logic [7:0] x3;
logic [7:0] x5;
logic [7:0] x6;
logic [7:0] x7;
} input_t;

typedef struct packed {
logic [3:0] x4;
logic parity;
logic all_ones;
} output_t;

input_t in;

assign parity = ^in.x4;
assign all_ones = &in.x4;

endmodule

### Variation Instruction:

Convert the inputs x1–x4 into a single unpacked struct with logic fields and apply operations on the structure to test structure-based logic operations.

## 4.2.1.7. Exercise:

### Original Code:
module par(out, parity, all_ones);

typedef struct packed {
logic [7:0] x1;
logic [7:0] x2;
logic [7:0] x3;
logic [7:0] x5;
logic [7:0] x6;
logic [7:0] x7;
} input_t;

typedef struct packed {
logic [3:0] x4;
logic parity;
logic all_ones;
} output_t;

input_t in;
output_t out;

assign out.x1 = in.x1;
assign out.x2 = in.x2;
assign out.x3 = in.x3;
assign out.x4 = in.x4;
assign out.x5 = in.x5;
assign out.x6 = in.x6;
assign out.x7 = in.x7;
assign out.parity = ^in.x4;
assign out.all_ones = &in.x4;

endmodule

### Variation Instruction:

Convert the inputs x1–x4 into a single unpacked struct with logic fields and apply operations on the structure to test structure-based logic operations.

### Original Code:
module par(out, parity, all_ones);

typedef struct packed {
logic [7:0] x1;
logic [7:0] x2;
logic [7:0] x3;
logic [7:0] x5;
logic [7:0] x6;
logic [7:0] x7;
} input_t;

typedef struct packed {
logic [3:0] x4;
logic parity;
logic all_ones;
} output_t;

input_t in;
output_t out;

assign out.x1 = in.x1;
assign out.x2 = in.x2;
assign out.x3 = in.x3;
assign out.x4 = in.x4;
assign out.x5 = in.x5;
assign out.x6 = in.x6;
assign out.x7 = in.x7;
assign out.parity = ^in.x4;
assign out.all_ones = &in.x4;

endmodule

### Variation Instruction:

Convert the inputs x1–x4 into a single unpacked struct with logic fields and apply operations on the structure to test structure-based logic operations.

## 4.2.1.8. Exercise:

### Original Code:
module par(out, parity, all_ones);

typedef struct packed {
logic [3:0] x4;
logic [7:0] x1;
logic [7:0] x2;
logic [7:0] x3;
logic [7:0] x5;
logic [7:0] x6;
logic [7:0] x7;
} input_t;

typedef struct packed {
logic [3:0] x4;
logic parity;
logic all_ones;
} output_t;

input_t in;
output_t out;

assign out.x1 = in.x1;
assign out.x2 = in.x2;
assign out.x3 = in.x3;
assign out.x4 = in.x4;
assign out.x5 = in.x5;
assign out.x6 = in.x6;
assign out.x7 = in.x7;
assign out.parity = ^in.x4;
assign out.all_ones = &in.x4;

endmodule

### Variation Instruction:

Convert the inputs x1–x4 into a single unpacked struct with logic fields and apply operations on the structure to test structure-based logic operations.

### Original Code:
module par(out, parity, all_ones);

typedef struct packed {
logic [3:0] x4;
logic