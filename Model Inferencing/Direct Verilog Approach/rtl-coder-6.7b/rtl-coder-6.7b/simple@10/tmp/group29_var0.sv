module SchedDelayA;
reg a, b;
class test_obj;
rand bit[3:0] rand_a;
rand bit[3:0] rand_b;
function void print();
$display("rand_a: %d, rand_b: %d", rand_a, rand_b);
endfunction
endclass
endmodule