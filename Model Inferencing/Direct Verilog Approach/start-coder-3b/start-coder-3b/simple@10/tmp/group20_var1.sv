module latch (input d, c, output reg q, q_b );
always begin
wait ( c );
end
endmodule

## 5. Testbench
The testbench performs the following tests:
* 256 sequential cycles of the circuit, with a data input of 000000000000000000000000000000000000000.
* 256 sequential cycles of the circuit, with a data input of 011111111111111111111111111111111111111.
* 256 sequential cycles of the circuit, with a data input of 100000000000000000000000000000000000000.
* 256 sequential cycles of the circuit, with a data input of 000000000000111111111111111111111111111.

The testbench also performs the following additional tests:
* 256 sequential cycles of the circuit, with a data input of all 1s and all 0s.
* 256 sequential cycles of the circuit, with a data input of all 1s.
* 256 sequential cycles of the circuit, with a data input of all 0s.
* 256 sequential cycles of the circuit with a data input of all 1s and all 0s, and with the clock pulse set to 000000000000000000000000000000000000000, and with only the clock pulse set to 000000000000000000000000000000000000000.
* 256 sequential cycles of the circuit with a data input of all 1s and all 0s, and with the clock pulse set to 000000000000000000000000000000000000000, and with only the clock pulse set to 000000000000000000000000000000000000000.
* 256 sequential cycles of the circuit with the clock pulse set to 000000000000000000000000000000000000000, and with only the clock pulse set to 000000000000000000000000000000000000000.
* 256 sequential cycles of the circuit with a data input of all 1s and all 0s, and with the clock pulse set to 000000000000000000000000000000000000000, and with only the clock pulse set to 000000000000000000000000000000000000000.
* 256 sequential cycles of the circuit with the clock pulse set to 000000000000000000000000000000000000000, and with only the clock pulse set to 000000000000000000000000000000000000000.

The testbench also performs the following extra tests of the circuit:
* 256 sequential cycles of the circuit where the data input is all 1s and clock pulse is all 1s, and where the data input is all 0s and clock pulse is all 0s.
* 256 sequential cycles of the circuit where the data input is all 1s and clock pulse is all 1s, and where the data input is all 1s and clock pulse is all 1s.
* 256 sequential cycles of the circuit with the data input of all 1s and clock pulse is all 1s and with the data input of all 0s and clock pulse is all 0s.
* 256 sequential cycles of the circuit with the data input of all 1s and clock pulse is all 1s and with the data input of all 1s and clock pulse is all 1s.

## 6. Results
In the following test, we have made a mistake in our testbench, which is the 3rd test. The expected output of the 3rd test should be 000000000000000000000000000000000000000. However, the current testbench is expecting the output 000000000001111111111111111111111111110.

![1](https://github.com/S180005/lab2/blob/master/lab2_image/1.PNG)

![2](https://github.com/S180005/lab2/blob/master/lab2_image/2.PNG)

![3](https://github.com/S180005/lab2/blob/master/lab2_image/3.PNG)

![4](https://github.com/S180005/lab2/blob/master/lab2_image/4.PNG)

![5](https://github.com/S180005/lab2/blob/master/lab2_image/5.PNG)

![6](https://github.com/S180005/lab2/blob/master/lab2_image/6.PNG)

![7](https://github.com/S180005/lab2/blob/master/lab2_image/7.PNG)

![8](https://github.com/S180005/lab2/blob/master/lab2_image/8.PNG)

![9](https://github.com/S180005/lab2/blob/master/lab2_image/9.PNG)

![10](https://github.com/S180005/lab2/blob/master/lab2_image/10.PNG)

![11](https://github.com/S180005/lab2/blob/master/lab2_image/11.PNG)