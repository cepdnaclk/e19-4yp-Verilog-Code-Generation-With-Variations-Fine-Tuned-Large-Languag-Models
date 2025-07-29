module mltp_b(a1,a0,b1,b0,c1,c2,c3,c4); // PLA based 2x2 multiplier
  input a1,a0,b1,b0; output c1,c2,c3,c4;
  // Declare storage for AND plane and OR plane
  reg[1:4] mand[1:9]; // AND plane inputs (4 bits wide, 9 product terms)
  reg[1:9] mor[1:4]; // OR plane inputs (9 bits wide, 4 outputs)
  reg p1,p2,p3,p4,p5,p6,p7,p8,p9; // Product terms
  reg c1,c2,c3,c4; // Outputs must be reg for procedural assignment
  function automatic [1:9] p; // Flip-flops are not allowed in function definitions
    input [1:9] a;
    begin
      integer i;
      for (i=1; i<10; i=i+1) begin
    	if (a[i]) p=i;
      end
    end
  endfunction
  initial begin
    // Define AND plane connections (input -> product term)
    mand[1]=4'b1010; mand[2]=4'b0110; mand[3]=4'b1110; mand[4]=4'b1001;
    mand[5]=4'b0101; mand[6]=4'b1101; mand[7]=4'b1011; mand[8]=4'b0111;
    mand[9]=4'b1111;
    // Define OR plane connections (product term -> output)
    // Format: 9 bits for p1-p9 connections for each output c1-c4
    mor[1]=9'b101000101; // Connections for c1
    mor[2]=9'b011101110; // Connections for c2
    mor[3]=9'b000011010; // Connections for c3
    mor[4]=9'b000000001; // Connections for c4
    // Instantiate PLA using system tasks
    $async$and$array(mand, {b1,b0,a1,a0}, p);  // FIXME
    $async$or$array(mor, p, {c4,c3,c2,c1});  // FIXME
  end
endmodule
### Example Command(s):
```commandline
# Create base multiplier
> read_verilog mltp_a.v
# Make modification
> read_verilog mltp_b.v
> select_object mltp_b a1 a0 b1 b0 c1 c2 c3 c4
> run_pass -nocheck_design -pre_logical_effort 2
```
### Expected Results:
* A new multiplier with flip-flops in its function definition, should be created
* The multiplier should be synthesized correctly

### Known Errors:
This test fails when run with the following error:
```
ERROR: [Common 17-259] Verilog HDL error at mltp_b.v(33): Illegal assignment to 'p', a function.
```

### Coresponding Warnings:
All warnings have been disabled

### Corective Action:
Replace the direct PLA output logic with a function call in the array index used within a `inside` range list as shown in the `mtlp_b` verilog module.

### Verification Steps:
1. Run the following command:
   ```commandline
   $ make clean
   $ make synth
   ```
2. Open Synopsys Design Constraints (SDC) file `mltp.sdc`
3. Verify the following constraints have been generated:
   ```
   create_generated_clock -add -src a0 -period 3 -name a0
   create_generated_clock -add -src a1 -period 3 -name a1
   create_generated_clock -add -src b0 -period