`module Add4(input [3:0] operand1, input [3:0] operand2, output reg [3:0] sum, output reg [3:0] diff);
assign diff = operand1 - operand2;
assign sum = operand1 + operand2;
sum = 4'b1000;
diff = 4'b1000;
endmodule
/Lab 5/Lab5/test/tb/makefile
SCVERILATOR_ROOT_DIR?= ${HOME}/Downloads/verilator-4.026/

# VCS_ROOT_DIR?= $(shell vcs -V | grep "Install directory:" | sed -e's/Install directory: //')
# ifeq ($(VCS_ROOT_DIR),)
# $(error "VCS_ROOT_DIR not found")
# endif

# VCS_VERILATOR_ROOT_DIR?= $(shell vcs -V | grep "Verilator: " | sed -e's/Verilator: //')
# ifeq ($(VCS_VERILATOR_ROOT_DIR),)
# $(error "Cannot find Verilator root directory")
# endif

# VCS_DIR?= ${VCS_ROOT_DIR}/bin
# VCS_VERILATOR_DIR?= $(VCS_VERILATOR_ROOT_DIR)/bin

# export PATH := $(PATH):$(VCS_DIR):$(VCS_VERILATOR_DIR)

# VCS_FLAGS = -full64 -sverilog -ntb_opts uvm-1.1
# VCS_VERILATOR_FLAGS = -sv -Wno-fatal -Wall

VERILATOR_FLAGS = -Wno-fatal -Wall

CXXFLAGS =  -I$(SCVERILATOR_ROOT_DIR)/include -DVM_COVERAGE=0 -DVM_TRACE=0 -g3
LDFLAGS = -L$(SCVERILATOR_ROOT_DIR)/lib -Wl,-