`
    while(i<3) begin
        i=i+1;
        j_reg[i]=j;
    end
`
### Variable Definition:
`
    int j_reg[3];
`
### Variable Assignment:
`
    j_reg[1]=1;
    j_reg[2]=2;
    j_reg[3]=3;
`
### Variable Read:
`
    j_reg[j]
`
### Verilog Code:
`
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg [1:0] j_reg[3];
reg [1:0] j;
reg [1:0] i;
always @(posedge Clock)
begin
    i=0;
    while(i<3) begin
        i=i+1;
        j_reg[i]=j;
    end
    Q1 <= D;
    Q2 <= Q1;
end
endmodule
`
### Test Code:
`
    class test;
    extern example7_4 tb;
    initial begin
        #5ns;
        tb.D=1;
        #5ns;
        tb.D=2;
        #5ns;
        tb.D=3;
        #5ns;
        assert(tb.Q1==3);
        assert(tb.Q2==3);
        #5ns;
        tb.D=4;
        #5ns;
        assert(tb.Q1==4);
        assert(tb.Q2==4);
        #5ns;
        tb.D=5;
        #5ns;
        assert(tb.Q1==5);
        assert(tb.Q2==5);
        $finish();
    end
    endclass
`