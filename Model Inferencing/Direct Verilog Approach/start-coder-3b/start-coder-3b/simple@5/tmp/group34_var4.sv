[source, c]
----
include::src/main/c/assign_array.c[lines=34..40]
----
### Expected Outcome:
----
$./run.sh
Testing assign_array.c...
Testing assign_array_c.c...
----
### Actual Outcome:
----
$./run.sh
Testing assign_array.c...
Testing assign_array_c.c...
    @@@@ Test case failed with message: mismatch
----

/src/main/c/func_attr.c

#include "vhls_c_test.h"

#define SIZE 5
#define ROWS 6
#define COLS 4

#define OUT_SIZE 5

#include "func_attr.h"

#include "vhls_c_test.h"

// Function Attr: HLS_S_AXI_MEM

void func_attr_c( ap_uint<16> matrix_in[SIZE][ROWS][COLS], int rows, int cols, ap_uint<16> out[OUT_SIZE][ROWS]) {
    for(int i = 0; i < cols; i++) {
        for(int j = 0; j < ROWS; j++) {
            for(int k = 0; k < SIZE; k++) {
                out[k][j] = matrix_in[k][j][i];
            }
        }
    }
}
/src/main/c/assign_array.c

#include "vhls_c_test.h"

#define SIZE 5
#define ROWS 6
#define COLS 4

#define OUT_SIZE 5


#include "assign_array.h"

// Array indexing: HLS_S_AXI_MEM, HLS_S_AXI_BRAM, and HLS_S_AXI_AESL_WORLD

void assign_array_c( ap_uint<16> matrix_in[SIZE][ROWS][COLS], int rows, int cols, ap_uint<16> out[OUT_SIZE][ROWS]) {
    for(int i = 0; i < cols; i++) {
        for(int j = 0; j < ROWS; j++) {
            for(int k = 0; k < SIZE; k++) {
                //out(k,j) = matrix_in[k][j][i];
                // Alternate approach: use inside indexing operator
                out[k][j] = matrix_in[k][j][i];
            }
        }
    }
}
/src/main/c/assign_wildcard.c

#include "vhls_c_test.h"

#define SIZE 5
#define ROWS 6
#define COLS 4

#define OUT_SIZE 5

#include "assign_wildcard.h"

// Wildcard indexing: HLS_S_AXI_MEM, HLS_S_AXI_BRAM, and HLS_S_AXI_AESL_WORLD

void assign_wildcard_c( ap_uint<16> matrix_in[SIZE][ROWS][COLS], int rows, int cols, ap_uint<16> out[OUT_SIZE][ROWS]) {
    for(int i = 0; i < cols; i++) {
        for(int j = 0; j < ROWS; j++) {
            for(int k = 0; k < SIZE; k++) {
                //out(k,j) = matrix_in[k][j][i];
                // Alternate approach: use inside indexing operator
                out[k][j] = matrix_in[k][j][i];
            }
        }
    }
}
/src/main/vhls/assign_wildcard/Makefile

.PHONY: all clean

all: func_attr.cpp.xo

clean:
	rm -rf *.xo *.xclbin *.xclbin.info *.rpt *.debug.log *.csv

.INTERMEDIATES: *.cpp.xo
/scripts/test_all.sh

./run.sh

# Make sure there are no more errors
echo ""
if [ -z "$(grep -r --include=*.log "Error:)".)" ]; then
    echo "Success: All tests passed"
else
    echo "Error: At least one test failed"
fi

echo ""
echo "Finished testing all cases"
/src/main/c/read_write.h
// Read-Write: HLS_S_AXI_MEM

#ifndef READ_WRITE_H_
#define READ_WRITE_H_

extern "C" {
    void read_write_c( ap_uint<16> matrix_in[SIZE][ROWS][COLS], int rows, int cols, ap_uint<16> out[OUT_SIZE][ROWS]);
}

#endif /* READ_WRITE_H_ */
/src/main/vhls/read_write/read_write.cpp

#include "opencv/cv.h"
#include "opencv/highgui.h"
#include "opencv2/imgproc/imgproc.hpp"
#include "hls_video.h"

#define SIZE 5
#define ROWS 6
#define COLS 4

#define OUT_SIZE 5

#include "read_write.h"

#include "vhls_c_test.h"

// Read-Write: HLS_S_AXI_MEM

void read_write_cpp( ap_uint<16> matrix_in[SIZE][ROWS][COLS], int rows, int cols, ap_uint<16> out[OUT_SIZE][ROWS]) {
    for(int i = 0; i < cols; i++) {
        for(int j = 0; j < ROWS; j++) {
            for(int k = 0; k < SIZE; k++) {
                out[k][j] = matrix_in[k][j][i];
            }
        }
    }
}
/src/main/vhls/func_attr/func_attr.cpp

#include "opencv/cv.h"
#include "opencv/highgui.h"
#include "opencv2/imgproc/imgproc.