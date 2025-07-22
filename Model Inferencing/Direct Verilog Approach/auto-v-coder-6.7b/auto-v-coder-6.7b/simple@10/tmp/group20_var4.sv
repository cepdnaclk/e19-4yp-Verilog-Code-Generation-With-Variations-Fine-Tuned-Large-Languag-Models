```verilog
module latch (input d, c, output reg [7:0] q, q_b );

typedef bit [7:0] byte_t;

typedef union packed {
    bit [7:0] byte_t;
    struct packed {
        bit [3:0] byte1;
        bit [3:0] byte2;
    } split_byte;
} split_byte_t;

split_byte_t q_u;

always begin
    wait ( c );
    q_u.byte_t = d;
    q = q_u.byte_t;
    q_b = d;
end

endmodule
```
This code modifies the initial output to an 8-bit bus and also uses a union to create a struct with separate byte outputs. The union is then used to assign the output byte and split bytes. 

Please note that the struct is split into 4-bit bytes due to the limitation of simulation tools for packed unions. If you wish to use a larger bit width, you will need to adjust the struct accordingly.