```systemverilog
class mealy_fsm;
  local reg [1:0] state;
  local reg [1:0] nextstate;
  
  function new(bit[1:0] state = 2'b00);
    this.state = state;
  endfunction
  
  function bit[1:0] calc_nextstate(bit[1:0] state, bit w);
    case (state)
      2'b00: if (w) return 2'b01; else return 2'b00;
      2'b01: if (w) return 2'b00; else return 2'b01;
      2'b10: if (w) return 2'b10; else return 2'b00;
      2'b11: if (w) return 2'b11; else return 2'b00;
    endcase
  endfunction
  
  function bit calc_output(bit[1:0] state, bit w);
    case (state)
      2'b00, 2'b10: return 1'b0;
      2'b01, 2'b11: return 1'b1;
    endcase
  endfunction
  
  task clock(bit w, ref bit z, ref bit[1:0] state);
    nextstate = calc_nextstate(state, w);
    state = nextstate;
    z = calc_output(state, w);
  endtask
endclass
```

Usage:
```systemverilog
mealy_fsm fsm = new();
bit w, z;
bit[1:0] state = 2'b00;
initial begin
  repeat (10) begin
    w = $random;
    fsm.clock(w, z, state);
    $display("input w = %b, state = %b, output z = %b", w, state, z);
  end
end
```

This code will create a Finite State Machine (FSM) that behaves as specified in the original task. The class `mealy_fsm` contains