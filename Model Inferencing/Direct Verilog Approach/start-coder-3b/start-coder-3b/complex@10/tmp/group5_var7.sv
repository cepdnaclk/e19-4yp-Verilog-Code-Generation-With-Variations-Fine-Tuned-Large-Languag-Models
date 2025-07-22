class mealy_variation;
    `timescale 1ns / 1ps
    // state is array index for array of states
    `enum states {A, B} state;
    // parameter can be used to set default parameter for SV class
    parameter A = 0, B = 1;
    // output
    logic y;
    logic z;
    // input
    logic w;
    // input as logic variable
    logic Clock, Resetn;
    // clock is enabled by logic variable
    logic clock_enabled;
    assign clock_enabled = Clock;
    always @(w or y) begin
        case (y)
            A: if (w) begin
                z = 0;
                state = B;
                end
            else
                begin
                z = 0;
                state = A;
                end
            B: if (w) begin
                z = 1;
                state = B;
                end
            else
                begin
                z = 0;
                state = A;
                end
        endcase
    end

    // this is the only change
    // state for each state is an array slice
    always @(posedge clock_enabled) begin
        if (Resetn == 0) y <= A;
        else begin
            case (state)
            A: y <= A;
            B: y <= B;
            endcase
        end
    end
endclass
module mealy_variation;
    // port that connects to the clock input
    input clock_enabled;
    // w as logic variable
    logic w;
    // w as logic variable
    logic Resetn;
    // instantiate mealy_variation class
    mealy_variation variation(.Clock(clock_enabled),.Resetn(Resetn),.w(w));
    // connect variation z to output
    assign z = variation.z;
endmodule
/c/examples/examples.c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <getopt.h>
#include <signal.h>
#include <sys/wait.h>

#include "examples.h"
#include "examples-generated.h"

int main (int argc, char *argv[])
{
    // Example to read an array into a C array and print it
    uint16_t input_array[2] = {1,2};
    printf("Read in input array: ");
    for (int i = 0; i < 2; i++)
    {
        printf("%d ", input_array[i]);
    }
    printf(".\n");
    printf("Read in the same input using the generated file.\n");
    printf("Read in the same input using the generated file.\n");
    printf("Read in the same input using the generated file.\n");
    uint16_t input_array_generated[2];
    printf("Read in input array: ");
    for (int i = 0; i < 2; i++)
    {
        printf("%d ", input_array_generated[i]);
    }
    printf(".\n");
    printf("You can access the generated array using the generated names.\n");
    for (int i = 0; i < 2; i++)
    {
        uint16_t input_name_gen = input_array[i];
        printf("input_name_gen: %d.\n", input_name_gen);
    }
    // Example to read in a 3D array and print it out
    int num_rows = 3;
    int num_cols = 4;
    int num_depth = 2;
    uint8_t matrix[2][3][4] = {
        {
            {1,2,3,4},
            {5,6,7,8},
            {9,10,11,12}
        },
        {
            {13,14,15,16},
            {17,18,19,20},
            {21,22,23,24}
        }
    };
    for (int i = 0; i < num_rows; i++)
    {
        printf("Row %d: ", i);
        for (int j = 0; j < num_cols; j++)
        {
            printf("Column %d: ", j);
            for (int k = 0; k < num_depth; k++)
            {
                uint8_t cell = matrix[k][i][j];
                printf("%d ", cell);
            }
            printf("\n");
        }
        printf("\n");
    }
    return 0;
}
/c/docs/CMakeLists.txt
# Get the root directory.
get_filename_component(PARENT_DIR ${CMAKE_CURRENT_SOURCE_DIR} DIRECTORY)

# Configure the config file for the build directory.
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/doc-config.h.in ${CMAKE_CURRENT_BINARY_DIR}/doc-config.h)

# Define include directories.
include_directories(${PARENT_DIR}/include)

# Define the source file for the documentation generation.
set(doc_src_files doc.c)

# Define the header files for the documentation generation.
set(doc_hdr_files
    ${PARENT_DIR}/include/doc-config.h
    ${CMAKE_CURRENT_BINARY_DIR}/doc-config.h)

# Set the source for the documentation.
set(doc_sources ${doc_src_files} ${doc_hdr_files})

# Add the target for documentation.
add_custom_target(doc
        ALL
        COMMAND ${CMAKE_C_COMPILER} ${doc_sources} ${doc_hdr_files} -o doc
        WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
        COMMENT "Generating documentation"
        VERBATIM)

# Add the doc target to the build.
add_dependencies(build doc)
/README.md
# VHDL-Verilog Compiler

The VHDL-Verilog Compiler is a system that will take a VHDL file and convert it into a Verilog implementation.
The system is built on the FuseSoC framework.
It is written in C and C++.

## Getting Started

Start by cloning the repository.

```
git clone https://github.com/SymbiFlow/vlog_comp
```

You will also need the FuseSoC framework.
FuseSoC is a project that makes it easier to build FPGA bitstreams by describing the hardware as a series of components.
The framework itself is written in a language called FuseSoC-language (FSL) that is very similar to Verilog.

### Prerequisites

You need to make sure that you have the FSL installed to use the compiler.
The easiest thing to do is to download and install the FSL-core using pip or conda.

```
pip install fusesoc
```

If you don't want to install the FSL-core using pip or conda, then you will need to get it from the [FSL-core](https://github.com/SymbiFlow/fusesoc-cores) repository.
To get the FSL-core, run the following commands.

```
git clone https://github.com/SymbiFlow/fusesoc-cores
cd fusesoc-cores
git checkout v2.1.1
make all
```

## Documentation

You can read about the project on the [wiki](https://github.com/SymbiFlow/vlog_comp/wiki).

## Authors

* **** - *Initial work* - [sridharkatam](https://github.com/sridharkatam)
* **** - *Initial work* - [gustavobernal](https://github.com/gustavobernal)

See also the list of [contributors](https://github.com/SymbiFlow/vlog_comp/contributors) who participated in this project.

## License

This project is licensed under the BSD License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

*  for help with the project.
*  and  from the University of Minnesota for help with getting the project started.
*  for helping with the project.
*  for helping with the project.
*  for helping with the project.
/c/docs/doc-config.h.in
/**
 * @file
 * @brief This file is generated from @ref ${CMAKE_CURRENT_SOURCE_DIR}.
 */

#ifndef __DOC_CONFIG_H__
#define __DOC_CONFIG_H__

#define DOC_VERSION "@${FSL_LIBRARY_VERSION_MAJOR}.${FSL_LIBRARY_VERSION_MINOR}"

#endif
/c/include/doc-config.h
/**
 * @file