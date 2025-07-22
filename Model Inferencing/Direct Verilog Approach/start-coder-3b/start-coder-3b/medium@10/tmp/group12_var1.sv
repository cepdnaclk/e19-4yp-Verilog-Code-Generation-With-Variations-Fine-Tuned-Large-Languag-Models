```
`include "maj_3_v3.vh"
module maj3_v3 (input [1:0]a, b, c, output [1:0]y);
    maj_3_v3 fcn (a,b,c,y);
endmodule
```
### Generated Verilog Code:
```
module maj3_v3 (input [1:0]a, b, c, output [1:0]y);
    wire [1:0] im1;
    wire [1:0] im2;
    wire [1:0] im3;
    and _p1 (im1,a,b);
    and _p2 (im2,b,c);
    and _p3 (im3,c,a);
    or _p4 (y,im1,im2,im3);
endmodule
```
### Diff:
```
module maj3_v3 (input [1:0]a, b, c, output [1:0]y);
    wire [1:0] im1;
    wire [1:0] im2;
    wire [1:0] im3;
    and _p1 (im1,a,b);
    and _p2 (im2,b,c);
    and _p3 (im3,c,a);
    or _p4 (y,im1,im2,im3);
endmodule
```
/include/dft/dft_v5_1.vh.h
#pragma once

#define DFT_V5_1_INPUT_COUNT 1
#define DFT_V5_1_OUTPUT_COUNT 0

wire [0:0] x0;
wire [0:0] x1;

nand _p1 (x0,x1);

assign x0 = input;
assign x1 = 0;

`include "dft/dft_v5_1.vh"/src/test_generation.cpp
#include "gtest/gtest.h"

#include "generators/generators.cpp"

#include "generators/maj_3.cpp"
#include "generators/maj_3_v2.cpp"
#include "generators/maj_3_v3.cpp"
#include "generators/maj_3_v4.cpp"

#include "generators/dft.cpp"
#include "generators/dft_v2.cpp"
#include "generators/dft_v3.cpp"
#include "generators/dft_v4.cpp"
#include "generators/dft_v5.cpp"
#include "generators/dft_v6.cpp"

#include "generators/maj_3_v7.cpp"
#include "generators/maj_3_v8.cpp"
#include "generators/maj_3_v9.cpp"

#include "generators/maj_3_v10.cpp"
#include "generators/maj_3_v11.cpp"
#include "generators/maj_3_v12.cpp"

#include "generators/dft_v13.cpp"
#include "generators/dft_v14.cpp"
#include "generators/dft_v15.cpp"
#include "generators/dft_v16.cpp"
#include "generators/dft_v17.cpp"
#include "generators/dft_v18.cpp"

#include "generators/maj_3_v19.cpp"
#include "generators/maj_3_v20.cpp"

#include "generators/maj_3_v21.cpp"
#include "generators/maj_3_v22.cpp"
#include "generators/maj_3_v23.cpp"

#include "generators/maj_3_v24.cpp"
#include "generators/maj_3_v25.cpp"
#include "generators/maj_3_v26.cpp"

#include "generators/maj_3_v27.cpp"
#include "generators/maj_3_v28.cpp"
#include "generators/maj_3_v29.cpp"

#include "generators/maj_3_v30.cpp"
#include "generators/maj_3_v31.cpp"
#include "generators/maj_3_v32.cpp"

#include "generators/maj_3_v33.cpp"
#include "generators/maj_3_v34.cpp"
#include "generators/maj_3_v35.cpp"

#include "generators/maj_3_v36.cpp"
#include "generators/maj_3_v37.cpp"
#include "generators/maj_3_v38.cpp"

#include "generators/maj_3_v39.cpp"
#include "generators/maj_3_v40.cpp"
#include "generators/maj_3_v41.cpp"

#include "generators/maj_3_v42.cpp"
#include "generators/maj_3_v43.cpp"
#include "generators/maj_3_v44.cpp"

#include "generators/maj_3_v45.cpp"
#include "generators/maj_3_v46.cpp"
#include "generators/maj_3_v47.cpp"

#include "generators/maj_3_v48.cpp"
#include "generators/maj_3_v49.cpp"
#include "generators/maj_3_v50.cpp"

#include "generators/maj_3_v51.cpp"
#include "generators/maj_3_v52.cpp"
#include "generators/maj_3_v53.cpp"

#include "generators/maj_3_v54.cpp"
#include "generators/maj_3_v55.cpp"
#include "generators/maj_3_v56.cpp"

#include "generators/maj_3_v57.cpp"
#include "generators/maj_3_v58.cpp"
#include "generators/maj_3_v59.cpp"

#include "generators/maj_3_v60.cpp"
#include "generators/maj_3_v61.cpp"
#include "generators/maj_3_v62.cpp"

#include "generators/maj_3_v63.cpp"
#include "generators/maj_3_v64.cpp"
#include "generators/maj_3_v65.cpp"

#include "generators/maj_3_v66.cpp"
#include "generators/maj_3_v67.cpp"
#include "generators/maj_3_v68.cpp"

#include "generators/maj_3_v69.cpp"
#include "generators/maj_3_v70.cpp"
#include "generators/maj_3_v71.cpp"

#include "generators/maj_3_v72.cpp"
#include "generators/maj_3_v73.cpp"
#include "generators/maj_3_v74.cpp"

#include "generators/maj_3_v75.cpp"
#include "generators/maj_3_v76.cpp"
#include "generators/maj_3_v77.cpp"

#include "generators/maj_3_v78.cpp"
#include "generators/maj_3_v79.cpp"
#include "generators/maj_3_v80.cpp"

#include "generators/maj_3_v81.cpp"
#include "generators/maj_3_v82.cpp"
#include "generators/maj_3_v83.cpp"

#include "generators/maj_3_v84.cpp"
#include "generators/maj_3_v85.cpp"
#include "generators/maj_3_v86.cpp"

#include "generators/maj_3_v87.cpp"
#include "generators/maj_3_v88.cpp"
#include "generators/maj_3_v89.cpp"

#include "generators/maj_3_v90.cpp"
#include "generators/maj_3_v91.cpp"
#include "generators/maj_3_v92.cpp"

#include "generators/maj_3_v93.cpp"
#include "generators/maj_3_v94.cpp"
#include "generators/maj_