module netdelay1(x,y);
input x;
output y;
wire #(2,1) nn[31:0]; // Declare wire 'nn' as a 32 bit wide packed structure.
not (nn,x); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
assign y=nn[31:0]; // Assign 'nn' to 'y' (direct assignment)
endmodule
#include <stdio.h>

#include "rtl_test.h"

int main(int argc, char *argv[])
{
	int rv = 0;

	rv = test_netdelay1();
	printf("Netdelay1 test result = %d\n", rv);

	rv = test_netdelay2();
	printf("Netdelay2 test result = %d\n", rv);

	rv = test_netdelay3();
	printf("Netdelay3 test result = %d\n", rv);

	rv = test_netdelay4();
	printf("Netdelay4 test result = %d\n", rv);

	rv = test_netdelay5();
	printf("Netdelay5 test result = %d\n", rv);

	rv = test_netdelay6();
	printf("Netdelay6 test result = %d\n", rv);

	rv = test_netdelay7();
	printf("Netdelay7 test result = %d\n", rv);

	rv = test_netdelay8();
	printf("Netdelay8 test result = %d\n", rv);

	rv = test_netdelay9();
	printf("Netdelay9 test result = %d\n", rv);

	rv = test_netdelay10();
	printf("Netdelay10 test result = %d\n", rv);

	rv = test_netdelay11();
	printf("Netdelay11 test result = %d\n", rv);

	rv = test_netdelay12();
	printf("Netdelay12 test result = %d\n", rv);

	return rv;
}
#include <stdint.h>

#include "rtl_test.h"

static void *alloc_mem(size_t size)
{
	void *ret = malloc(size);
	if (ret == NULL) {
		fprintf(stderr, "Memory allocation failed!\n");
		exit(1);
	}
	return ret;
}

static void free_mem(void *ptr, size_t size)
{
	free(ptr);
}

static void delay_unit_test(netdelay_t *rtl)
{
	int rv;
	int result;
	int expected_result;
	int i;
	uint8_t input[32];
	uint8_t output[32];

	rv = netdelay_init(rtl, 32);
	if (rv!= 0) {
		fprintf(stderr, "netdelay_init: %d\n", rv);
		exit(1);
	}

	for (i = 0; i < 32; i++) {
		input[i] = 1;
	}

	rv = netdelay_set_value(rtl, (uint8_t *)input);
	if (rv!= 0) {
		fprintf(stderr, "netdelay_set_value: %d\n", rv);
		exit(1);
	}

	for (i = 0; i < 32; i++) {
		expected_result = (i < 31)? 0 : 1;
		rv = netdelay_step(rtl);
		if (rv!= 0) {
			fprintf(stderr, "netdelay_step: %d\n", rv);
			exit(1);
		}
		rv = netdelay_get_value(rtl, (uint8_t *)output);
		if (rv!= 0) {
			fprintf(stderr, "netdelay_get_value: %d\n", rv);
			exit(1);
		}
		result = output[31];
		if (result!= expected_result) {
			fprintf(stderr, "Data: 0x%x (expected 0x%x)\n",
				result, expected_result);
			exit(1);
		}
	}
}

static void delay_unit_test_2(netdelay_t *rtl)
{
	int rv;
	int result;
	int expected_result;
	int i;
	uint8_t input[32];
	uint8_t output[32];

	rv = netdelay_init(rtl, 32);
	if (rv!= 0) {
		fprintf(stderr, "netdelay_init: %d\n", rv);
		exit(1);
	}

	for (i = 0; i < 32; i++) {
		input[i] = 1;
	}

	rv = netdelay_set_value(rtl, (uint8_t *)input);
	if (rv!= 0) {
		fprintf(stderr, "netdelay_set_value: %d\n", rv);
		exit(1);
	}

	for (i = 0; i < 32; i++) {
		expected_result = (i < 30)? 0 : 1;
		rv = netdelay_step(rtl);
		if (rv!= 0) {
			fprintf(stderr, "netdelay_step: %d\n", rv);
			exit(1);
		}
		rv = netdelay_get_value(rtl, (uint8_t *)output);
		if (rv!= 0) {
			fprintf(stderr, "netdelay_get_value: %d\n", rv);
			exit(1);
		}
		result = output[31];
		if (result!= expected_result) {
			fprintf(stderr, "Data: 0x%x (expected 0x%x)\n",
				result, expected_result);
			exit(1);
		}
	}
}

static void delay_unit_test_3(netdelay_t *rtl)
{
	int rv;
	int result;
	int expected_result;
	int i;
	uint8_t input[32];
	uint8_t output[32];

	rv = netdelay_init(rtl, 32);
	if (rv!= 0) {
		fprintf(stderr, "netdelay_init: %d\n", rv);
		exit(1);
	}

	for (i = 0; i < 32; i++) {
		input[i] = 1;
	}

	rv = netdelay_set_value(rtl, (uint8_t *)input);
	if (rv!= 0) {
		fprintf(stderr, "netdelay_set_value: %d\n", rv);
		exit(1);
	}

	for (i = 0; i < 32; i++) {
		expected_result = (i < 29)? 0 : 1;
		rv = netdelay_step(rtl);
		if (rv!= 0) {
			fprintf(stderr, "netdelay_step: %d\n", rv);
			exit(1);
		}
		rv = netdelay_get_value(rtl, (uint8_t *)output);
		if (rv!= 0) {
			fprintf(stderr, "netdelay_get_value: %d\n", rv);
			exit(1);
		}
		result = output[31];
		if (result!= expected_result) {
			fprintf(stderr, "Data: 0x%x (expected 0x%x)\n",
				result, expected_result);
			exit(1);
		}
	}
}

static void delay_unit_test_4(netdelay_t *rtl)
{
	int rv;
	int result;
	int expected_result;
	int i;
	uint8_t input[32];
	uint8_t output[32];

	rv = netdelay_init(rtl, 32);
	if (rv!= 0) {
		fprintf(stderr, "netdelay_init: %d\n", rv);
		exit(1);
	}

	for (i = 0; i < 32; i++) {
		input[i] = 1;
	}

	rv = netdelay_set_value(rtl, (uint8_t *)input);
	if (rv!= 0) {
		fprintf(stderr,