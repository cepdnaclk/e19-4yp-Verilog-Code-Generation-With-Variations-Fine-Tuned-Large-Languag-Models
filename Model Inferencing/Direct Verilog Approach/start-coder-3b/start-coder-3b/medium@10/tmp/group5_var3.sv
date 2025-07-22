module test_k_new;
// Array of 4x4 MDA logic arrays
logic [3:0][63:0][3:0] MDA;
// Array of 4x4 MDA logic arrays
logic [3:0][63:0][3:0] MDA_new;
// Array of 4x4 MDA logic arrays
logic [3:0][63:0][3:0] MDA_new_new;

wire q, clock, j, k, preset, clear;
// Declare instance of test_k module
test_k_old inst(q, clock, j, k, preset, clear);
// Declare instance of test_k_new module
test_k_new_old inst_new(MDA[j][k][3], clock, MDA_new[j][k][3], preset, clear);

// Declare instance of test_k_new_new module
test_k_new_new_old inst_new_new(MDA_new[j][k][3], clock, MDA_new_new[j][k][3], preset, clear);

// Test if MDA is properly assigned
initial
begin
reset_ff;
j = 3;
k = 0;
assert(MDA[0][0][0] == 0);
assert(MDA[0][0][1] == 1);
assert(MDA[0][0][2] == 0);
assert(MDA[0][0][3] == 1);
assert(MDA[0][1][0] == 0);
assert(MDA[0][1][1] == 0);
assert(MDA[0][1][2] == 0);
assert(MDA[0][1][3] == 0);
assert(MDA[0][2][0] == 0);
assert(MDA[0][2][1] == 0);
assert(MDA[0][2][2] == 0);
assert(MDA[0][2][3] == 0);
assert(MDA[0][3][0] == 0);
assert(MDA[0][3][1] == 0);
assert(MDA[0][3][2] == 0);
assert(MDA[0][3][3] == 0);
assert(MDA[1][0][0] == 0);
assert(MDA[1][0][1] == 0);
assert(MDA[1][0][2] == 0);
assert(MDA[1][0][3] == 0);
assert(MDA[1][1][0] == 0);
assert(MDA[1][1][1] == 0);
assert(MDA[1][1][2] == 0);
assert(MDA[1][1][3] == 0);
assert(MDA[1][2][0] == 0);
assert(MDA[1][2][1] == 0);
assert(MDA[1][2][2] == 0);
assert(MDA[1][2][3] == 0);
assert(MDA[1][3][0] == 0);
assert(MDA[1][3][1] == 0);
assert(MDA[1][3][2] == 0);
assert(MDA[1][3][3] == 0);
assert(MDA[2][0][0] == 0);
assert(MDA[2][0][1] == 0);
assert(MDA[2][0][2] == 0);
assert(MDA[2][0][3] == 0);
assert(MDA[2][1][0] == 0);
assert(MDA[2][1][1] == 0);
assert(MDA[2][1][2] == 0);
assert(MDA[2][1][3] == 0);
assert(MDA[2][2][0] == 0);
assert(MDA[2][2][1] == 0);
assert(MDA[2][2][2] == 0);
assert(MDA[2][2][3] == 0);
assert(MDA[2][3][0] == 0);
assert(MDA[2][3][1] == 0);
assert(MDA[2][3][2] == 0);
assert(MDA[2][3][3] == 0);
assert(MDA[3][0][0] == 0);
assert(MDA[3][0][1] == 0);
assert(MDA[3][0][2] == 0);
assert(MDA[3][0][3] == 0);
assert(MDA[3][1][0] == 0);
assert(MDA[3][1][1] == 0);
assert(MDA[3][1][2] == 0);
assert(MDA[3][1][3] == 0);
assert(MDA[3][2][0] == 0);
assert(MDA[3][2][1] == 0);
assert(MDA[3][2][2] == 0);
assert(MDA[3][2][3] == 0);
assert(MDA[3][3][0] == 0);
assert(MDA[3][3][1] == 0);
assert(MDA[3][3][2] == 0);
assert(MDA[3][3][3] == 0);

// Test if MDA_new[3][1][3] is properly assigned
assert(MDA_new[3][1][3] == 0);
assert(MDA_new_new[3][1][3] == 0);

// Test if MDA[2][3][1] is properly assigned
assert(MDA[2][3][1] == 0);
assert(MDA_new[2][3][1] == 0);
assert(MDA_new_new[2][3][1] == 0);

// Test if MDA[1][1][0] is not assigned because k[4] is set to 0
assert(MDA[1][1][0] == 1);
assert(MDA_new[1][1][0] == 0);
assert(MDA_new_new[1][1][0] == 0);

// Test if MDA[1][1][1] is not assigned because both j[1] and k[4] are set to 1
assert(MDA[1][1][1] == 0);
assert(MDA_new[1][1][1] == 0);
assert(MDA_new_new[1][1][1] == 0);

// Test if MDA[1][1][2] is not assigned because both j[1] and k[4] are set to 1
assert(MDA[1][1][2] == 0);
assert(MDA_new[1][1][2] == 0);
assert(MDA_new_new[1][1][2] == 0);

// Test if MDA[1][1][3] is not assigned because both j[1] and k[4] are set to 1
assert(MDA[1][1][3] == 0);
assert(MDA_new[1][1][3] == 0);
assert(MDA_new_new[1][1][3] == 0);

// Test if MDA[0][0][1] is not assigned because k[4] is set to 0 and MDA[0][0][1] is assigned
assert(MDA[0][0][1] == 0);
assert(MDA_new[0][0][1] == 0);
assert(MDA_new_new[0][0][1] == 0);

// Test if MDA[0][0][2] is not assigned because k[4] is set to 0 and MDA[0][0][2] is assigned
assert(MDA[0][0][2] == 0);
assert(MDA_new[0][0][2] == 0);
assert(MDA_new_new[0][0][2] == 0);

// Test if MDA[0][0][3] is not assigned because k[4] is set to 0 and MDA[0][0][3] is assigned
assert(MDA[0][0][3] == 0);
assert(MDA_new[0][0][3] == 0);
assert(MDA