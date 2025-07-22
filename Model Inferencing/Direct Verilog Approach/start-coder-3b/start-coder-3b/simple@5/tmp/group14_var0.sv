```Verilog
module tst_alu1();
  reg [3:0]a,b; reg[1:0] f; reg cci; wire[3:0]d; wire co;
  alu_1 aa (d,co,a,b,f,cci);

  initial begin cci = 1'b0; f = 2'b00; a = 4'h0; b = 4'h0; #30 $stop; end // Initialize & stop

  always begin
    $display($time, " cci = %b, a= %h,b = %h,f = %b,d =%h,co= %b "
             , cci,a,b,f,d,co); // Use %h
  end

endmodule
```
### Expected Output:
```
  10000110010010000000000000000000
```
```
cci = 0, a= 0,b = 0,f = 00,d =0,co= 0
cci = 0, a= 0,b = 0,f = 00,d =0,co= 0
cci = 0, a= 0,b = 0,f = 00,d =0,co= 0 
```

# HW4: ALU
## Exercise 1:

### Base Verilog Code:
```Verilog
// alu_1.v
//
//  Test ALU1 
//
//  inputs:  a(3), b(3), f(2), cci
//  outputs: d(3), co(1), z(1)
//
//  ALU1 is a four-bit ALU with 3-bit inputs and 3-bit output.
//
//  It has 8 states:
//  State #0:  No change to ALU inputs:   (a,b,f) = (xxx,xxx,00)
//  State #1:  No change to ALU inputs, but no change to carry out.
//  State #2:  No change to ALU inputs, but carry out is 1.
//  State #3:  No change to ALU inputs, but carry out is 0.
//  State #4:  Addition addition (000): (a,b,f) = (xxx,xxx,00)
//  State #5:  Addition (100):  (a,b,f) = (00x,xxx,10)
//  State #6:  Addition (010):  (a,b,f) = (xxx,00x,10)
//  State #7:  Addition (110):  (a,b,f) = (00x,00x,10)
//  State #8:  No change to ALU inputs:   (a,b,f) = (xxx,xxx,01)
//  State #9:  Subtraction subtraction (001): (a,b,f) = (xxx,xxx,01)
//  State #10:  Subtraction (101):  (a,b,f) = (00x,xxx,11)
//  State #11:  Subtraction (011):  (a,b,f) = (xxx,00x,11)
//  State #12:  Subtraction (111):  (a,b,f) = (00x,00x,11)
//  State #13:  No change to ALU inputs:   (a,b,f) = (xxx,xxx,10)
//  State #14:  No change to ALU inputs:   (a,b,f) = (xxx,xxx,11)
//
//  Note:  f(2) should be 00 for all states except state #14
//
//  The ALU1 has 4-bit inputs and carry in, and 3-bit outputs and carry out
//

module alu_1(d, co, a, b, f, cci);
wire[3:0] d;
wire co;

parameter NUM_STATES = 15;
reg [NUM_STATES:0] state;
reg    z;

//  ALU1 has 16 states
always @ (c_cci) begin
   if (!c_cci) begin
     state <= 0;
   end else begin
     state < 1;
   end
 end

 always @ (c_cci) begin
   if (state == 0) begin
     d <= 4'hff;
     co <= 1'b0;
     z <= 1'b0;
   end else if (state == 1) begin
     d <= a;
     co <= cci;
     z <= 1'b0;
   end else if (state == 2) begin
     d <= a;
     co <= cci;
     z <= 1'b1;
   end else if (state == 3) begin
     d <= a;
     co <= cci;
     z <= 1'b0;
   end else if (state == 4) begin
     d <= a + b;
     co <= cci;
     z <= 1'b0;
   end else if (state == 5) begin
     d <= a;
     co <= cci;
     z <= 1'b1;
   end else if (state == 6) begin
     d <= b;
     co <= cci;
     z <= 1'b0;
   end else if (state == 7) begin
     d <= a + b;
     co <= cci;
     z <= 1'b0;
   end else if (state == 8) begin
     d <=  a;
     co <= cci;
     z <= 1'b1;
   end else if (state == 9) begin
     d <= a + b;
     co <= cci;
     z <= 1'b0;
   end else if (state == 10) begin
     d <= a;
     co <= cci;
     z <= 1'b1;
   end else if (state == 11) begin
     d <= b;
     co <= cci;
     z <= 1'b0;
   end else if (state == 12) begin
     d <= a + b;
     co <= cci;
     z <= 1'b0;
   end else if (state == 13) begin
     d <= 1'b0;
     co <= cci;
     z <= 1'b0;
   end else if (state == 14) begin
     d <= 3'h1;
     co <= cci;
     z <= 1'b1;
   end else begin
     $warning("ILLEGAL STATE");
   end
 end

 generate
    if (state < 4) begin : gen_3to5
      `ifdef ELAB_ASSERTIONS
        assert property @(posedge state) @ (posedge state[1]) @ (posedge state[2]) @ (posedge state[3]) begin
          $display("state=%d", state);
        end
      `endif
      if (state < 1) begin
        d <= 4'hff;
        co <= 1'b0;
        z <= 1'b0;
      end else if (state == 1) begin
        d <= a;
        co <= cci;
        z <= 1'b0;
      end else if (state == 2) begin
        d <= a;
        co <= cci;
        z <= 1'b1;
      end else if (state == 3) begin
        d <= a;
        co <= cci;
        z <= 1'b0;
      end else if (state == 4) begin
        d <= a;
        co <= cci;
        z <= 1'b1;
      end else begin
        $warning("ILLEGAL STATE");
      end
   end : gen_3to5

   if (state < 4) begin : gen_6to9
      `ifdef ELAB_ASSERTIONS
        assert property @(posedge state) @ (posedge state[1]) @ (posedge state[2]) begin
          $display("state=%d", state);
        end
      `endif
      if (state < 6) begin
        d <= 4'hff;
        co <= 1'b0;
        z <= 1'b0;
      end else if (state == 6) begin
        d <= a;
        co <= cci;
        z <= 1'b0;
      end else if (state == 7) begin
        d <= b;
        co <= cci;
        z <= 1'b0;
      end else if (state == 8) begin
        d <= a + b;
        co <= cci;
        z <=