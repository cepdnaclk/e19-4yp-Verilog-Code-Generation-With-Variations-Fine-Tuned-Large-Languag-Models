module mux_8_1(sel,in,out);    
    input [2:0] sel;
    input [7:0] in;
    output out;
    wire [7:0] out;
    reg[7:0] out;
    always @(*) begin
        case (sel)
            3'b000 : out = in[0  +: 8];
            3'b001 : out = in[8  +: 8];
            3'b010 : out = in[16 +: 8];
            3'b011 : out = in[24 +: 8];
            3'b100 : out = in[32 +: 8];
            3'b101 : out = in[40 +: 8];
            3'b110 : out = in[48 +: 8];
            3'b111 : out = in[56 +: 8];
            default : out = 0;