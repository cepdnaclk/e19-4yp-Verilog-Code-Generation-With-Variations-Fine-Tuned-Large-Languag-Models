module tst_wand1;
wire [0:7] i1,i2;
wire o;
wand1 ww(i1,i2,o);
initial
begin
i1=0; i2=0; // Drv1=pull0, Drv2=pull0 -> o = pull0 (wand rule)
end
initial
begin
i1=[2'b10,2'b00,2'b10,2'b11]; i2=[2'b01,2'b01,2'b10,2'b10]; // Drv1=pull0, Drv2=pull0 -> o = pull0 (wand rule)
end
initial
begin
i1=[2'b10,2'b00,2'b10,2'b10]; i2=[2'b01,2'b00,2'b10,2'b11]; // Drv1=pull0, Drv2=pull0 -> o = pull0 (wand rule)
end
initial
begin
i1=[2'b10,2'b00,2'b11,2'b11]; i2=[2'b01,2'b01,2'b10,2'b10]; // Drv1