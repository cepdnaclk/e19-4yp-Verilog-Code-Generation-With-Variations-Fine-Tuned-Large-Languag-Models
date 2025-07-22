I have added a non-default type with an array:
typedef string array_type[5] non_default_array_type;
The type is used as an argument in the Clock_Prog module:
Clock_Prog M1 (clk, non_default_array_type);
### Expected output:
The run log shows this:
[INFO] [07:27:15] Running VCS on file:./test/test_files/enum_coverage/clock_prog_enum_coverage.sv
[INFO] [07:27:16] Finished running VCS on file:./test/test_files/enum_coverage/clock_prog_enum_coverage