module test;
wire a;
typedef struct packed {
  reg x;
  reg y;
  reg z;
} PackedStruct;
PackedStruct packedStruct;
assign #25 packedStruct.z = 1;
always begin
  packedStruct.x = #10 packedStruct.z;
end
endmodule