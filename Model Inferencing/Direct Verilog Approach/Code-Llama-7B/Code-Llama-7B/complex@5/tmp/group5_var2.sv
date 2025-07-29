module mealy(Clock, Resetn, w, z);
input Clock, Resetn, w;
output z;
reg y, Y, z;
parameter A = 0, B = 1, W = 2;
logic [2:0] w_i = W'(0);
always @(w or y)
    case (y)
        A: if (W'(w_i) == W'(2'b01))
            begin
                z = 0;
                Y = B;
            end
        else
            begin
                z = 0;
                Y = A;
            end
        B: if (W'(w_i) == W'(2'b10))
            begin
                z = 1;
                Y = B;
            end
        else
            begin
                z = 0;
                Y = A;
            end
    endcase
always @(negedge Resetn or posedge Clock)
    if (Resetn == 0) y <= A;
    else y <= Y;
endmodule
### Snapshot:
![Image of mealy_w_inside](mealy_w_inside.PNG)
### Synthesis Results:
#### Base:
![Image of mealy_base.png](mealy_base.png)
#### W_inside:
![Image of mealy_w_inside.png](mealy_w_inside.png)
#### Synthesis Flow:
![Image of mealy_synth.png](mealy_synth.png)
### Test Bench:
module tb_mealy();
logic Clk, Resetn;
logic w, z;
logic [1:0] in1;
logic [1:0] out1;
logic [2:0] in2;
logic [2:0] out2;

mealy a1 (
	.Clock(Clk),
	.Resetn(Resetn),
	.w(w),
	.z(z)
);


initial Clk = 0;

always #10 Clk = ~Clk;

initial begin
	Resetn = 0;
	in1 = 2'b00;
	in2 = 3'b000;
	w = 0;
	#100
	Resetn = 1;
	#100
	in1 = 2'b00;
	w = 1;
	#100
	in1 = 2'b01;
	#100
	in1 = 2'b10;
	#100
	in1 = 2'b11;
	#100
	in1 = 2'b01;
	#100
	in1 = 2'b00;
	#100
	in1 = 2'b01;
	#100
	in1 = 2'b00;
	#100
	in2 = 3'b100;
	#100
	in2 = 3'b101;
	#100
	in2 = 3'b110;
	#100
	in2 = 3'b111;
	#100
	in2 = 3'b010;
	#100
	in2 = 3'b011;
	#100
	in2 = 3'b001;
	#100
	in2 = 3'b000;
	#100
	#100
	#100
	#100
	#100
	w = 0;
	#100
	in2 = 3'b101;
	#100
	in2 = 3'b100;
	#100
	in2 = 3'b001;
	#100
	in2 = 3'b000;
end

always @(in1 or out1)
	begin
		out1 = out1 - 1'b1;
	end

always @(in2 or out2)
	begin
		out2 = out