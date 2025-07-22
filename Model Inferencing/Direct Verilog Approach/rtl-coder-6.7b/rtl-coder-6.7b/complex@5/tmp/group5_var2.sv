class FSM;
  parameter A, B;
  localparam  INPUT_WIDTH = 1;

  typedef logic [INPUT_WIDTH-1:0] intf_t;

  intf_t w;

  typedef enum int {
    A, B
  } state_t;

  localparam  STATE_WIDTH = $clog2(state_t'high) + 1;

  logic [STATE_WIDTH-1:0] state;
  logic [STATE_WIDTH-1:0] next_state;

  localparam  NUM_TRANSITIONS = 2;
  intf_t      transition_set [NUM_TRANSITIONS][NUM_TRANSITIONS];

  function new ();
    transition_set[0] = {1'b0, 1'b1};
    transition_set[1] = {1'b0, 1'b1};
  endfunction

  function void set_input (intf_t w);
    for (int i = 0; i < INPUT_WIDTH; i++) begin
      if (w[INPUT_WIDTH-1:0]!= intf_t'('x)) begin
        this.w = w;
      end
    end
  endfunction

  function logic set_next_state (state_t state);
    next_state = state;
  endfunction

  function void update_state ();
    state = next_state;
    for (int i = 0; i < NUM_TRANSITIONS; i++) begin
      if (transition_set[state][w]) begin
        set_next_state(i);
      end
    end
  endfunction

endclass

class FSM_driver;

  mailbox #(FSM_sequence_item) mbx;

  function new ();
    mbx = new ();
  endfunction
endclass

program test (
  input Clock, Resetn, w,
  output z
);

  FSM fsm_inst ();
  FSM_driver fsm_driver_inst ();

  initial begin
    logic [$clog2(FSM::NUM_TRANSITIONS)-1:0] next_state;
    fsm_inst.set_input({w});
    fsm_inst.update_state();
    next_state = fsm_inst.state;
    z = next_state;
  end
endprogram

interface intf ();
  parameter A, B;

  typedef logic [2:0] intf_t;

  intf_t w;

  typedef enum int {
    A, B
  } state_t;

  localparam  STATE_WIDTH = $clog2(state_t'high) + 1;

  logic [STATE_WIDTH-1:0] state;
  logic [STATE_WIDTH-1:0] next_state;

  localparam  NUM_TRANSITIONS = 2;

  intf_t       transition_set [NUM_TRANSITIONS][NUM_TRANSITIONS];

  initial begin
    transition_set[0] = {1'b0, 1'b1};
    transition_set[1] = {1'b0, 1'b1};
  end

  function void set_input (intf_t w);
    for (int i = 0; i < $bits(intf_t); i++) begin
      if (w[$bits(intf_t)-1:0]!= intf_t'('x)) begin
        this.w = w;
      end
    end
  endfunction

  function logic set_next_state (state_t state);
    next_state = state;
  endfunction

  function void update_state ();
    state = next_state;
    for (int i = 0; i < NUM_TRANSITIONS; i++) begin
      if (transition_set[state][w]) begin
        set_next_state(i);
      end
    end
  endfunction
endinterface

module top (
  input Clock, Resetn, w,
  output z
);
  parameter A = 0, B = 1;

  intf intf_inst();

  always_ff @(posedge Clock) begin
    intf_inst.set_input({w});
    intf_inst.update_state();
    z <= intf_inst.next_state;
  end
endmodule