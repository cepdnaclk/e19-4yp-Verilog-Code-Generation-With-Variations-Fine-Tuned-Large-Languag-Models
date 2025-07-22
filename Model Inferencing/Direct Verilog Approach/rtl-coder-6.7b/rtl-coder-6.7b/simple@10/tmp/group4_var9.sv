module testbench ();
generate data;
typedef struct {
  bit [3:0] data;
} struct_t;

rand struct_t data_i;

process data;
endmodule
### Testing Code:
module testbench ();
generate data;
typedef struct {
  bit [3:0] data;
} struct_t;

rand struct_t data_i;

int i;

process data;
for (i = 0; i < 100; i = i + 1) begin
  $display("%d\n", data_i);
end
endmodule