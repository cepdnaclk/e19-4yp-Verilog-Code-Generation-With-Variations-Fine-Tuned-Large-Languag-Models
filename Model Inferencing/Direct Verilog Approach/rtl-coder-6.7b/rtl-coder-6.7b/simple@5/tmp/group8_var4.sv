module IR ( input [7:0] data_in, input load, clk,
input [1:0] instruction_opcode,
output reg [7:0] data_out );
reg [7:0] ALU_result = '0;
reg [15:0] instruction;

always @( posedge clk )
if ( load ) data_out <= data_in;

always @( posedge clk )
if ( load ) instruction <= {data_in, instruction_opcode};

always @( posedge clk )
begin
if ( load )
begin
case (instruction_opcode)
3'b000 : ALU_result = instruction[7:0] + 1;
3'b001 : ALU_result = instruction[7:0] - 1;
3'b010 : ALU_result = instruction[7:0] + 2;
3'b011 : ALU_result = instruction[7:0] - 2;
3'b100 : ALU_result = instruction[7:0] + 3;
3'b101 : ALU_result = instruction[7:0] - 3;
3'b110 : ALU_result = instruction[7:0] + 4;
3'b111 : ALU_result = instruction[7:0] - 4;
default : ALU_result = '0;
endcase
end
end
endmodule