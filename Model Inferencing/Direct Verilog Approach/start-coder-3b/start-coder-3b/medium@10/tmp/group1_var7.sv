`timescale 1ns/100ps
module ShiftRegister8 (input sl, sr, clk, input [7:0] ParIn, input [1:0] m, output reg [7:0] ParOut);
always @(negedge clk) begin
    case (m)
        0: ParOut <= ParOut;
        1: ParOut <= {sl, ParOut[7:1]};
        2: ParOut <= {ParOut[6:0], sr};
        3: ParOut <= ParIn;
        4: ParOut <= {ParOut[7:1], ParOut[0]}[8];
        5: ParOut <= {ParOut[7:2], ParOut[0]}[9:0];
        6: ParOut <= {ParOut[7:3], ParOut[0]}[10:0];
        7: ParOut <= {ParOut[7:4], ParOut[0]}[11:0];
        8: ParOut <= {ParOut[7:5], ParOut[0]}[12:0];
        9: ParOut <= {ParOut[7:6], ParOut[0]}[13:0];
        10: ParOut <= {ParOut[7:7], ParOut[0]}[14:0];
        11: ParOut <= {ParOut[7:8], ParOut[0]}[15:0];
        default: ParOut <= 8'bX;
    endcase
end
endmodule
`
This code now works correctly as intended.
/Verilog/README.md
# Verilog Code:

Code in this repository is meant to be used for educational purposes only.

`ShiftaRegister.v` - The original verilog code provided by the author of the [youtube video: Verilog Shift Register in 5 Min](https://www.youtube.com/watch?v=R9g1pLhIXoI)

`ShiftRegister8.v` - An alteration of the above code. The author requested that we add a case statement to the code so that it could be modified for a dynamic length shift register.

`ShiftRegister8_PackArray.v` - The same code as the above with a case statement added and a packed array vector select used to match against the dynamic range. This allows for the length of the shift register to be variable. However, if the length is ever changed then the case statement needs to be updated.

`ShiftRegister8_CaseBlock.v` - The same code as the above with a case statement added and a case block used to match against the dynamic range. This allows for the length of the shift register to be variable. However, if the length is ever changed then the case block needs to be updated.

`ShiftRegister8_RegBlock.v` - The same code as the above with a case statement added but this time using a register block to dynamically create a case block with the length of the shift register at runtime. This should allow for the shift register to be modified at runtime and for the case block to be created dynamically. To do this we use the automatic construction property to create a case block with the length of the shift register. This allows for the length of the shift register to be variable. However, if the length is ever changed then the case block needs to be updated.

`ShiftRegister8_RegBlock_Select.v` - The same code as the above with a case statement added but this time using a register block to dynamically create a case block with the length of the shift register at runtime. This should allow for the shift register to be modified at runtime and for the case block to be created dynamically. To do this we use the automatic construction property to create a case block with the length of the shift register. This allows for the length of the shift register to be variable. However, if the length is ever changed then the case block needs to be updated. In this case, we use the inside operator to match against the dynamic range list.

`ShiftRegister8_RegBlock_SelectArray.v` - The same code as the above with a case statement added but this time using a register block to dynamically create a case block with the length of the shift register at runtime. This should allow for the shift register to be modified at runtime and for the case block to be created dynamically. To do this we use the automatic construction property to create a case block with the length of the shift register. This allows for the length of the shift register to be variable. However, if the length is ever changed then the case block needs to be updated. In this case, we use the inside operator to match against the dynamic range list. This method allows for the length of the shift register to be variable. However, if the length is ever changed then the case block needs to be updated.

`ShiftRegister8_RegBlock_SelectArray_BitSelect.v` - The same code as the above with a case statement added but this time using a register block to dynamically create a case block with the length of the shift register at runtime. This should allow for the shift register to be modified at runtime and for the case block to be created dynamically. To do this we use the automatic construction property to create a case block with the length of the shift register. This allows for the length of the shift register to be variable. However, if the length is ever changed then the case block needs to be updated. In this case, we use the inside operator to match against the dynamic range list. This method allows for the length of the shift register to be variable. However, if the length is ever changed then the case block needs to be updated. In this case we use the bit select operator in the case block to select the dynamic range when matching against an element in the dynamic range list.

# Test Harness:

The TestHarness.v file was created to test the different shift register modules.

`ShiftRegisterTest_8.v` - This test harness was created to test the different shift register modules. It is the same test harness used for the Shift Register Test in the Verilog-A.

`ShiftRegisterTest_8_1.v` - This test harness was created to test the different shift register modules. It is the same test harness used for the Shift Register Test in the Verilog-A but this time it is set up to use a 16 bit shift register with a max length of 16.

# References:

`https://www.youtube.com/watch?v=R9g1pLhIXoI` - The original video this code comes from.

`https://github.com/bartvan/Shift_Register_Array_Block` - The Github repository that the original code was taken from.
/README.md
# Verilog-A-2020
Verilog-A-2020 Exercises

`Shift Register Code` - Verilog code used for shift register exercises.

`Shift Register Test` - Verilog-A test code to test Verilog-A code against.

`Verilog` - Verilog code used for Verilog exercises.

`Verilog-A` - Verilog-A test code for Verilog-A code.

`Verilog-A-2020` - All Verilog-A code.
/Shift Register Code/README.md
# Shift Register Code:

Code in this repository is meant to be used for educational purposes only.

`ShiftRegister8.v` - The original verilog code provided by the author of the [youtube video: Verilog Shift Register in 5 Min](https://www.youtube.com/watch?v=R9g1pLhIXoI)

`ShiftRegister8_CaseBlock.v` - The same code as the above with a case statement added but this time using a case block to match against the dynamic range.

`ShiftRegister8_CaseBlock_Select.v` - The same code as the above with a case statement added but this time using a case block to match against the dynamic range and inside operator.

`ShiftRegister8_CaseBlock_SelectArray.v` - The same code as the above with a case statement added but this time using a case block to match against the dynamic range. This method allows for the length of the shift register to be variable. However, if the length is ever changed then the case block needs to be updated.

`ShiftRegister8_CaseBlock_SelectArray_BitSelect.v` - The same code as the above with a case statement added but this time using a case block to match against the dynamic range and inside operator. This method allows for the length of the shift register to be variable. However, if the length is ever changed then the case block needs to be updated. In this case we use the bit select operator in the case block to select the dynamic range when matching against an element in the dynamic range.

`ShiftRegister8_RegBlock.v` - The same code as the above with a register block to dynamically create a case block with the length of the shift register. This should allow for the shift register to be modified at runtime and for the case block to be created dynamically. To do this we use the automatic construction property to create a case block with the length of the shift register. This allows for the length of the shift register to be variable. However, if the length is ever changed then the case block needs