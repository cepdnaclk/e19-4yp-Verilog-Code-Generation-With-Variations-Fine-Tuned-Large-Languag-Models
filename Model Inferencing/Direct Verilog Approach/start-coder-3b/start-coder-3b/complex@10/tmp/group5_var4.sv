```verilog
class FSM;
typedef enum logic [1:0] state_e;
FSM::FSM(FSM* next_ref = 1)
FSM::FSM(FSM* next_ref = 1)
{
  this.next = next_ref;
}
class FSM;
typedef enum logic [1:0] state_e;
FSM::FSM(FSM* next_ref = 1)
FSM::FSM(FSM* next_ref = 1)
{
  this.next = next_ref;
}
FSM::FSM()
parameter A = 0, B = 1;
FSM::FSM()
{
  $initial begin
    next = new();
    state = A;
  end
  always_comb begin
    case (state)
      A: if (W) begin
        Z = 0;
      end
      B: if (W) begin
        Z = 1;
      end
    endcase
  end
  always @(negedge reset or posedge clock) begin
    if (reset == 0) begin
      state <= A;
    end else begin
      state <= next.state;
    end
  end
  initial begin
    next = new(next);
  end
  always @(posedge next.w) begin
    W = next.w;
    state = next.state;
  end
  always @(posedge clock) begin
    if (clock) begin
      next = new(next);
    end
  end
  FSM::FSM(FSM* next_ref = 1)
  FSM::FSM(FSM* next_ref = 1)
  {
    this.next = next_ref;
  }
endclass
```
### Verilator Code:
```verilog
class FSM;
typedef enum logic [1:0] state_e;
FSM::FSM(FSM* next_ref = 1)
FSM::FSM(FSM* next_ref = 1)
{
  this.next = next_ref;
}
class FSM;
typedef enum logic [1:0] state_e;
FSM::FSM(FSM* next_ref = 1)
FSM::FSM(FSM* next_ref = 1)
{
  this.next = next_ref;
}
FSM::FSM()
parameter A = 0, B = 1;
FSM::FSM()
{
  $initial begin
    next = new();
    state = A;
  end
  always_comb begin
    case (state)
      A: if (W) begin
        Z = 0;
      end
      B: if (W) begin
        Z = 1;
      end
    endcase
  end
  always @(negedge reset or posedge clock) begin
    if (reset == 0) begin
      state <= A;
    end else begin
      state <= next.state;
    end
  end
  initial begin
    next = new(next);
  end
  always @(posedge next.w) begin
    W = next.w;
    state = next.state;