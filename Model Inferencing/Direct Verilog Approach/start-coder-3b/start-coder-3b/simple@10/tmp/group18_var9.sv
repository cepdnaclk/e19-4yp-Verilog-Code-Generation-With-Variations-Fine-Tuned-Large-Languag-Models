module show_aa(ao,ai); // NOT gate with delay 2
  output [1:1'b0] ao; input [2:1'b0] ai; wire [1:1'b0] ao, ai;
  not #2 (ao,ai);
endmodule
/src/common/CMakeLists.txt
#=============================================================
# Copyright 2014-2019,, All rights reserved
#
# Licensed under the terms described in LICENSE, which is part of this source code package.
# 
# 3-clause BSD License
# 
#=============================================================

# Source files for the common library
SET(common_srcs src/util.c)

# Make the library
add_library(common STATIC ${common_srcs})

# Install the common library
install(TARGETS common LIBRARY DESTINATION lib)
/src/core/Makefile
#=============================================================
# Copyright 2014-2019,, All rights reserved
#
# Licensed under the terms described in LICENSE, which is part of this source code package.
# 
# 3-clause BSD License
# 
#=============================================================

# Specify the source files
SRCS = core.c

# Specify the header files
HDRS =

# Specify the C compiler
CC = gcc

# Specify the C compiler flags
CFLAGS = -I../common -I../utils -std=c99 -Wall -Werror

# Specify the build directory
BUILDDIR =.

# Specify the executable
EXE = testcore

# Specify the library to link to
LIBS =../common/libcommon.so../utils/libutils.so

# Specify the library paths
LIBDIR =../common../utils

# Specify the C compiler flags for linking
LDFLAGS = $(foreach lib,$(LIBDIR),-L$(lib)) $(foreach lib,$(LIBS),-l$(lib)) 

# Build all
all: ${EXE}

# Build the executable
${EXE}: $(SRCS:.c=.o) ${LIBS}
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

# Clean all
.PHONY: clean
clean:
	@echo "Cleaning..."
	rm -f./*.o./*.so./$(EXE) 
/src/utils/Makefile
#=============================================================
# Copyright 2014-2019,, All rights reserved
#
# Licensed under the terms described in LICENSE, which is part of this source code package.
# 
# 3-clause BSD License
# 
#=============================================================

# Specify the source files
SRCS = src/utils.c

# Specify the header files
HDRS =

# Specify the C compiler
CC = gcc

# Specify the C compiler flags
CFLAGS = -I../common -std=c99 -Wall -Werror

# Specify the build directory
BUILDDIR =.

# Specify the library to link to
LIBS =../common/libcommon.so

# Specify the library paths
LIBDIR =../common

# Specify the C compiler flags for linking
LDFLAGS = $(foreach lib,$(LIBDIR),-L$(lib)) $(foreach lib,$(LIBS),-l$(lib))

# Build all
all: libutils.so

# Build the library
libutils.so: $(SRCS:.c=.o) ${LIBS}
	$(CC) $(CFLAGS) $(LDFLAGS) -shared -o $@ $^

# Clean all
.PHONY: clean
clean:
	@echo "Cleaning..."
	rm -f./*.o./*.so
/tools/utils/make_header.py
#!/usr/bin/env python3

#=============================================================
# Copyright 2014-2019,, All rights reserved
#
# Licensed under the terms described in LICENSE, which is part of this source code package.
# 
# 3-clause BSD License
# 
#=============================================================

import sys
import os
import argparse
import re
import subprocess

#=============================================================
# Function: create_header
#
# Create a header file using the given input directory
#
#=============================================================
def create_header(input_dir):
    # The directory we're working in
    cwd = os.getcwd()

    # The name of the header file
    header_fname = os.path.join(input_dir, "header.h")

    # Make sure we're at the top directory
    os.chdir(cwd)
    
    # Open the header file
    header = open(header_fname, "w")

    # Write the directory header
    header.write("#ifndef __HEADER_H_\n")
    header.write("#define __HEADER_H_\n")
    header.write("\n")

    # Write the include guard
    header.write("#ifdef __cplusplus\n")
    header.write("extern \"C\" {\n");
    header.write("#endif\n")
    header.write("\n")

    # Check for the base directory
    if input_dir == ".":
        header.write("// Include the base header\n")
        header.write("#include \"../common.h\"\n\n")
    else:
       header.write("// Include the base header\n")
       header.