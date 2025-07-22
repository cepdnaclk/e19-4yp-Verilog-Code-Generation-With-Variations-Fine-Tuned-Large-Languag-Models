initial begin: Apply_Data
#100;
clk = 0;
start = 0;
$info ("\n### Testing 100% memory array selection using a generate block inside an inside operator ###");
for (indx = 0; indx < $size(mem1); indx = indx + 1)
begin: Apply_Data_Generated_Block
im_data = mem1[indx];
$info ("\nTEST %03d: Multiplier inputs are %d and %d", indx + 1, opnd1, opnd2);
$info ("\nTEST %03d: Expected multiplier output is %d", indx + 1, expected_result);
#100;
clk = 1;
start = 1;
#10;
start = 0;
$info ("\nTEST %03d: Actual multiplier output is %d", indx + 1, multiplier_result);
end: Apply_Data_Generated_Block
end: Apply_Data
### Verification Results:
### Testing 100% memory array selection using a generate block inside an inside operator ###

TEST 001: Multiplier inputs are 5 and 3

TEST 001: Expected multiplier output is 15

TEST 001: Actual multiplier output is 15

TEST 002: Multiplier inputs are 3 and 7

TEST 002: Expected multiplier output is 21

TEST 002: Actual multiplier output is 21

TEST 003: Multiplier inputs are 4 and 3

TEST 003: Expected multiplier output is 12

TEST 003: Actual multiplier output is 12

### Testing 100% memory array selection using an inside operator ###

TEST 001: Multiplier inputs are 5 and 3

TEST 001: Expected multiplier output is 15

TEST 001: Actual multiplier output is 15

TEST 002: Multiplier inputs are 3 and 7

TEST 002: Expected multiplier output is 21

TEST 002: Actual multiplier output is 21

TEST 003: Multiplier inputs are 4 and 3

TEST 003: Expected multiplier output is 12

TEST 003: Actual multiplier output is 12