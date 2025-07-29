module wire_assign( input bit in, output out );
    // assign out to in
    assign out = in;
endmodule
*/
module wire_assign
import sys_verilog_lib::bit_t;
#(
    parameter type input_t = logic,
    parameter type output_t = bit_t // default to SystemVerilog bit_t if none specified
)
(
    input input_t in,
    output output_t out
);
// assign out to in
assign out = in;
endmodule

//------------------------------------------------------------------------------
// Method process: assign_in_out_1 (test_basic_types.cpp:65:5) 

always_comb 
begin : assign_in_out_1     // test_basic_types.cpp:65:5
    logic TMP_0;
    TMP_0 = in;
    out = TMP_0;
end

//------------------------------------------------------------------------------
// Method process: assign_in_out_2 (test_basic_types.cpp:72:5) 

always_comb 
begin : assign_in_out_2     // test_basic_types.cpp:72:5
    logic TMP_0;
    out = in;
    out = in;
    assign TMP_0 = out;
    out = TMP_0;
end

//------------------------------------------------------------------------------
// Method process: assign_in_out_3 (test_basic_types.cpp:80:5) 

always_comb 
begin : assign_in_out_3     // test_basic_types.cpp:80:5
    logic TMP_0;
    TMP_0 = in;
    out = in;
    out = in;
    assign out = TMP_0;
end

//------------------------------------------------------------------------------
// Method process: assign_in_out_4 (test_basic_types.cpp:88:5) 

always_comb 
begin : assign_in_out_4     // test_basic_types.cpp:88:5
    logic TMP_0;
    TMP_0 = in;