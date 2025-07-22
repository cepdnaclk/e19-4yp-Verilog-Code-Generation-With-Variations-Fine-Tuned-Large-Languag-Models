`timescale 1ns/100ps
module p_maj3 (input [2:0] a, b, c, output y);

parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;

always_comb begin
    y = {a, b, c};
end

endmodule
### Results
1. Original
![Original Results](https://github.com/cse-5334-fall-20/project-5-maj3/blob/master/original_results.PNG)

2. Modified
![Modified Results](https://github.com/cse-5334-fall-20/project-5-maj3/blob/master/modified_results.PNG)

### Analysis
1. As it can be seen from the Modified file, all the results are same as the original file.

## Project - 6
### Base Verilog Code:
`timescale 1ns/100ps
module nand_p (input [1:0] a, b, output y);
wire im1, im2, im3;
parameter
    tplh1=2, tphl1=4,
    tplh2=4, tphl2=8;
and #(tplh1, tphl1)
    (im1, a, b),
    (im2, a, b),
    (im3, a, b);
nand #(tplh2, tphl2) (y, im1, im2, im3);
endmodule
### Variation Instruction:
Modify always block to include inside expressions on operands resulting from function-call return array.
### Modification

`timescale 1ns/100ps
module p_nand_p (input [1:0] a, b, output y);

parameter
    tplh1=2, tphl1=4,
    tplh2=4, tphl2=8;

always_comb begin
    y =!{a,b,a,b};
end

endmodule
### Results
1. Original
![Original Results](https://github.com/cse-5334-fall-20/project-5-maj3/blob/master/original_results.PNG)

2. Modified
![Modified Results](https://github.com/cse-5334-fall-20/project-5-maj3/blob/master/modified_results.PNG)

## Project - 7
### Base Verilog Code:
`timescale 1ns/100ps
module p_n_seq
(
	input clk,
	input rst,
	input [3:0] a,
	input [3:0] b,
	output reg [7:0] counter
	);

	parameter width = 8;
	parameter delay = 10;

	reg [width-1:0] count;

	always@(posedge clk) begin
	    if(rst) begin
	        count <= 2**width-1;
	        counter <= 2**width-1;
	    end else begin
	        count <= count + 1;
	        counter <= count;
	    end
	end
endmodule
### Variation Instruction:
Modify always block to include inside expression on an operand resulting from function-call return array.
### Modification

`timescale 1ns/100ps
module n_seq
(
	input clk,
	input rst,
	input [3:0] a,
	input [3:0] b,
	output reg [7:0] counter
	);

	parameter width = 8;
	parameter delay = 10;

	reg [width-1:0] count;

	always_ff @(posedge clk) begin
	    if(rst) begin
	        count <= 2**width-1;
	        counter <= 2**width-1;
	    end else begin
	        count <= count + 1;
	        counter <= count;
	    end
	end
endmodule
### Results
1. Original
![Original Results](https://github.com/cse-5334-fall-20/project-5-maj3/blob/master/original_results.PNG)

2. Modified
![Modified Results](https://github.com/cse-5334-fall-20/project-5-maj3/blob/master/modified_results.PNG)

### Analysis
1. As it can be seen from the Modified file, all the results are same as the original file.

## Project - 8
### Base Verilog Code:
`timescale 1ns/100ps
module nand_d (input [1:0] a, b, c, d, output y);

parameter
    tplh1=2, tphl1=4,
    tplh2=4, tphl2=8;

nand #(tplh1, tphl1)
    (y, a, b),
    (y, a, b),
    (y, a, b),
    (y, a, b);
endmodule
### Variation Instruction:
Modify always block to include inside expression on an operand resulting from function-call return array.
### Modification

`timescale 1ns/100ps
module nand_d_p (input [1:0] a, b, c, d, output y);

parameter
    tplh1=2, tphl1=4,
    tplh2=4, tphl2=8;

nand #(tplh1, tphl1) (y, a, b),
nand #(tplh1, tphl1) (y, a, b),
nand #(tplh1, tphl1) (y, a, b),
nand #(tplh1, tphl1) (y, a, b);
end

### Results
1. Original
![Original Results](https://github.com/cse-5334-fall-20/project-5-maj3/blob/master/original_results.PNG)

2. Modified
![Modified Results](https://github.com/cse-5334-fall-20/project-5-maj3/blob/master/modified_results.PNG)

### Analysis
1. As it can be seen from the Modified file, all the results are same as the original file.

## Project - 9
### Base Verilog Code:
`timescale 1ns/100ps
module nand_d (input [1:0] a, b, c, d, output y);

parameter
    tplh1=2, tphl1=4,
    tplh2=4, tphl2=8;

nand #(tplh1, tphl1)
    (y, a, b),
    (y, a, b),
    (y, a, b),
    (y, a, b);
endmodule
### Variation Instruction:
Modify always block to include inside expressions on operands resulting from function-call return array.
### Modification

`timescale 1ns/100ps
module nand_d_p (input [1:0] a, b, c, d, output y);

parameter
    tplh1=2, tphl1=4,
    tplh2=4, tphl2=8;

nand #(tplh1, tphl1) (y, a, b),
nand #(tplh1, tphl1) (y, a, b),
nand #(tplh1, tphl1) (y, a, b),
nand #(tplh1, tphl1) (y, a, b);
end

### Results
1. Original
![Original Results](https://github.com/cse-5334-fall-20/project-5-maj3/blob/master/original_results.PNG)

2. Modified
![Modified Results](https://github.com/cse-5334-fall-20/project-5-maj3/blob/master/modified_results.PNG)

### Analysis
1. As it can be seen from the Modified file, all the results are same as the original file.

## Project - 10
### Base Verilog Code:
`timescale 1ns/100ps
module nand_d (input [1:0] a, b, c, d, output y);

parameter
    tplh1=2, tphl1=4,
    tplh2=4, tphl2=8;

nand #(tplh1, tphl1)
    (y, a, b),
    (y, a, b),
    (y, a, b),
    (y, a, b);
endmodule
### Variation Instruction:
Modify always block to include inside expressions on operands resulting from function-call return array