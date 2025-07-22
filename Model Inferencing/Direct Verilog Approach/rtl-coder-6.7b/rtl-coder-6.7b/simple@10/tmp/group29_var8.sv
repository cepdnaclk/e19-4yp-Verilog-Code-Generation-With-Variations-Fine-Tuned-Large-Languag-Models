#module SchedDelayA;
class B extends A;
bit a, b;
initial
begin
end
always @(b) a = b;
always @(a) b <= a;
endmodule
### Test:
class A extends B {
var B[int] array;
function void new(B b);
array[b.name()] = b;
endfunction
function string name();
return "A";
endfunction
virtual function int getA();
return 0;
endfunction
endclass
class B extends A {
var A a;
function void new(A a);
super.new(a);
this.a = a;
endfunction
virtual function int getB();
return this.a.getA();
endfunction
virtual function string name();
return "B";
endfunction
endclass
class C extends B {
var B b;
function void new(B b);
super.new(b);
this.b = b;
endfunction
virtual function int getC();
return this.b.getB();
endfunction
virtual function string name();
return "C";
endfunction
endclass
class D extends C {
var C c;
function void new(C c);
super.new(c);
this.c = c;
endfunction
virtual function int getD();
return this.c.getC();
endfunction
virtual function string name();
return "D";
endfunction
endclass
class H extends D {
var D d;
function void new(D d);
super.new(d);
this.d = d;
endfunction
virtual function int getH();
return this.d.getD();
endfunction
virtual function string name();
return "H";
endfunction
endclass
program test;
B b = new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new(new