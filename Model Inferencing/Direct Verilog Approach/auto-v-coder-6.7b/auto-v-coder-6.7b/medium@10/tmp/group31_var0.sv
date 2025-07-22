```verilog
module EventCtlPart (output xPart, yPart, input a, b, c);
    reg xReg, yReg;
    assign xPart = xReg;
    assign yPart = yReg;
    always @(a, b) begin: PartList
        integer i, j, k, l;
        integer A[10][10][10];
        for(i = 0; i<10; i=i+1) begin
            for(j = 0; j<10; j=j+1) begin
                for(k = 0; k<10; k=k+1) begin
                    A[i][j][k] = (i+j+k) % 2;
                end
            end
        end
        
        xReg <= a & b & A[a][b][(a+b)%10];
        yReg <= (b | c) ^ a;
    end
endmodule
```

In this code, a 3D array (A) is initialized with 10x10x10 elements. The array is filled with some random values for testing. The value of xReg is determined by the a AND b AND the result of A[a][b][(a+b)%10] (which is basically a test on each element of the array for inclusion). yReg value is determined by (b OR c) XOR a. This is a simple demonstration of nested if-else statements and usage of 3D array slices. Note that the indices of the array slice selected by the variable (a+b)%10 may need to be adjusted based on the values of a and b for the array to be valid. This is just an example, you may need to modify the indices according to the specific input values you are looking to test. 

Remember that Verilog is a fairly low-level language designed to run on FPGA logic cells, so it can't really handle everything you might want to do in a high-level language. This example might not even compile or behave as expected in a real-world system unless you have a specific input scenario in mind.

Also, always @(a, b) statement means that the always block will be triggered on changes to value of a and b