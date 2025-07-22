class SchedDelayA;
static reg a, b;
function new();
a = 0;
b = 1;
endfunction
function void foo(bit x);
x = 1;
a = x;
endfunction
function void bar(output bit y);
y = a;
endfunction
endclass
initial
begin
SchedDelayA sda;
sda.foo(sda.b);
sda.bar(sda.a);
end
### Output
### Error: