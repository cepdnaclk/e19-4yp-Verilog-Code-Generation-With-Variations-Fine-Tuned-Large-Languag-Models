module tstdlatch; //test-bench
const integer max_state = 5;
reg d,en;
wire q,qb;
// dlatch ff(en,d,q,qb); // Assuming instantiation of a D latch module
// Pack a range of states
integer state = 0;
pack {integer,max_state} pack_var;

always #4 begin // Enable toggles every 4 time units
state = state+1;
state = state%max_state;
en = pack_var[state]; // inside check of state
end
always #8 begin // Data toggles every 8 time units
d=~d;
end
initial $monitor($time," en = %b, d = %b, q = %b, qb = %b ", en,d,q,qb);
initial #40 $stop;
endmodule
_name = "test_14";

const string testconst string test_name = "test_13";

const string_15";
 test_name = "test_12";

const string test_name = "test