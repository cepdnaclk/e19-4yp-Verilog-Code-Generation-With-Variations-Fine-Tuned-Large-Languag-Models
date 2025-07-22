module tb_RAM;
reg[3:0] Adr;
reg[7:0] Ibus;
wire[7:0] Obus;
reg Clk, Read;

initial begin
    Adr = 0;
    Ibus = 0;
    Read = 0;
    Clk = 0;
    #1 Clk = 1;
end

initial begin
    #16 InitializeStorage();
end

task InitializeStorage;
    #1 Ibus = 1;
    #1 Adr = 1;
    #1 Ibus = 2;
    #1 Adr = 2;
    #1 Ibus = 3;
    #1 Adr = 3;
    #1 Ibus = 4;
    #1 Adr = 4;
endtask

initial begin
    while(Adr!= 4) begin
        #1 Clk = 0;
        #1 Clk = 1;
        #1 Adr = Adr + 1;
    end
end

RAM RAM(.*);
endmodule