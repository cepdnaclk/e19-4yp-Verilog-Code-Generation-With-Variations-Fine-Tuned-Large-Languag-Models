```
## 4.2.1
module FA;
    parameter type_width    = 4,
    parameter input_width  = type_width + 5,
    parameter output_width = type_width * 2
    ; 
    wire [input_width-1:0] in, out;
    wire [output_width-1:0] sout;
    input  [type_width-1:0] i;
    parameter  [type_width-1:0] i_sum, i_carry;
    output  [type_width-1:0] o, s;
    # 3 #
    always @* begin
        # 3 #
        case (i)
            i_sum: o = i ^ s;
            i_carry: o = ~i & s;
        endcase
    end
# 3 #
endmodule

## 4.2.2
module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
endmodule

## 4.3.1
module FA;
    parameter type_width    = 4,
    parameter input_width  = type_width + 5,