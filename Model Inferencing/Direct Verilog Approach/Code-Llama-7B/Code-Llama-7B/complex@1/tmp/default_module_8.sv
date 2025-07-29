module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
wire [3: 0] count_data[1: 0];
generate
	genvar i;
	for(i = 0; i <= 1; i = i + 1) begin: gen_insts
		Johnson_Counter M0_index (count_data[i],
			enable,
			clock,
			reset);
	end
endgenerate

always @ (posedge clock, posedge reset)
	if (reset == 1) count = 0;
	else if (enable)
		count = count_data[inside];
endmodule

module t_Johnson_Counter ();
wire [3: 0] count;
reg enable;
reg clock, reset;
Johnson_Counter M0 (count, enable, clock, reset);
initial #500 $finish;
initial begin clock = 0; forever #5 clock = ~clock; end
initial fork
	begin #100 enable = 1; #100 enable = 0; end
	begin #200 enable = 1; #100 enable = 0; end
	begin #300 enable = 1; #100 enable = 0; end
	begin #400 enable = 1; #100 enable = 0; end
	begin #500 enable = 1; #100 enable = 0; end
	begin #600 enable = 1; #100 enable = 0; end
	begin #700 enable = 1; #100 enable = 0; end
	begin #800 enable = 1; #100 enable = 0; end
	begin #900 enable = 1; #100