module SchedDelayA;
interface class A;
  int getA();
endclass
class B`"b:"b`;
  A arr[int];
  function A get(int idx);
  `uvm_warning("Warn", "get")
  arr[idx] = new;
  return arr[idx];
  endfunction
endclass
function A fun(A a);
`uvm_warning("Warn", "fun")
return new;
endfunction
module SchedDelayB;
reg A a, b;
initial begin
a = fun(b);
`uvm_warning("Warn", "get")
b = fun(a);
end
always @(b) a->getA() = b;
always @(a) b->getA(a->getA()) = a;
endmodule

//----------------------------------------------------------------------
//
// SchedDelayA_B
//
// The base verilog code is modified by adding an initial block
//
module SchedDelayA_B;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule

//----------------------------------------------------------------------
//
// SchedDelayB_B
//
// The base verilog code is modified by adding an initial block
//
module SchedDelayB_B;
reg a, b;
initial begin
a = fun(b);
end
always @(b) a->getA() = b;
always @(a) b->getA(a->getA()) = a;
endmodule

//----------------------------------------------------------------------
//
// SchedDelayA_C
//
// The base verilog code is modified by adding an initial block
//
module SchedDelayA_C;
reg a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule

//----------------------------------------------------------------------
//
// SchedDelayB_C
//
// The base verilog code is modified by adding an initial block
//
module SchedDelayB_C;
reg a, b;
initial begin
a = fun(b