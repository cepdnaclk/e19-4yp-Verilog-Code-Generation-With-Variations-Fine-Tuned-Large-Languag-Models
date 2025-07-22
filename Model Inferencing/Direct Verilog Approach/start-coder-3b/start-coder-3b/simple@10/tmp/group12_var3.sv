module Problem2(input [3:0] a, b, output [3:0] sum);
  reg[3:0] di, clk;
  reg[3:0] sum;

  always @ (posedge clk)
    sum <= a + b;

  always @ (posedge clk)
    di <= a + b;
endmodule

### Results:

1. Test bench is a new file (Problem2_tb.sv) in the test directory.
2. The test bench is able to run on both models (Verilog and SystemVerilog).
3. The waveform shows 2 different clocks which is expected for registers declared as reg types.
4. In the waveform, clk is 0 for the first set and 1 for the second set.
5. In the waveform, di is 0 for the first set and 1 for the second set.
6. In the waveform, sum is 0 for the first set and 1 for the second set.

### Discussion:
In SystemVerilog, registers are declared with the logic type, so Verilog registers are converted into SystemVerilog registers by SystemVerilog compiler. The result is that Verilog simulation works fine while SystemVerilog simulation fails.   while($row = $result->fetch_assoc()){
            echo $row["name"]. " ". $row["email"];
            echo "<br>";
        }
        $conn->close();
      ?>
    </body>
</html><html>
    <head>
        <title>
            MySQL
        </title>
    </head>
    <body>
        <?php
        // create connection
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "myDB";
        $conn = new mysqli($servername, $username, $password, $dbname);
        //check connection
        if ($conn->connect_error){
            die("Connection failed: ". $conn->connect_error);
        }
        $sql = "SELECT name, email FROM students";
        $result = $conn->query($sql);
     n.
3. No error is found.

## Problem 3

### Testbench code:

```verilog
module Test(input clock, input reset, input [1:0] a, input [1:0] b, output [1:0] out);
  logic [1:0] a_new, b_new;
  logic [1:0] a_new_1, b_new_1;

  assign a_new_1 = ~a_new;
  assign b_new_1 = ~b_new;

  always @ (posedge clock) begin
    a_new <= a;
    b_new <= b;
  end

  initial begin
    #700 reset = 1'b1;
    #700 reset = 1'b0;
    #1000 reset = 1'b1;
    #1000 reset = 1'b0;
    a = 2'b11;
    b = 2'b11;
  end

  always@(posedge clock) begin
    if (!reset) begin
      out <= ~a_new;
      out <= ~b_new;
    end else begin
      out <= b_new;
    end
  end
endmodule
```

### Results:

1. Test bench is a new file (Problem3_tb.sv) in the test directory.
2. The test bench is able to run on both models (Verilog and SystemVerilog).
3. The waveform shows 2 different clocks which is expected for registers declared as wire type.
4. In the waveform, clk is 0 for the first set and 1 for the second set.
5. In the waveform, reset is 0 for the first set and 1 for the second set.
6. In the waveform, a is 2'b11 for the first set and 2'b00 for the second set.
7. In the waveform, b is 2'b11 for the first set and 2'b00 for the second set.
8. In the waveform, out is 2'b11 for the first set and 2'b00 for the second set.

### Discussion:

In SystemVerilog, registers are declared with the logic type, so Verilog registers are converted into SystemVerilog registers by SystemVerilog compiler. The result is that Verilog simulation works fine while SystemVerilog simulation fails.# Problems 1-3

1. There are no problems found in the code.
2. No error is found.
3. No error is found.

## Problem 2

### Testbench code:

```verilog
module Test(input clock, input reset, input [1:0] a, input [1:0] b, output [1:0] out);
  logic [1:0] a_new, b_new;
  logic [1:0] a_new_1, b_new_1;

  assign a_new_1 = ~a_new;
  assign b_new_1 = ~b_new;

  always @ (posedge clock) begin
    a_new <= a;
    b_new <= b;
  end

  initial begin
    #700 reset = 1'b1;
    #700 reset = 1'b0;
    #1000 reset = 1'b1;
    #1000 reset = 1'b0;
    a = 2'b11;
    b = 2'b11;
  end

  always@(posedge clock) begin
    if (!reset) begin
      out <= ~a;
      out <= ~b;
    end else begin
      out <= a;
    end
  end
endmodule
```

### Results:

1. Test bench is a new file (Problem2_tb.sv) in the test directory.
2. The test bench is able to run on both models (Verilog and SystemVerilog).
3. The waveform shows 2