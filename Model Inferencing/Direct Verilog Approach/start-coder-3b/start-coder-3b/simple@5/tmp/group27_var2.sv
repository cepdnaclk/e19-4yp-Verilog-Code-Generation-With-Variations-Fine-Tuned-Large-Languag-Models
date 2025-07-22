module tstha_9();
  reg a,b,clk; 
  wire s,ca,clk_hi,clk_lo;
  ha_9 hh(s,ca,a,b); // Instantiate HA with rise/fall path delays
  initial begin a=0;b=0; end
  always #5 begin a=1;b=0; #5 a=0;b=1; #5 a=1;b=1; #5 a=0;b=0; end
  initial $monitor($time, " a = %b, b = %b,out carry = %b, outsum = %b ",a,b,ca,s);
  initial #30 $stop; // End simulation
endmodule
### Output:
```
0 [00000000] a = 0, b = 0, out carry = 0, outsum = 0 
1 [00000001] a = 1, b = 0, out carry = 0, outsum = 0 
2 [00000010] a = 0, b = 1, out carry = 0, outsum = 0 
3 [00000011] a = 1, b = 1, out carry = 1, outsum = 0 
4 [00000100] a = 0, b = 0, out carry = 0, outsum = 0 
5 [00000101] a = 1, b = 0, out carry = 0, outsum = 0 
a = 1, b = 1,out carry = 1, outsum = 0 
b = 0, out carry = 0, outsum = 0 
7 [00000111] a = 0, b = 0, out carry = 0, outsum = 0 
8 [00001000] a = 1, b = 0, out carry = 0, outsum = 0 
9 [00001001] a = 0, b = 1, out carry = 0, outsum = 0 
10 [00001010] a = 1, b = 1, out carry = 1, outsum = 0 
11 [00001011] a = 0, b = 0, out carry = 0, outsum = 0 
12 [00001100] a = 1, b = 0, out carry = 0, outsum = 0 
13 [00001101] a = 0, b = 1, out carry = 0, outsum = 0 
14 [00001110] a = 1, b = 1, out carry = 1, outsum = 0 
15 [00001111] a = 0, b = 0, out carry = 0, outsum = 0 
```
### Observations:
The simulation shows that the verilog code has been modified and now we have 2 wires that are used for the clock

Note: You can find the testbench file in the `src` folder.

Now your job is to create a structure with a packed structure

## Step 3: Create a data structure with a packed structure
Now the clock is inside the structure, we are ready to create the data structure.

In the testbench file, create a structure type called `tstStruct` with name `clk` of type `clk`

``` cpp
tstStruct : struct (
  clk : clk
);
```

Now in the testbench file, create a variable `structStruct` of type `tstStruct`. 
``` cpp
tstStruct structStruct;
```

## Step 4: Connect the structure to the design
In the testbench file, change the design call to be `tstStruct` instead of `tstStruct`.

``` cpp
module tstStruct(clk);
```

Now in the testbench file, create a variable `tstStruct` of type `tstStruct`.
``` cpp
tstStruct structStruct;
```

## Step 5: Populate the packed structure with data
We have to populate the packed structure by assigning a value to each of the items.

``` cpp
  structStruct.clk <= clk;
```

## Step 6: Verify the packed structure
In the testbench file, create a variable `pckStruct` of type `tstStruct`.

``` cpp
initial begin
tstStruct pckStruct = structStruct; // copy the struct to a packed structure
end
```

In the testbench file, create a monitor on the packed structure.

``` cpp
initial $monitor($time, " clk = %b, clk1 = %b", pckStruct.clk.clk_hi, pckStruct.clk.clk_lo);
```

Compile the code and run it

You should see results similar to this:
```
0 [00000000] clk = 0, clk1 = 1 
1 [00000001] clk = 1, clk1 = 0 
2 [00000010] clk = 0, clk1 = 1 
3 [00000011] clk = 1, clk1 = 0 
4 [00000100] clk = 0, clk1 = 1 
5 [00000101] clk = 1, clk1 = 0 
6 [00000110] clk = 0, clk1 = 1 
7 [00000111] clk = 1, clk1 = 0 
8 [00001000] clk = 0, clk1 = 1 
9 [00001001] clk = 1, clk1 = 0 
10 [00001010] clk = 0, clk1 = 1 
11 [00001011] clk = 1, clk1 = 0 
12 [00001100] clk = 0, clk1 = 1 
13 [00001101] clk = 1, clk1 = 0 
14 [00001110] clk = 0, clk1 = 1 
15 [00001111] clk = 1, clk1 = 0 
```

## Step 7: Add a new signal to the packed structure
In the testbench file, create `clk2` of type `clk` to add a new signal to the packed structure.

``` cpp
clk clk2;
```

In the testbench file, connect `clk2` to `clk` of `structStruct`

``` cpp
  structStruct.clk2 <= clk2;
```

In the testbench file, create a variable `pckStruct2` of type `tstStruct`.

``` cpp
initial begin
tstStruct pckStruct2 = structStruct; // copy the struct to a packed structure
end
```

In the testbench file, create a monitor on the packed structure.

``` cpp
initial $monitor($time, " clk = %b, clk1 = %b, clk2 = %b", pckStruct2.clk.clk_hi, pckStruct2.clk.clk_lo, pckStruct2.clk2);
```

Compile the code and run it

You should see results similar to this:
```
0 [00000000] clk = 0, clk1 = 1, clk2 = 0 
1 [00000001] clk = 1, clk1 = 0, clk2 = 1 
2 [00000010] clk = 0, clk1 = 1, clk2 = 0 
3 [00000011] clk = 1, clk1 = 0, clk2 = 1 
4 [00000100] clk = 0, clk1 = 1, clk2 = 0 
5 [00000101] clk = 1, clk1 = 0, clk2 = 1 
6 [00000110] clk = 0, clk1 = 1, clk2 = 0 
7 [00000111] clk = 1, clk1 = 0, clk2 = 1 
8 [00001000] clk = 0, clk1 = 1, clk2 = 0 
9 [00001001] clk = 1, clk1 = 0, clk2 = 1 
10 [00001