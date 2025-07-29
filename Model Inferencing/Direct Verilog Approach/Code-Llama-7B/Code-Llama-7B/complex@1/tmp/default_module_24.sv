- `mup_opr.v`:
  - Modified in the following lines:
	- Line #64: 
		```diff
		-	wire [3:0] BCD_in; // Inputs to microprocessor
		+	wire [3:0] BCD_in [0:0];
		+	wire [1:0] BCD_in_select;
		+	assign BCD_in_select = { 2'b00, rr.i_o_sel[1:0]};
		+	assign BCD_in = pkg::consts[BCD_in_select];
		```
	- Line #758:
		```diff
		-	always @(INT or RR_I2)
		+	always @(INT or RR_I2 or pkg::consts)
		```
	- Line #801:
		```diff
		-	begin
		+		begin
		-			case(state)
		+				case(state)
		-					IDLE:
		+						case(state)
		-							IDLE:
		+								case(state)
		-									IDLE:
		+										IDLE:
		-											if (RR_I2==0)
		+												if (RR_I2[1:0]==0)
		-													state <= INC;
		+													state <= INC;
		-											else
		+											else
		-												state <= PUSH;
		+