```SystemVerilog
module par(in, out);
input [7:0] in;
output [6:0] out;

// Struct Definition
typedef struct packed {
    logic [1:0] evenparity;
    logic [1:0] oddparity;
    logic [1:0] evenones;
    logic [1:0] oddones;
} out_s;

// Function to Calculate Parity & Ones
out_s calc(input [7:0] in);
    out_s temp;
    temp.evenparity = ~^in[7:6];
    temp.oddparity = ~^in[5:4];
    temp.evenones = ~&in[7:6];
    temp.oddones = ~&in[5:4];
    return temp;
endfunction

out_s result;
assign result = calc(in);

// Output Assignment
assign out = result.evenparity; // Replace "out" accordingly as needed
```
This code creates a new type called `out_s` which is a struct with logic fields `evenparity`, `oddparity`, `evenones`, `oddones`. The calculate function then calculates the parity and ones for the given inputs. This result is then assigned to the output.

Please note that the original problem does not seem to have any logic fields to assign. I have substituted `evenparity` with `out` as an example of how to use the struct fields. You may need to replace `out` with the correct field of the struct `result` based on your requirement. 

`out_s` is packed because it uses only 1 bit to store each field, making the struct as compact as possible. This is done to minimize the number of logic gates used in the design. However, you can replace `out_s` with `out_u` for an unpacked struct if you want to use more than 1 bit per logic field. In this case, the unpacked struct would have more logic gates but would take up more space in the design.### 

Please also note that the logic field names are not conventional. In the original problem, parity and all_ones were named to be clear. In this modified code,