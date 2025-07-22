module maj3 (a, b, c, y);
input a, b, c;
output y;
wire im1, im2, im3;
wire [2:0] bits = {a, b, c};
and #(2, 4)
    (im1, bits[0], bits[1]),
    (im2, bits[1], bits[2]),
    (im3, bits[2], bits[0]);
or #(3, 5) (y, im1, im2, im3);
endmodule
/README.md
# HLS_Code_Generator
This repository includes the HLS Code Generator (HLSGen) for Xilinx FPGAs (Xilinx Vivado).

**How to use**

1. Modify the source files (i.e., the Verilog files) to include the HLS-specific directive statements. The main HLS-specific directive statement is the `#pragma HLS INTERFACE` statement. See the [Vivado HLS Reference Manual](http://www.xilinx.com/support/documentation/sw_manuals/xilinx2016_4/ug902-vivado-high-level-synthesis.pdf) for more details.
2. Build the executable file `HLSGen` by running `make` in the `HLSGen` folder.
3. Run the `HLSGen` executable file by running
```
./HLSGen <your_source_files> [-i <name of output ie the `HLSGen` executable file by running
```
./HLSGen <your_source_files> [-i <name of output input file>][[-o <name of output output file>][-d <directive>]]
```

**Example**

```
./HLSGen./test_files/verilog_files/maj3.v -o./test_files/verilog_files/maj3_modified.v -d "2, 4"
```

The output Verilog file `./test_files/verilog_files/maj3_modified.v` will be created.
nput file>][[-o <name of output output file>][-d <directive>]]
```

**Example**

```
./HLSGen./test_files/verilog_files/maj3.v -i./test_files/verilog_files/maj3_modified.v -d "2, 4"
```

The output Verilog files `./test_files/verilog_files/maj3_modified.v` will be created.

**How to build the executable file**

Run `make` to build the executable file `HLSGen`.

**Additional Arguments**

The HLSGen executable file can take other arguments besides the Verilog file names. To see the available arguments, run
```
./HLSGen -h
```

**How to run the HLSGen executable file**

Run th/HLSGen/test_files/verilog_files/maj2.c
// Function: Majority2
// Majority2(a, b, c, y)
//    y = a OR b OR c

int Majority2(int a, int b, int c, int y){
    int im1, im2, im3;
    im1 = a || b;
    im2 = b || c;
    im3 = c || a;
    y = im1 || im2 || im3;
}
/HLSGen/test_files/verilog_files/maj4_modified.c
// Function: Majority4
// Majority4(a, b, c, d, y)
//    y = (a OR b OR c OR d) & ~(a & b & c & d)

int Majority4(int a, int b, int c, int d, int y){
    int im1, im2, im3, im4, im5;
    im1 = a || b || c || d;
    im2 = (a & b & c & d);
    im3 =!(im2);
    im4 = im1 && im3;

 im5);
}
   y = im4;
}

int Majority4(int a, int b, int c, int d){
    int im1, im2, im3, im4;
    im1 = a || b || c || d;
    im2 = (a & b & c & d);
    im3 =!(im2);
    im4 = im1 && im3;

    return(rallel (
        #pragma HLS INTERFACE axis port=out
    )
    // Input parameters for the majority function
    int a, b, c, d, y;

    #pragma HLS INTERFACE s_axilite port=a bundle=ctrl
    #pragma HLS INTERFACE s_axilite port=b bundle=ctrl
    #pragma HLS INTERFACE s_axilite port=c bundle=ctrl
    #pragma HLS INTERFACE s_axilite port=d bundle=ctrl
    #pragma HLS INTERFACE s_axilite port=y bundle=ctrl
    #pragma HLS INTERFACE s_axilite port=return bundle=ctrl

    // Pass through the input parameters to the majority function
    Majority4(a, b, c, d, y);

    // Write the majority result to the AXI4-Stream output
    out.write(y);
}
/HLSGen/test_files/verilog_files/maj4.cpp
#include "maj4.h"

// Function: Majority4
// Majority4(a, b, c, d, y)
//    y = (a OR b OR c OR d) & ~(a & b & c & d)

void Majority4_hls(
    // AXI4-Stream input
    axi_stream& in,
    // AXI4-Stream output
    axi_stream& out
){
    // Receive the majority input parameters from the AXI4-Stream input
    int a, b, c, d;
    in >> a >> b >> c >> d;

    // Define the majority function
    void Majority4(int a, int b, int c, int d, int y);

    // Output the majority result to the AXI4-Stream output
    #pragma HLS PIPELINE

    // Output parameters for the majority function
    #pragma HLS INTERFACE s_axilite port=return bundle=ctrl

    // Output the majority result to the AXI4-Stream output
    #pragma HLS pe/HLSGen/test_files/verilog_files/maj4_modified.c
// Function: Majority4
// Majority4(a, b, c, d, y)
//    y = (a OR b OR c OR d) & ~(a & b & c & d)

int Majority4(int a, int b, int c, int d, int y){
    int im1, im2, im3, im4;
    im1 = a || b || c || d;
    im2 = (a & b & c & d);
    im3 =!(im2);
    im4 = im1 && im3;

    y = im4;
}

int Majority4(int a, int b, int c, int d){
    int im1, im2, im3, im4;
    im1 = a || b || c || d;
    im2 = (a & b & c & d);
    im3 =!(im2);
    im4 = im1 && im3;

    return(im4);
}
/HLSGen/test_files/verilog_files/maj2_modified.h
void Majority2_hls(
    // AXI4-Stream input
    axi_stream& in,
    // AXI4-Stream output
    axi_stream& out
);
/HLSGen/test_files/verilog_files/maj2_modified.cpp
void Majority2_hls(
    // AXI4-Stream input
    axi_stream& in,
    // AXI4-Stream output
    axi_stream& out
){
    // Receive the majority input parameters from the AXI4-Stream input
    int a, b, c;
    in >> a >> b >> c;

    // Define the majority function
    void Majority2(int a, int b, int c, int y);

    // Output the majority result to the AXI4-Stream output
    #pragma HLS PIPELINE

    // Output parameters for the majority function
    #pragma HLS INTERFACE s_axilite port=return bundle=ctrl

    // Output the majority result to the AXI4-Stream output
    #pragma HLS pe parallel (
        #pragma HLS INTERFACE axis port=out
    )
    int y;
    in >> y;
    out << y;
}
/HLSGen/test_files/verilog_files/maj4.c
// Function: Majority