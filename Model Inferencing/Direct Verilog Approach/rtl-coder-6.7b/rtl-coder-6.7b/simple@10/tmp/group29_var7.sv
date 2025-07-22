module SchedDelayA;
reg a, b;
initial
begin
end
class c;
function bit operator [](input bit x);
return x;
endfunction
function void operator [](input bit x, input bit y);
b <= x;
endfunction
endclass
c C;
always @(b) a = C[b];
always @(a) C[a] = b;
endmodule