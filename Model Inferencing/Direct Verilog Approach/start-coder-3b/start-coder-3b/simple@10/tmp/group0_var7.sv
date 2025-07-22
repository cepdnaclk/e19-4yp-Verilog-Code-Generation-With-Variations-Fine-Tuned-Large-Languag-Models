// Create a module with one input and one output that behaves like a wire
module wire_assign( input in, output bit out );
    assign out = in;
endmodule
### Test:
// Create a net of bit type with 1 bit, read it out
bit net_bit;
wire_assign #(.out(net_bit)) wire_mod(.in(1'b1));
### Test Result:
net_bit = 1'b1
/examples/examples/wiring/mux_2to1_2aout_2_var.c
// Name: Multiplexer 2:1 2A:2 Out 2 Var
// Description: This example shows how to make a 2:1 mux with 2 inputs and 2 outputs
//              and how to use the mux as a 2nd order variable
// Author: 
// Date: 7/1/2017

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// This defines a struct to hold all the 2nd order var information
typedef struct var_2nd
{
    const char* name;
    void* address;
    double value;
    double derivative;
    double integral;
    double error;
    double last_error;
    double out;
    double threshold_low;
    double threshold_high;
    // This is a pointer to a function that is called whenever the value of the var changes
    void(*callback1)(void);
    void(*callback2)(void);

} struct_2nd;

// Global variables
struct_2nd my_var1;
struct_2nd my_var2;
struct_2nd my_var3;
struct_2nd my_var4;


// This function gets called when the value of my_var1 changes
void var_change1()
{
    //printf("my_var1: %lf\n", my_var1.value);
}

// This function gets called when the value of my_var2 changes
void var_change2()
{
    //printf("my_var2: %lf\n", my_var2.value);
}


// This function gets called when the value of my_var3 changes
void var_change3()
{
    //printf("my_var3: %lf\n", my_var3.value);
}

// This function gets called when the value of my_var4 changes
void var_change4()
{
    //printf("my_var4: %lf\n", my_var4.value);
}



// This is the 2:1 mux module
void mux_2to1_2aout_2_var(double* a1, double* a2, double* out1, double* out2)
{
    double a = *a1;
    double b = *a2;
    *out1 = a;
    *out2 = b;
}

// Main function
int main()
{
    // Initialize the variables
    my_var1.address = &a1;
    my_var1.value = 100;
    my_var1.name = "a1";
    my_var1.callback1 = var_change1;

    my_var2.address = &a2;
    my_var2.value = 100;
    my_var2.name = "a2";
    my_var2.callback2 = var_change2;

    my_var3.address = &a3;
    my_var3.value = 100;
    my_var3.name = "a3";
    my_var3.callback3 = var_change3;

    my_var4.address = &a4;
    my_var4.value = 100;
    my_var4.name = "a4";
    my_var4.callback4 = var_change4;

    // Main loop
    while(1)
    {
        // Read in the values
        double a1 = *(double*)my_var1.address;
        double a2 = *(double*)my_var2.address;
        double a3 = *(double*)my_var3.address;
        double a4 = *(double*)my_var4.address;

        // Get out1 and out2 from the mux
        double out1;
        double out2;
        mux_2to1_2aout_2_var(&a1, &a2, &out1, &out2);

        // Output the values
        printf("a1: %lf\n", a1);
        printf("a2: %lf\n", a2);
        printf("a3: %lf\n", a3);
        printf("a4: %lf\n", a4);
        printf("out1: %lf\n", out1);
        printf("out2: %lf\n", out2);

        // Wait 1 second
        sleep(1);
    }
}
/examples/examples/wiring/mux_2to1_2bout_2_var.c
// Name: Multiplexer 2:1 2B:2 Out 2 Var
// Description: This example shows how to make a 2:1 mux with 2 inputs and 2 outputs
//              and how to use the mux as a 2nd order variable
// Author: 
// Date: 7/1/2017

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// This defines a struct to hold all the 2nd order var information
typedef struct var_2nd
{
    const char* name;
    void* address;
    double value;
    double derivative;
    double integral;
    double error;
    double last_error;
    double out;
    double threshold_low;
    double threshold_high;
    // This is a pointer to a function that is called whenever the value of the var changes
    void(*callback1)(void);
    void(*callback2)(void);

} struct_2nd;

// Global variables
struct_2nd my_var1;
struct_2nd my_var2;
struct_2nd my_var3;
struct_2nd my_var4;


// This function gets called when the value of my_var1 changes
void var_change1()
{
    //printf("my_var1: %lf\n", my_var1.value);
}

// This function gets called when the value of my_var2 changes
void var_change2()
{
    //printf("my_var2: %lf\n", my_var2.value);
}


// This function gets called when the value of my_var3 changes
void var_change3()
{
    //printf("my_var3: %lf\n", my_var3.value);
}

// This function gets called when the value of my_var4 changes
void var_change4()
{
    //printf("my_var4: %lf\n", my_var4.value);
}



// This is the 2:1 mux module
void mux_2to1_2bout_2_var(double* b1, double* b2, double* out1, double* out2)
{
    double b = *b1;
    double c = *b2;
    *out1 = b;
    *out2 = c;
}

// Main function
int main()
{
    // Initialize the variables
    my_var1.address = &b1;
    my_var1.value = 100;
    my_var1.name = "b1";
    my_var1.callback1 = var_change1;

    my_var2.address = &b2;
    my_var2.value = 100;
    my_var2.name = "b2";
    my_var2.callback2 = var_change2;

    my_var3.address = &b3;
    my_var3.value = 100;
    my_var3.name = "b3";
    my_var3.callback3 = var_change3;

    my_var4.address = &b4;
    my_var4.value = 100;
    my_var4.name = "b4";
    my_var4.callback4 = var_change4;

    // Main loop
    while(1)
    {