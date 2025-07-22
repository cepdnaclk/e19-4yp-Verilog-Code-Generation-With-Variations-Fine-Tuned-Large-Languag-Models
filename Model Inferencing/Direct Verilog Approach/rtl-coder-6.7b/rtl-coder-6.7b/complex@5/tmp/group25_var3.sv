```verilog
module comparator(
        input [15:0]  HiCount;
        output logic [LOG2_ADJR-1:0] Adjr;
    );
    localparam integer NADJR = LOADS_PER_HICOUNT * ADJR_PER_LOAD;
    logic [LOG2_ADJR-1:0] adjrq;
    always @ (*) begin
        adjrq = 0;
        if (HiCount > 0) begin
            foreach (HiCount[i]) begin
                if (HiCount < (i+1)) begin
                    adjrq = i;
                end
            end
        end
    end
    assign Adjr = adjrq;
endmodule
```