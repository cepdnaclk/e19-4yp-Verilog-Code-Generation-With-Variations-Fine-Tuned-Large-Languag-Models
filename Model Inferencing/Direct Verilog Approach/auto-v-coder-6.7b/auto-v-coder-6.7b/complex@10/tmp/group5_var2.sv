```verilog
class mealy ;
  reg [1:0] y;
  reg z;
  bit w;
  
  function new (input bit w);
    this.w = w;
  endfunction : new
  
  function bit [1:0] next_state(input bit w); //next_state function to return next state
    bit [1:0] next_state;
    case (y)
      A: if (w) begin //when y is A and w is 1
          next_state = B;
          z = 0;
        end else begin //when y is A and w is 0
          next_state = A;
          z = 0;
        end
      B: if (w) begin //when y is B and w is 1
          next_state = B;
          z = 1;
        end else begin //when y is B and w is 0
          next_state = A;
          z = 0;
        end
    endcase
    return next_state;
  endfunction : next_state
  
endclass : mealy

module top;
  bit Clock, Resetn, w;
  logic z;
  mealy m;
  
  initial begin
    m = new(0);
    //Resetn = 0; //Initial Reset, State A
    //#10;
    //Resetn = 1; //Deassert Reset
    //#10;
    //Clock = 1;
    //#10;
    //Clock = 0;
    //#10;
    //Clock = 1;
    //#10;
    //Clock = 0;
    //#10;
    //w = 1;
    //#10;
    //Clock = 1;
    //#10;
    //Clock = 0;
    //#10;
    //w = 0;
    //#10;
    //Clock = 1;
    //#10;
    //Clock = 0;
    //#10;
  end
  
  always begin
    #5 Clock = ~Clock; //T