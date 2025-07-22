module ADC (output[7:0] Obus, input[7:0] Adr, input Clk);
reg[7:0] Storage[7:0];
reg[7:0] ObusReg;
assign #1 Obus = ObusReg;
always @(posedge Clk)
while(Adr<15)
    Storage[Adr] <= 4'b1010;
    Adr <= Adr+1;
end
always @(posedge Clk)
    ObusReg <= Storage[Adr];
endmodule





## Questions and Answers:
### Q1: How would you test the CPU?
- Testing the CPU would involve running a program on the CPU in order to verify the program operates correctly.
- This could be done by running a program on a simulator that will let the user input a value and produce an output.
- This can be done by using a debug monitor that can show the current state of the CPU to the user.
### Q2: What is a good test that shows the CPU is working?
- First, the test would need to have a program that would output a value.
- Then, the test would need to verify the program produced the right output.
- Once the program was verified, the test would need to show the CPU was working.
- This test can be done in a few ways.
- The simplest way to check if the CPU was working is to check if the value was displayed correctly.
- A more detailed way to check if the CPU was working would be to check the value displayed after the program was run.
### Q3: What is a good test that shows the CPU is not working?
- This test would involve setting the registers and memory to a known state.
- This test can then be used to show the CPU is not working correctly.
- After this test is done, the test would need to verify the CPU was not working correctly.
- If the CPU was working correctly, the test would need to show that the CPU was not working correctly.
### Q4: What is a good test that shows the CPU is not working due to the program?
- The test would involve the CPU being given the wrong program to run.
- Once this program is given, the test would need to verify that the program was not operating correctly.
- If the program was working correctly, the test would need to show that the program was not working correctly.
### Q5: What is a good test that shows the CPU is not working due to the OS?
- This test would involve the CPU being given the wrong program to run.
- Once this program is given, the test would need to verify that the program was not operating correctly.
- This program would need to be an OS program.
- Once the program is given, the test would need to verify the program was not working correctly.
- If the OS was working correctly, the test would need to show that the program was not working correctly.
### Q6: What is a good test that shows the CPU is not working due to the hardware?
- This test would involve the CPU being given the wrong program to run.
- Once this program is given, the test would need to verify that the program was not operating correctly.
- This program would need to be a hardware program.
- Once the program is given, the test would need to verify the program was not working correctly.
- If the hardware was working correctly, the test would need to show that the program was not working correctly.<?php
$name = $_POST['name'];
$email = $_POST['email'];
$message = $_POST['message'];

$text = "Hi, ". $name. "\n\n". $message;

mail("", "'s Portfolio", $text, "From: ". $email);

header('Location: index.php?status=thanks');
?>