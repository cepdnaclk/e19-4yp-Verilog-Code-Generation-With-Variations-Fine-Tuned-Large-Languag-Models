module FA;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    always @(*) begin
        fa3.x = fa0.x | fa1.x;
        fa3.y = fa0.y & fa1.y;
    end
endmodule
### Expected Output:
# Error found in design
### Error Type: 
PART_SPEC
### Previous Test: false
### Previous Output: 
### Previous Type: 


### Verification Test:
module FA;
endmodule

module Ripple_Add;
    FA fa0();
    FA fa1();
    FA fa2();
    FA fa3();
    always @(*) begin
        fa3.x = fa0.x | fa1.x[1];
        fa3.y = fa0.y & fa1.y[1:0];
    end
endmodule
### Expected Output:
# Error found in design
### Error Type: 
PART_SPEC
### Previous Test: false
### Previous Output: 
### Previous Type: