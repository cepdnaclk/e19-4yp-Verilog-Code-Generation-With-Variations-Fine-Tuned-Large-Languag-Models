```
module state_Mealy(
    input clk,
    input dcontrol,
    input [31:0] data,
    output reg [31:0] bus,
    output reg [2:0] output_array
);

reg [31:0] output_array_r = 0;
reg [2:0] output_array_s = 0;
reg [2:0] output_array_r_s = 0;

reg [2:0] output_array_ss = 0;
reg [2:0] output_array_ss_s = 0;

assign output_array = output_array_r_s;
assign output_array_s = output_array_ss_s;

// Mealy state machine
always @(posedge clk)
begin
  if (dcontrol) begin
    if (data[2:0] == 4'b0111) begin
      output_array_r_s <= 3'b000;
    end else if (data[2:0] == 4'b1011) begin
      output_array_r_s <= 3'b001;
    end else if (data[2:0] == 4'b0101) begin
      output_array_r_s <= 3'b010;
    end else if (data[2:0] == 4'b1001) begin
      output_array_r_s <= 3'b100;
    end else begin
      output_array_r_s <= 3'bz;
    end
  end

  output_array_r <= output_array_r_s;
end

// Moore state machine
always @(posedge clk)
begin
  if (dcontrol) begin
    if (data[2:0] == 4'b0000) begin
      output_array_ss_s <= 3'b000;
    end else if (data[2:0] == 4'b0010) begin
      output_array_ss_s <= 3'b00