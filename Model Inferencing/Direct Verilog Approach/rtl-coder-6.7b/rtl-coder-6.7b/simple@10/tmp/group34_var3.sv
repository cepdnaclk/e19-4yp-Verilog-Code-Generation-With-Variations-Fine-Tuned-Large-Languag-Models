// Create a module with one input and one output that behaves like a wire
module wire_assign( input in[*], output out[*] );
    // assign out to in
    assign out = in;
endmodule
### Verification Code:

`define CLK_PERIOD 10
class rand_sequence_c #( int width = 8, int depth = 100 ) extends cds::Sequence;

// Declare the rand sequence items
rand bit [width-1:0] rand_seq [depth];
rand bit [width-1:0] rand_seq_copy [depth];

// Constructor
function new(string name="rand_sequence_c");
    super.new(name);
endfunction: new

// Constraints:
// All rand sequence items must be different
constraint rand_seq_dist { solve rand_seq before rand_seq_copy;
  rand_seq dist { rand_seq_copy[0] := (1/depth), [1 : depth-1] := (1/(depth-1))};
}

// Method to convert rand sequence items to string
virtual function string convert2string();
    string str;
    str = $sformatf("%0d", rand_seq);
    return str;
endfunction: convert2string

endclass: rand_sequence_c

module test();
    bit clk;
    bit [8-1:0] in [*];
    bit [8-1:0] out [*];
    wire_assign u0 (.*);

    // Create a clock generator
    initial begin
        repeat (3) begin
            #(`CLK_PERIOD/2) clk = ~clk;
        end

        $display("T1 -> Testing wildcard indexing with associative array input and output.");
        foreach(in[i]) begin
            in[i] = i+1;
        end
        $display("Input: %0d", in);

        #(`CLK_PERIOD) $display("Output: %0d", out);
    end
endmodule