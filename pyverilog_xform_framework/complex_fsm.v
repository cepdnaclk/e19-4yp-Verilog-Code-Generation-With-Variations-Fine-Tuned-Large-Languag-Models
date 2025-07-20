module complex_fsm (
  input        clk,
  input        rst,
  input  [7:0] data_in,
  output [7:0] data_out
);
  typedef enum {IDLE, LOAD, PROCESS, DONE} state_t;
  state_t state, next_state;
  reg [7:0] mem [0:7];
  reg [2:0] ptr;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      state <= IDLE;
      ptr <= 3'b000;
    end else begin
      state <= next_state;
      if (state == LOAD) mem[ptr] <= data_in;
      if (state == PROCESS) ptr <= ptr + 1;
    end
  end
  always @(*) begin
    case (state)
      IDLE: next_state = (data_in[0]) ? LOAD : IDLE;
      LOAD: next_state = PROCESS;
      PROCESS: next_state = (ptr == 7) ? DONE : PROCESS;
      DONE: next_state = IDLE;
      default: next_state = IDLE;
    endcase
  end
  assign data_out = mem[ptr];
endmodule