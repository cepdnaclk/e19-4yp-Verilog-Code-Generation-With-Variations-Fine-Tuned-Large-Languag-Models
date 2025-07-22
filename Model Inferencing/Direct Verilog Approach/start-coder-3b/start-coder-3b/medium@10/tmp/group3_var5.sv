module FA;
    reg [14:0] A;
    reg [14:0] B;
    reg [14:0] S;
    reg [13:0] C;
    reg [31:0] R;
    reg [31:0] C_out;
    reg [30:0] S_out;
    reg [30:0] C_S_out;
    reg [1:0] C_in;
    reg [5:0] S_in;
    reg [7:0] C_S_in;
    reg [1:0] C_S_in_1;
    reg [7:0] C_S_in_2;
    reg [2:0] C_S_in_3;
    reg [4:0] S_in_1;
    reg [4:0] S_in_2;
    reg [4:0] S_in_3;

    always @(posedge clk)
    begin
        C_out <= C;
        S_out <= S;
        C_S_out <= C_S;
        C_in <= 1'b0;
        S_in <= 1'b0;
        C_S_in <= 1'b0;
        S_in_1 <= 1'b0;
        S_in_2 <= 1'b0;
        S_in_3 <= 1'b0;
        C_S_in_1 <= 1'b0;
        C_S_in_2 <= 1'b0;
        C_S_in_3 <= 1'b0;
        C_S_in <= C_S;

        if (C_S!= 0) begin
            C_in <= C_S[4];
            S_in <= 4'b0;
            if(C_S[4:3] == 4'b01) begin
                S_in_1 <= S;
                S_in_2 <= S_in_1;
                S_in_3 <= S_in_2;
                S_in <= S_in_3 >> 1;
            end
            else if(C_S[4:3] == 4'b10) begin
                S_in_1 <= S;
                S_in_2 <= S_in_1;
                S_in_3 <= S_in_2;
                S_in <= S_in_3 << 1;
            end
            else if(C_S[4:3] == 4'b11) begin
                S_in_1 <= S;
                S_in_2 <= S_in_1;
                S_in_3 <= S_in_2;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
            end
            else if(C_S[4:3] == 4'b100) begin
                S_in_1 <= S;
                S_in_2 <= S_in_1;
                S_in_3 <= S_in_2;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
            end
            else if(C_S[4:3] == 4'b110) begin
                S_in_1 <= S;
                S_in_2 <= S_in_1;
                S_in_3 <= S_in_2;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
            end
            else if(C_S[4:3] == 4'b101) begin
                S_in_1 <= S;
                S_in_2 <= S_in_1;
                S_in_3 <= S_in_2;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
            end
            else if(C_S[4:3] == 4'b111) begin
                S_in_1 <= S;
                S_in_2 <= S_in_1;
                S_in_3 <= S_in_2;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
            end
            else if(C_S[4:3] == 4'b1100) begin
                S_in_1 <= S;
                S_in_2 <= S_in_1;
                S_in_3 <= S_in_2;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
            end
            else if(C_S[4:3] == 4'b1010) begin
                S_in_1 <= S;
                S_in_2 <= S_in_1;
                S_in_3 <= S_in_2;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
            end
            else if(C_S[4:3] == 4'b1111) begin
                S_in_1 <= S;
                S_in_2 <= S_in_1;
                S_in_3 <= S_in_2;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
                S_in <= S_in_3 << 1;
            end
            C_S_in <= {C_S[4:0], S_in[1:0]};
        end

        A <= R[14:2];
        B <= R[13:0];
        S <= S_in_3;
        C <= C_in;
        C_S <= C_S_in;

        if (A == B) begin
            S_out <= 15'h0;
            C_out <= 1'b0;
            C_S_out <= 2'b00;
        end
        else if(A[15] == 1'b1) begin
            fa0: FA #(1'b1) FA0(A, B, S, C, C_S_out, S_out);
            fa1: FA #(1'b1) FA1(A, B, S, C, C_S_out, S_out);
            fa2: FA #(1'b1) FA2(A, B, S, C, C_S_out, S_out);
            fa3: FA #(1'b1) FA3(A, B, S, C, C_S_out, S_out);
        end
        else begin
            fa0: FA #(1'b0) FA0(A, B, S, C, C_S_out, S_out);
            fa1: FA #(1'b0) FA1(A, B, S, C, C_S_out, S_out);
            fa2: FA #(1'b0) FA2(A, B, S, C, C_S_out, S_out);
            fa3: FA #(1'b0) FA3(A, B, S, C, C_S_out, S_out);
        end
    end
endmodule