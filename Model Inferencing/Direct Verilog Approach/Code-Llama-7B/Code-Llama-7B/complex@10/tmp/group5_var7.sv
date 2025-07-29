class FSM;
  parameter A = 0, B = 1;
  rand bit [1:0] y;
  bit w;
  function new();
      y = A;
  endfunction

  task next();
    if (y == A)
      begin
        if (w)
          y = B;
      end
    else if (y == B)
      if (w)
        y = B;
      else
        y = A;
  endtask
endclass


module mealy(Clock, Resetn, w, z);

  input Clock, Resetn, w;
  output z;
  FSM fsm;

  always @(negedge Resetn or posedge Clock)
    if (Resetn == 0)
      begin
        fsm = new;
        z = 0;
      end
    else
      begin
        fsm.next;
        z = fsm.y & w;
      end
endmodule