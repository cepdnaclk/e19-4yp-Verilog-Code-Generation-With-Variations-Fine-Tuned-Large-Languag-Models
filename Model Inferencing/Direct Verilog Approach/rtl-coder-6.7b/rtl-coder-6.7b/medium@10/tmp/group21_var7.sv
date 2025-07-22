module array_test (a,b,c, d);
  input a,b;
  output [3:0] c;
  reg [3:0] d;
  
  reg [1:0] m,n;
  initial begin
    m = 0; n = 0;
  end
  
  // Declare array to hold gate inverter outputs
  reg [3:0] inv_output_table [1:0][1:0];
  
  // Populate array with inverter outputs
  initial begin
    inv_output_table[0][0] = 1'b0;
    inv_output_table[0][1] = 1'b1;
    inv_output_table[1][0] = 1'b1;
    inv_output_table[1][1] = 1'b0;
  end
  
  // Compute index from inputs
  always @(negedge clk_i) begin
    m = b & a; n = b | a;
  end
  
  // Output inverter values
  always @(negedge clk_i) begin
    case(m) // Test first input
      1'b0: begin
        case(n) // Test second input
          1'b0: d = inv_output_table[0][0];
          1'b1: d = inv_output_table[0][1];
          1'bX: d = inv_output_table[0][1];
        endcase
      end
      1'b1: begin
        case(n) // Test second input
          1'b0: d = inv_output_table[1][0];
          1'b1: d = inv_output_table[1][1];
          1'bX: d = inv_output_table[1][1];
        endcase
      end
      1'bX: begin
        case(n) // Test second input
          1'b0: d = inv_output_table[x][0];
          1'b1: d = inv_output_table[x][1];
          1'bX: d = inv_output_table[x][1];
        end