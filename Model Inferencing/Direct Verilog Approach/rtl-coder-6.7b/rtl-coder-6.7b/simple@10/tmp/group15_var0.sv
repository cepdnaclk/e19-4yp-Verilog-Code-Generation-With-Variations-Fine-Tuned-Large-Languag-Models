module sw2led2 (
input wire [7:0] sw,
output wire [7:0] ld
) ;
assign ld = sw;
endmodule


module tb_sw2led2 ;
logic [7:0] sw ;
logic [7:0] ld ;
// instantiate the Device Under Test (DUT)
sw2led2 u0 (.sw(sw),.ld(ld) ) ;
initial
begin
// initialize all inputs to 0
sw = 0 ;
#10 ; // wait for some time

// Testcase 1
sw = 8'hab ;
#10 ; // wait for some time

// Testcase 2
sw = 8'hff ;
#10 ; // wait for some time

// Testcase 3
sw = 8'h24 ;
#10 ; // wait for some time

// Testcase 4
sw = 8'h55 ;
#10 ; // wait for some time

// Testcase 5
sw = 8'h00 ;
#10 ; // wait for some time

// Testcase 6
sw = 8'h50 ;
#10 ; // wait for some time

// Testcase 7
sw = 8'h15 ;
#10 ; // wait for some time

// Testcase 8
sw = 8'h70 ;
#10 ; // wait for some time

// Testcase 9
sw = 8'h27 ;
#10 ; // wait for some time

// Testcase 10
sw = 8'h4e ;
#10 ; // wait for some time

#1000;
$finish ;
end
endmodule