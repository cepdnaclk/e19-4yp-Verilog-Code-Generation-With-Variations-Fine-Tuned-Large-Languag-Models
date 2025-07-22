module tst_ctr_wt;
reg clk,En;
reg[3:0]N;
wire[3:0]a;
generatE #(.N(4)) u_ctr_wt(a,clk,N,En);
initial
begin
clk=0; N=4'b1111; // Set limit to 15
En=1'b0; // Start disabled
end
always
initial #35 $stop; // Stop simulation
initial $monitor($time,"clk=%b, En=%b, N=%d, a=%d",clk,En,N,a); // Corrected format specifiers
endmodule
genvar i,j;
generate
    for (i=0; i<`N; i=i+1) begin
        ctr_wt #(.W($clog2(`N)),.M(1'b1)) ctr([i:i],clk,N,En);
    end

    for (i=0; i<`W; i=i+1) begin
        for (j=0; j<`N; j=j+1) begin
            if ((j+1)<`N) begin
                ctr_wt #(.W($clog2(`N)),.M(1'b0)) ctr([i:i],clk,N,En);
            end
        end
    end
endgenerate