// class mealy;
//   parameter unsigned W = 2;
//   localparam unsigned MASK = (1 << W) - 1;
//   typedef enum int { A = 0, B } state_t;
//   state_t state;
//   function state_t next_state(bit[W-1:0] w);
//     return state;
//   endfunction
// endclass
//
// module mealy(Clock, Resetn, w, z);
//   input Clock, Resetn, w;
//   output z;
//   mealy mealy_i(Clock, Resetn, w[1:0], z);
//   bit y, Y, z;
//
//   always @(posedge Clock or negedge Resetn)
//     if (!Resetn) mealy_i.state <= mealy::A;
//     else mealy_i.state <= mealy_i.next_state();
//
//   always @(mealy_i.state)
//     case (mealy_i.state)
//       mealy::A: y = w[1];
//       mealy::B: y = w[1];
//       default: y = 1'bx;
//     endcase
//
//   always @(posedge Clock or negedge Resetn)
//     if (!Resetn) begin z = 0; Y = mealy::A; end
//     else begin Y = mealy_i.next_state(w[1:0]); z = w[0]; end
//
//   always @(posedge Clock or negedge Resetn)
//     if (!Resetn) y <= mealy::A;
//     else y <= Y;
//
// endmodule