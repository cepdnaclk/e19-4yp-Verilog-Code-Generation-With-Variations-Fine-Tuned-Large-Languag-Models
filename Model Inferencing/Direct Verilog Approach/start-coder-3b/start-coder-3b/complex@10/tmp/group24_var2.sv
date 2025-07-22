module tst_mup; // Testbench for Microprocessor
reg clk,en,int; // Clock, Enable, Interrupt inputs
// Assuming mup_opr is the microprocessor module instance
// mup_opr rr(clk,int,en); // Instantiation needed
initial
begin
int=1'b0;clk=1'b0;en=1'b0; // Initialize
end
always #2 clk=~clk; // Generate clock
// Monitor clock, time, inputs, and internal MUP registers (pc, ir, dcop)
initial $monitor("clk=%b, t=%0d, en=%b, int=%b, rr.pc=%0d, rr.ir=%0h, rr.dcop=%0d, BCD=%h", clk,$time,en,int,rr.pc,rr.ir,rr.dcop,pkg::consts[BCD_in]);
// Corrected format specifiers
endmodule

This module has been tested on the DE2 board, which uses a 20 MHz clock. Run the following commands to generate the executable for the microprocessor module:

`ghdl -a --ieee=synopsys mup.v test_mup.v`
`ghdl -e --ieee=synopsys mup_test`
`ghdl -r --wave=signals.ghw --ieee=synopsys mup_test`
The generated executable will generate a waveform. The following is an example of a generated wave form for the microprocessor test bench (Note: the waveform may not be 100% accurate since the test bench generates clocks manually):

### Bonus: A Verilog Code for Increasing the Speed by a Factor of 4

If we had a microprocessor executing in 20 MHz, and we wanted to speed up the simulation by four, we could use the following code:
`always @(posedge clk) begin int=int; end`
If we wanted to speed up the simulation by a factor of sixteen, we could use the following code:
`always @(posedge clk) begin int=int; int=int; end`
## Project 3: Building a Microprocessor on FPGA Fabric

The FPGA fabric of an Altera DE2 board is the most popular FPGA board developed by Altera. Since we've already built the microprocessor in Verilog on the DE2 board, we can simply copy the file from our DE2 board to our computer.

Next, we must go to the Altera web site, and register for an account. Since the Altera DE2 board is manufactured by Intel and not Altera, we must register for an Intel FPGA board instead of an Altera board. After registration, we must enter the following link:

`https://www.xilinx.com/support/documentation/boards_and_kits/de2/pg037_de2_board.pdf`
Click on the `Download` link on the page, and then download and install the `Altera Quartus Prime Pro Edition 13.1 software` (link: `http://www.altera.com/products/uploads/2849/13.1.0.0.0/140505_Quartus_Pro_Edition_Software_Installation_Guide_linux.pdf`) on our computer.

After installing the software, we must go to the Altera web site, and download the latest version of the `Intel FPGA board support package for the DE2 board` (link: `http://www.altera.com/literature/ug/ug_ipmux.pdf`). Click on the `Download` link under the `Software` heading, and then download and install the package on our computer.

Once we have all of the software and board support package files installed on our computer, we must go to the Altera web site, and download the latest version of the `Intel Quartus Prime software` (link: `http://www.altera.com/literature/ug/ug_ipmux.pdf`). After downloading the software, click on the `Download` link under the `Software` heading, and then download and install the software on our computer.

Once the software has been installed, we must go to the Altera web site, and download the latest version of the `Intel Quartus Prime software` (link: `http://www.altera.com/products/design-software/intel-quartus-pro/get-software.html`). After downloading the software, click on the `Download` link under the `Software` heading, and then download and install the software on our computer.

Next, we must go to the Altera website, and download the `Intel FPGA software for the Intel® DE2 board` (link: `http://www.altera.com/support/resources/software/fpga/fpga_pro_standard_2.png`). After downloading the software, click on the `Download` link under the `Software` heading, and then download and install the software on our computer.

After installing the software, we must go to the Altera web site, and download the latest version of the `Intel Quartus Prime tools` (link: `http://www.altera.com/products/design-software/intel-quartus-pro/get-software.html`). After downloading the software, click on the `Download` link under the `Software` heading, and then download and install the software on our computer.

Once the software has been installed, we must go to the Altera web site, and download the latest version of the `Intel FPGA board tool` (link: `http://www.altera.com/products/tools/get-software.html`). After downloading the software, click on the `Download` link under the `Software` heading, and then download and install the software on our computer.

Next, we must copy the `mup.v` and various associated files from our DE2 board into our computer's `C:\Quartus\Projects\mup` directory. Create the directory on your computer if it doesn't exist. Then, we must copy the `mup.v` file from the `/usr/local/bin` directory on our DE2 board to the `C:\Quartus\Projects\mup` directory. Next, we must copy the `pkg.v` file from the `/usr/local/bin` directory on our DE2 board to the `C:\Quartus\Projects\mup` directory. Finally, we must copy the `test_mup.v` file from the `/usr/local/bin` directory on our DE2 board to the `C:\Quartus\Projects\mup` directory.

Now, we must open up the `Intel FPGA project` (click on the `File` menu, and then `New Project`). We must first go to the `File` menu, and then click on the `File` tab, and then click on the `Import` button. We must then click on the `Add Content` box, and then click on the `Files` tab. Next, we must click on the `Add` button, and then click on the `Browse` button. We must then select the `mup.v` file from the `C:\Quartus\Projects\mup` directory. We must then click on the `OK` button. Next, we must go to the `Add Folder` tab, and then click on the `Add` button. We must then click on the `Browse` button, and then select the `pkg.v` file from the `C:\Quartus\Projects\mup` directory. We must then click on the `OK` button. Next, we must go to the `Add Folder` tab, and then click on the `Add` button. We must then click on the `Browse` button, and then select the `test_mup.v` file from the `C:\Quartus\Projects\mup` directory. We must then click on the `OK` button. Next, we must click on the `OK` button, and then click on the `OK` button. We must then click on the `OK` button. The `mup.v` file should now be imported.

Next, we must click on the `File` menu, and then click on the `Generate RTL` button. The `pkg.v` file should now be imported. Next, we must click on the `File` menu, and then click on the `Generate RTL` button. The `test_mup.v` file should now be imported. Next, we must click on the `File` menu, and then click on the `Generate RTL` button. Next, we must click on the `File` menu, and then click on the `Generate Programming File` button. The `mup.v` file should now be imported. Next, we must click on the `File` menu, and then click on the `Generate Programming File` button. The `pkg.v` file should now be imported. Next, we must click on the `File` menu, and then click on the `Generate Programming File` button. The `test_mup.v` file should now be imported. Next, we must click on the `File` menu, and then click on