module gade(a,a1,b,c,b1,c1);
input b,c,b1,c1;
output a,a1;
// Instantiate OR gate with inertial delay 3
or #3 gg1(a1,c1,b1);
// Instantiate AND gate with rise=2, fall=1 inertial delay
and #(2,1) gg2(a,c,b);
endmodule
### Test Case:
|Test Name|Test Type|Test ID|Test Level|Result|Description|
|---|---|---|---|---|---|
|Test 1|Single FSM|10051|System|Pass|Check whether the test can be run successfully.|
|Test 2|Single FSM|10052|System|Pass|Check whether the test can be run successfully.|
|Test 3|Single FSM|10053|System|Pass|Check whether the test can be run successfully.|
### Verification Information:
Version: Verilog Source Analyzer v1.0
Build Date: 12/31/2020 1:23:26 PM
### Simulation Information:
Simulator: Aldec Questa 11.1 Simulator
Simulator Setup:
- Top-Level Simulation Unit: gade
- Simulation Type: Behavioral
- Test Case: 10051
- Test Level: System
- Test Name: Test 1
- Script Name: \Gade_Unpacked_Nested_Struct_Test.scr
- Verilog Test Case: \Test_10051.v
- Top Module: gade
- Test Type: fsm
- Waveform Display:
- Simulation Run Time: 00:00:00.2290000
- Simulation Elapsed Time: 00:00:00.0000000
- Simulation Result: PASS
- Simulation Output Data File: \Test_10051.out
- Simulation Log File: \Test_10051.log
- Simulation Coverage Report: \Test_10051.cov
### System Information:
Version: Verilog Source Analyzer v1.0
Build Date: 12/31/2020 1:23:26 PM
### Summary:
#### Verilog Source File:
- File name: Gade_Unpacked_Nested_Struct_Test.v
- File revision number: 1
- File creation time: 06/11/2021 23:28:43
- File modification time: 06/11/2021 23:28:43
- Source file type: verilog
#### System Data:
- System number: 0
- System type: FPGA
- System manufacturer: Aldec
- System model: Questa
- System version: 11.1
- System status: Designed
#### System Design:
- System name: Gade_Unpacked_Nested_Struct_Test
- System description: Gade_Unpacked_Nested_Struct_Test
#### Simulation:
- Simulation type: Behavioral
- Simulation coverage type: None
- Simulation run time: 00:00:00.2290000
- Simulation elapsed time: 00:00:00.0000000
#### Test:
- Test case: 10051
#### Script:
- Script name: \Gade_Unpacked_Nested_Struct_Test.scr

#### Test type: fsm
- Test name: Test 1
- Test ID: 10051
- Test level: System

#### Test result: PASS
- Verification result: PASS
- Test error: None
- Test warning: None
- Test status: None
#### System coverage report:
- System coverage report: \Test_10051.cov
- System coverage type: None
- System simulation coverage:
- System simulation coverage percentage: 0%

#### Verilog source file:
- Source file: Gade_Unpacked_Nested_Struct_Test.v
- Source file content:
- 1 module gade(a,a1,b,c,b1,c1);
- 2 input b,c,b1,c1;
- 3 output a,a1;
- 4 // Instantiate OR gate with inertial delay 3
- 5 or #3 gg1(a1,c1,b1);
- 6 // Instantiate AND gate with rise=2, fall=1 inertial delay
- 7 and #(2,1) gg2(a,c,b);
- 8 endmodule
#### Verilog test case file:
- Verilog test case file name: \Test_10051.v
- Verilog test case content:
- 14 module gade(a,a1,b,c,b1,c1);
- 15 input b,c,b1,c1;
- 16 output a,a1;
- 17 // Instantiate OR gate with inertial delay 3
- 18 or #3 gg1(a1,c1,b1);
- 19 // Instantiate AND gate with rise=2, fall=1 inertial delay
- 20 and #(2,1) gg2(a,c,b);
- 21 endmodule
#### Verilog test log file:
- Test log file name: \Test_10051.log
- Test log file content:
- 1 Simulation Version 2020.2.1723
- 2 Simulation Started: 06-11-2021 23:28:43
- 3 Simulation End: 06-11-2021 23:28:43
- 4 Time: 1087.0220000000000000 ms
- 5 Test Results:
- 6   1 : PASS
- 7   2 : FAIL
- 8   3 : NA
- 9   4 : NA
- 10   5 : NA
- 11   6 : NA
- 12   7 : NA
- 13   8 : NA
- 14   9 : NA
- 15  10 : NA
- 16  11 : NA
- 17  12 : NA
- 18  13 : NA
- 19  14 : NA
- 20  15 : NA
- 21  16 : NA
- 22  17 : NA
- 23  18 : NA
- 24  19 : NA
- 25  20 : NA
- 26  21 : NA
- 27  22 : NA
- 28  23 : NA
- 29  24 : NA
- 30  25 : NA
- 31  26 : NA
- 32  27 : NA
- 33  28 : NA
- 34  29 : NA
- 35  30 : NA
- 36  31 : NA
- 37  32 : NA
- 38  33 : NA
- 39  34 : NA
- 40  35 : NA
- 41  36 : NA
- 42  37 : NA
- 43  38 : NA
- 44  39 : NA
- 45  40 : NA
- 46  41 : NA
- 47  42 : NA
- 48  43 : NA
- 49  44 : NA
- 50  45 : NA
- 51  46 : NA
- 52  47 : NA
- 53  48 : NA
- 54  49 : NA
- 55  50 : NA
- 56  51 : NA
- 57  52 : NA
- 58  53 : NA
- 59  54 : NA
- 60  55 : NA
- 61  56 : NA
- 62  57 : NA
- 63  58 : NA
- 64  59 : NA
- 65  60 : NA
- 66  61 : NA
- 67  62 : NA
- 68  63 : NA
- 69  64 : NA
- 70  65 : NA
- 71  66 : NA
- 72  67 : NA
- 73