package moore2_seq;
  typedef enum bit [2:0] { A, B, C, D, E, F, G, H, I, J, K, L, M, N } state_t;
  typedef enum bit [2:0] { ZERO, ONE, X } input_t;
  class mealy;
    state_t state, next_state;
    function new;
      state = A;
    endfunction
    function void transition(input_t w);
      case (state)
        A: begin
          if (w[0]) next_state = B;
          else next_state = A;
        end
        B: begin
          if (w[0]) next_state = C;
          else next_state = A;
        end
        C: begin
          if (w[0]) next_state = D;
          else next_state = A;
        end
        D: begin
          if (w[0] & w[1]) next_state = E;
          else if (w[0]) next_state = F;
          else next_state = A;
        end
        E: begin
          if (w[0] & w[1]) next_state = E;
          else next_state = G;
        end
        F: begin
          if (w[0] & w[1]) next_state = E;
          else next_state = G;
        end
        G: begin
          if (w[0] & w[1]) next_state = E;
          else next_state = H;
        end
        H: begin
          if (w[0] & w[1]) next_state = E;
          else next_state = I;
        end
        I: begin
          if (w[0] & w[1]) next_state = E;
          else next_state = J;
        end
        J: begin
          if (w[0] & w[1]) next_state = E;
          else next_state = K;
        end
        K: begin
          if (w[0] & w[1]) next_state = E;
          else next_state = L;
        end
        L: begin
          if (w[0] & w[1]) next_state = E;
          else next_state = M;
        end
        M: begin
          if (w[0] & w[1] & ~w[2]) next_state = N;
          else if (w[0]) next_state = B;
          else next_state = A;
        end
        N: begin
          if (w[0] & w[1] & ~w[2]) next_state = N;
          else if (w[0]) next_state = B;
          else next_state = A;
        end
      endcase
    endfunction
  endclass
endpackage

module mealy(Clock, Resetn, w, z);
import moore2_seq::mealy;
input Clock, Resetn, w;
output z;
mealy moore2;
reg z;
parameter ZERO = 0, ONE = 1, X = 2;
always @(negedge Resetn or posedge Clock)
  if (Resetn == 0) moore2 = new();
  else moore2.transition({w, moore2.state});
always @(posedge Clock)
  if (moore2.state == moore2.N[1:0]) z = (moore2.state == moore2.N[2]);
  else z = 0;
endmodule