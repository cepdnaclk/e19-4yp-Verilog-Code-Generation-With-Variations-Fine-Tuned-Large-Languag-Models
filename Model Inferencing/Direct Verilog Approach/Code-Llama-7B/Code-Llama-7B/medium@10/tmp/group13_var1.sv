module tst_wand1;
		reg i1,i2;
		wire o;
		wand1 ww(i1,i2,o);
		reg [1:0] D;
		reg [0:1] Y;
		reg [0:1] Z;
		integer i;
		initial
		begin
			i1=0; i2=0;
		end
		initial
		begin
			i=0;
			D=0;
			Y=0;
			Z=0;
			repeat (2)
			begin
				i=i+1;
				if (i==2) begin
					D[i] <= 1;
					Z[i] <= 1;
				end
				if (i==3) begin
					if (i<$size(D)) begin
						D[i] <= 1;
						Z[i] <= 1;
					end
					else begin
						$display("ERROR: Index value is out of bounds");
					end
				end