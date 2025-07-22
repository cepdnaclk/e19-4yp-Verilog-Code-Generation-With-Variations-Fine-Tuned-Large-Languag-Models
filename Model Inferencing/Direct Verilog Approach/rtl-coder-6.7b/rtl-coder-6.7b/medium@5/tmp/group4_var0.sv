module jk(in0,in1,in2,out,clock,reset);
  parameter PW=2;
  parameter PW1=2;
  output out;
  output[PW1-1:0] out1;
  input reset;
  wire clock;
  reg[PW1-1:0] out1r;
  assign out = out1r[PW1-1:1];
  assign out1 = out1r[PW1-1:0];
  or (out1r,in0,in1);
  //1st j
  wire in1_r;
  wire in0_o;
  wire in1_o;
  wire in2_o;
  wire in2_r;
  wire in3_r;
  wire in3_o;
  wire in1_r1;
  or (in0_o,reset,clock);
  or (in1_r1,in0_o,in1);
  not (in2_o,in1);
  and (in2_r,in2_o,in2);
  and (in3_o,in2_r,in3);
  nor3NMOS (in3_r,in3_o,in1_r1,in2_r);
  //2nd j
  wire in2_r1;
  wire in1_r2;
  wire in2_r2;
  wire in3_r2;
  nor3NMOS (in2_r1,in2_r,in2,in3_r2);
  nor3NMOS (in1_r2,in1_r1,in0,in2_r2);
  nor3NMOS (out1r,in1_r2,in0_o,in1_r2);
  and (in3_r2,out1r,in3_r2);

endmodule

### Design Simulation:
![Img](https://github.com/SangwooKim1/Verilog_Learning/blob/main/C_code_verilog_simulation_image/jk.png)

### Test Bench Code:

module bench_jk;

reg clock;
wire in0_o;
wire in0_w;
wire in1_o;
wire in1_r;
wire in2_o;
wire in2_r;
wire in3_o;
wire in3_r;
wire out;
wire out_r;
wire out1;
wire out1_r;
wire out1r;
wire reset;
initial begin
  clock = 0;
  in0_w = 0;
  reset = 0;
  #10 reset = 1;
  #10 reset = 0;
end
always #5 clock = ~clock;
always #5 in0_w = ~in0_w;
assign in0_o = in0_w;
initial begin
  #20 $dumpfile("jk.vcd");
  #20 $dumpvars(0,bench_jk);
  in0_w = 0;
  in1_w = 0;
  in2_w = 0;
  in3_w = 0;
  reset = 0;
  #10 reset = 1;
  #10 reset = 0;
  #100 in0_w = 1;
  #100 in1_w = 1;
  #100 in2_w = 1;
  #100 in3_w = 1;
  #100 reset = 1;
  #100 reset = 0;
  #100 in0_w = ~in0_w;
  #100 in1_w = ~in1_w;
  #100 in2_w = ~in2_w;
  #100 in3_w = ~in3_w;
end

or (in0_o,reset,clock);
or (in1_r,in0_o,in1_o);
not (in2_o,in1_o);
and (in2_r,in2_o,in2_o);
and (in3_o,in2_r,in3_o);
nor3NMOS (in3_r,in3_o,in1_r,in2_r);

or (in2_r1,in2_r,in2_o,in3_r);
or (in1_r2,in1_r,in0_o,in2_r);
nor3NMOS (out_r,in1_r,in0_o,in1_r1);

nor3NMOS (in3_r2,out_r,in3_r,in1_r1);
nor3NMOS (out1_r,in1_r2,in0_o,in2_r1);
nor3NMOS (out1r,in1_r2,in0_o,in1_w);
and (in3_r2,out1r,in3_r2);

assign out = in2_r1;
assign out1 = out1r[PW-1:0];
assign out1_r = out1r;

initial begin
  $dumpreset;
  $dumpvars(0,bench_jk);
end

always @(posedge clock) begin
  $dumpvar(0,clock);
  $dumpvar(0,reset);
  $dumpvar(0,in0_o);
  $dumpvar(0,in1_r);
  $dumpvar(0,in2_o);
  $dumpvar(0,in2_r);
  $dumpvar(0,in3_o);
  $dumpvar(0,in3_r);
  $dumpvar(0,out);
  $dumpvar(0,out_r);
  $dumpvar(0,out1);
  $dumpvar(0,out1_r);
  $dumpvar(0,out1r);
end

endmodule

### Simulation Result:
![Img](https://github.com/SangwooKim1/Verilog_Learning/blob/main/C_code_verilog_simulation_image/jk_simulation.png)
/C_Code_Verilog_Simulation_Image/counter_test_bench.md
## Verilog Code

```verilog

```

## Test Bench Code

```verilog

```

## Simulation Result

![Img](https://github.com/SangwooKim1/Verilog_Learning/blob/main/C_code_verilog_simulation_image/counter_simulation.png)
/C_Code_Verilog_Simulation_Image/logic_test_bench.md
## Verilog Code

```verilog

```

## Test Bench Code

```verilog

```

## Simulation Result

![Img](https://github.com/SangwooKim1/Verilog_Learning/blob/main/C_code_verilog_simulation_image/logic_simulation.png)
/C_Code_Verilog_Simulation_Image/counter.md
## Verilog Code

```verilog
module counter (input [1:0] control, d, q, q_next);
  parameter PW=2;
  output [PW-1:0] q;
  input [1:0] control;
  input d;
  input [PW-1:0] q_next;
  wire [PW-1:0] q_n;
  always @* begin
    case (control)
      2'b00: begin
         q_n = d;
       end
      2'b01: begin
         q_n = ~q;
       end
      2'b10: begin
         q_n = q_next;
       end
      2'b11: begin
         q_n = q;
       end
    endcase
  end
  assign q = q_n;
endmodule

```

## Test Bench Code

```verilog

```

## Simulation Result

![Img](https://github.com/SangwooKim1/Verilog_Learning/blob/main/C_code_verilog_simulation_image/counter_simulation.png)
/C_Code_Verilog_Simulation_Image/mux2.md
## Verilog Code

```verilog
module mux2(a, b, sel, output);
  parameter PW=2;
  input [PW-1:0] a, b;
  input sel;
  output [PW-1:0] output;
  assign output = (sel==0)? a : b;
endmodule
```

## Test Bench Code

```verilog
module bench_mux2;

  parameter PW=2;
  input [PW-1:0] a, b, sel;
  output [PW-1:0] output;
  wire [PW-1:0