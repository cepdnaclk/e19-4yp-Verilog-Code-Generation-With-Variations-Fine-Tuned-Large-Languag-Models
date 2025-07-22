Verilog code has been modified for this test case to follow the instruction set.
The conversion of a and b to logic signed [3:0] is done in the ALU module.
*
The test case for this variation instruction is implemented in test_ALU_signed_arith.v

*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

#define MAX_STRING_SIZE 500
#define MAX_LINE_SIZE 80

// Global variables
FILE* fp;
char* fp_name;

////////////////////////////////////////////////////////////////////////////////
// MAIN
////////////////////////////////////////////////////////////////////////////////
int main(int argc, char** argv){
	int ret;
	int i;
	
	// Handle command line arguments
	// usage: run_testcase variation [file]
	if (argc!= 2){
		fprintf(stderr, "ERROR: test case not specified.\n");
		ret = EXIT_FAILURE;
		goto done;
	}
	fp_name = argv[1];

	// Open file containing test case
	fp = fopen(fp_name, "r");
	if (fp == NULL){
		fprintf(stderr, "ERROR: file %s does not exist.\n", fp_name);
		ret = EXIT_FAILURE;
		goto done;
	}

	// Run each test case
	ret = EXIT_SUCCESS;
	while (ret == EXIT_SUCCESS){
		// Run test case
		ret = run_test_case();
		// If running the last test case, we are done.
		if (ret == EXIT_FAILURE){
			fclose(fp);
			break;
		}
	}

done:
	return ret;
}


////////////////////////////////////////////////////////////////////////////////
// INTERNAL FUNCTIONS
////////////////////////////////////////////////////////////////////////////////

// Runs the test case
int run_test_case(void){
	char buffer[MAX_STRING_SIZE];	// Buffer for test case file
	char line[MAX_LINE_SIZE];		// Buffer for test case lines
	int ret;

	// Read the first line of the file
	if (fgets(line, MAX_LINE_SIZE, fp) == NULL){
		return EXIT_FAILURE;
	}
	printf("Running test case: %s\n", line);

	// Run the test case
	ret = run_test_case_internal();
	return ret;
}

// Runs the test case
int run_test_case_internal(void){
	char buffer[MAX_STRING_SIZE];

	int a;
	int b;
	int result;
	char op;
	int clk;

	// Read instruction
	while (fgets(buffer, MAX_STRING_SIZE, fp)!= NULL){
		sscanf(buffer, "%d %d %c %d", &a, &b, &op, &clk);
		if (0 == strcmp(buffer, "finish")){
			return EXIT_SUCCESS;
		}
		// Perform operation
		switch (op){
		case '+':
			result = a + b;
			break;
		case '-':
			result = a - b;
			break;
		case '*':
			result = a * b;
			break;
		case '/':
			result = a / b;
			break;
		default:
			fprintf(stderr, "ERROR: invalid op.\n");
			return EXIT_FAILURE;
		}
		// Print result
		printf("%d %d %c = %d\n", a, b, op, result);
	}
	return EXIT_FAILURE;
}
#ifndef _ALU_H
#define _ALU_H

#include "verilated.h"
#include <stdint.h>

class ALU {
public:
  ALU(uint32_t * a, uint32_t * b, uint32_t * res, bool * clk, bool * rst);
  void set_clk(bool clk);
  void set_rst(uint32_t rst);
  void eval_clk();
  void eval_rst();
  bool eval();

private:
  VL_STAY_STATIC_CONST char* ALU_path;
  VL_STAY_STATIC_CONST char* ALU_include;
  VL_STAY_STATIC_CONST char* ALU_compile;
  VL_STAY_STATIC_CONST char* ALU_compile_path;
  VL_STAY_STATIC_CONST char* ALU_run;
  VL_STAY_STATIC_CONST char* ALU_run_path;
  VL_STAY_STATIC_CONST char* ALU_sim_path;
  VL_STAY_STATIC_CONST char* ALU_input_path;
  VL_STAY_STATIC_CONST char* ALU_output_path;

  VL_STAY_STATIC_CONST char* ALU_input_file;
  VL_STAY_STATIC_CONST char* ALU_output_file;

  VerilatedVcdC* tfp;

  uint32_t * a;
  uint32_t * b;
  uint32_t * res;
  bool * clk;
  bool * rst;
  uint32_t rst_val;

};

#endif
rld\n");
  }
  return 0;
}
#include <stdio.h>

int main(void) {
  if (printf("Hello") == 5) {
    printf("\nHello wo#ifndef _TEST_H
#define _TEST_H

#include <stdint.h>

// Typedefs
typedef struct {
	uint32_t result;
	uint32_t operand_a;
	uint32_t operand_b;
	uint32_t operand_c;
	uint32_t operand_d;
	uint32_t operand_e;
	char operation;
} test;
typedef struct {
	uint32_t operand_a;
	uint32_t operand_b;
	uint32_t operand_c;
	uint32_t operand_d;
	uint32_t operand_e;
	char operation;
	char* output;
} test_expect_output;

// External variables
extern test* test_cases;
extern int test_cases_count;
extern test* test_cases_signed_arith;
extern int test_cases_signed_arith_count;

// Function declarations
test read_test(FILE* fp, const char* line);
void dump_test(test* test);

test_expect_output read_test_expect_output(FILE* fp, const char* line);
void dump_test_expect_output(test_expect_output* test);

int run_test(void);
int run_test_expect_output(void);
int run_test_signed_arith(void);
int run_test_expect_output_signed_arith(void);

void run_test_case(void);
int run_test_case_internal(void);

#define TEST_OPERATION(name, op, a, b) \
extern uint32_t name(uint32_t a, uint32_t b); \
test_expect_output name##_test_expect_output[2] = { \
	{ a, b, 0, 0, 0, 0, op }, \
	{ 0, 0, 0, 0, 0, 0, NULL } \
};

#define TEST_OPERATION_SIGNED(name, op, a, b) \
extern int32_t name##_signed_arith(int32_t a, int32_t b); \
test_expect_output name##_signed_arith_test_expect_output[2] = { \
	{ name##_signed_arith(a, b), 0, 0, 0, 0, 0, op }, \
	{ 0, 0, 0, 0, 0, 0, NULL } \
};

#define TEST_TESTCASE(name, a, b, op, c) \
extern uint32_t name(uint32_t a, uint32_t b, uint32_t c); \
test name##_test_case[2] = { \
	{ a, b, c, 0, 0, 0, op }, \
	{ 0, 0, 0, 0, 0, 0, NULL } \
};

#define TEST_EXPECT_OUTPUT(name, a, b, op, c) \
extern uint32_t name(uint32_t a, uint32_t b, uint32_t c); \
test_expect_output name##_expect_output_