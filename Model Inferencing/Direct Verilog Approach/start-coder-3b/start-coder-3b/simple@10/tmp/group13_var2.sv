// Verilog code for Problem 5
module Logic_7_Segment_Decoder(
    input [7:0] a,
    input [1:0] b,
    output logic[11:0] q
);
    always @ (*) begin
        case (b)
            0: begin // For 0
                q[0] = 1;
                q[1] =