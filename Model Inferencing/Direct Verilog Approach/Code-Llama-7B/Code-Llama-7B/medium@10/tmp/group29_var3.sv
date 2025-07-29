```verilog
module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
always @(posedge Clock)
    if (!Sel)
        Q <= D0;
    else
        Q <= D1;
endmodule

wire Q[9:0];
reg [7:0] Data[9:0];

int i;

initial begin
	$display("Testing MUX-DFF");
	for (i = 0; i < 10; i++) begin
		Data[i] <= i + 1;
	end
	
	#10
	$display("Initial values:");
	for (i = 0; i < 10; i++) begin
		$display("%d: %0d", i, Data[i]);
	end
	$display("");

	for(i = 0; i < 10; i++) begin
		//MUX_DFF_F2(Q, Data[i], Sel, Clock);
		//MUX_DFF_F3(Q, Data[i], Sel, Clock);
		muxdff(D0, D1, Sel, Clock, Q);
		if (i == 0) begin
			Sel = 0;
			Clock = 1;
		end
		else if (i == 1) begin
			Sel = 1;
			Clock = 1;
		end
		else begin
			Sel = 0;
			Clock = 0;
		end
		
		#1;
		//Sel = 1;
		//Clock = 1;
		//#1;
		//Sel = 0;
		//Clock = 1;
		//#1;
		//Sel = 0;
		//Clock = 0;
		//#1;
		//Sel = 1;
		//Clock = 0;
	end
	
	$display("Output values:");
	for (i = 0; i < 10; i++) begin
		$display("%d: %0d", i, Q[i]);
	end
	$display("");
end


```

### Result:

| Clock | Sel |  Q[0] |  Q[1] |  Q[2] |  Q[3] |  Q[4] |  Q[5] |  Q[6] |  Q[7] |  Q[8] |  Q[9] |
| :---- | :-- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| 0     | 0   | 0     | 0     | 0     | 0     | 0     | 0     | 0     | 0     | 0     | 0     |
| 1     | 0   | 1     | 1     | 1     | 1     | 1     | 1     | 1     | 1     | 1     | 1     |
| 0     | 0   | 1     | 1     | 1     | 1     | 1     | 1     | 1     | 1     | 1     | 1     |
| 1     | 0   | 2     | 2     | 2     | 2     | 2     | 2     | 2     | 2     | 2     | 2     |
| 0     | 0   | 2     | 2     | 2     | 2     | 2     | 2     | 2     | 2     | 2     | 2     |
| 1     | 0   | 3     | 3     | 3     | 3     | 3     | 3     | 3     | 3     | 3     | 3     |
| 0     | 0   | 3     | 3     | 3     | 3     |