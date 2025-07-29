```
// FSM state enum class
class States;
  enum {A, B} state;
  function States new();
    state = A;
  endfunction
  function void update(bit[0:2] w);
    case (state)
      A: state = w[0]? B : A;
      B: state = w[1]? A : B;
    endcase
  endfunction
endclass
// Wrapper task
task wrapper;
  input Clock, Resetn;
  input [1:0] w;
  output z;
  States s = new();
  always @*
    case (s.state)
      States::A: if (w[0])
        begin
          z = 0;
          s.update({1'b0, w[0]});
        end
      else
        begin
          z = 0;
          s.update({1'b1, w[0]});
        end
      States::B: if (w[1])
        begin
          z = 1;
          s.update({1'b0, w[1]});
        end
      else
        begin
          z = 0;
          s.update({1'b1, w[1]});
        end
    endcase
  fork
    forever @(posedge Clock) begin : update
      if (Resetn == 0)
        s.state = States::A;
    end
  join_none
endtask
```
### Testbench Code:
```
`include "mealy.sv"
`include "mealy_wrapper.sv"

module tb;
  parameter ClockPeriod = 10ns;
  bit Clock, Resetn;
  bit [1:0] w;
  bit z, z_expected;
  always Clock = #(ClockPeriod / 2) ~Clock;
  initial begin
    Clock = 0;
    fork
      begin : init
        Resetn = 0;
        w = 0;
        #10 Resetn = 1;
      end
      forever @(posedge Clock) begin : update
        w = $random;
        #10