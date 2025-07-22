program Clock_Prog (
  input wire clk,
  input wire rst_n
);

typedef enum bit {
  IDLE = 1'b0
} states_type;


states_type state, next_state;

always_ff @(posedge clk, negedge rst_n)
  if(!rst_n)
    state = IDLE;
  else
    state = next_state;

always_comb
  case(state)
    IDLE: //default
      next_state = IDLE;
  endcase
endprogram