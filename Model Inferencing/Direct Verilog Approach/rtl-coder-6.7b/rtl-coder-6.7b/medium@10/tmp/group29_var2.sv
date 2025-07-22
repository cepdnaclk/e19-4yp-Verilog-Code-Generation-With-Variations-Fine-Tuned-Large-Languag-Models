while(1) begin
    if (x.size()>1) begin
        for (int i=0;i<(x.size()-1);i++) begin
            if (x[i]>x[i+1]) begin
                muxdff(x[i],x[i+1],1,1,x[i+1]);
                x[i+1] = x[i+1];
            end
        end
    end
end
### Simulation Trace:
Error: Verilog.Sig.Lit.Num.Bin.Bit.Width.Exp.Width.Sig.Bit.Width.Exp.Width.Sim.Fmt.Err.Num.Bin.Bit.Width ([1:0] $bit [1:0] $bit)