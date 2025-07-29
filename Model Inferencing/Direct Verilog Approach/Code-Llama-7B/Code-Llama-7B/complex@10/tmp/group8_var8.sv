module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;
generate
if(num_bits == 4)
	begin
		always @ (posedge clock, posedge reset)
		if (reset == 1) count <= 0;
		else if (enable)
		case (count)
		4'b0000,
		4'b0001,
		4'b0011,
		4'b0111: count <= {count[2: 0], 1'b1};
		4'b1111,
		4'b1110,
		4'b1100,
		4'b1000: count <= {count[2: 0], 1'b0};
		default: count <= 0;
		endcase
	end
	if(num_bits == 8)
	begin
		always @ (posedge clock, posedge reset)
		if (reset == 1) count <= 0;
		else if (enable)
		case (count)
		8'b00000000, 
		8'b00000001, 
		8'b00000011, 
		8'b00000111,
		8'b00000110, 
		8'b00001110, 
		8'b00001100, 
		8'b00011100,
		8'b00011101, 
		8'b00011001, 
		8'b00111001, 
		8'b00111011,
		8'b00111111, 
		8'b00110111, 
		8'b00110110, 
		8'b00100110,