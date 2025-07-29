module SchedDelayB;
class C;
int a;
function new(a);
  this.a = a;
endfunction
endclass

reg [31:0] a;
int a_var [3] = '{1,2,3};
C a_class [3] = new [3] (3);
initial
begin
end
always @(b) a = b;
always @(b_class) a = b_class.a;
always @(b_class) a = b_class.a;
always