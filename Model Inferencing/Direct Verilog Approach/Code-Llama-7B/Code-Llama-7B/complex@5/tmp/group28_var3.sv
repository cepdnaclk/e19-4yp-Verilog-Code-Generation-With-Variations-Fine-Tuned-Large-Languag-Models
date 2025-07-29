module dlatch (en,d,q,qb); // Assuming instantiation of a D latch module
parameter WIDTH=1;
// wire [WIDTH-1:0] state, temp_state;
//wire [WIDTH-1:0] temp_state;
wire [WIDTH-1:0] temp_state=[WIDTH-1:0]'[0:0];
reg [WIDTH-1:0] state, temp_state;
reg en;
reg d;
reg q;
reg qb; // Dual D-flip-flop Latch
// Parameterized register with WIDTH width
reg [WIDTH-1:0] P0; // 1st parameter
reg [WIDTH-1:0] P1; // 2nd parameter
parameter [WIDTH-1:0] P0_P1_RANGE=[WIDTH-1:0]'[P0:P1];
// initial state = P0
initial
begin
  state = P0;
  q = 1'b0;
  qb = 1'b1;
  temp_state = P0;
end
// State register
always @(posedge en, posedge d)
begin
  case (state)
    0: if (d == 1)
        temp_state = 1'b1;
      else
        temp_state = P0;
    1: if (d == 0)
        temp_state = 1'b0;
      else
        temp_state = P1;
    inside(P0_P1_RANGE):
        temp_state = d;
  endcase
  if (en == 1'b1)
    state <= temp_state;
end
always @(state)
begin
  q <= 1'b0;
  qb <= 1'b1;
  case (state)
    0: begin
      q <= 1'b0;
      qb <= 1'b1;
    end
    1: begin
      q <= 1'b1