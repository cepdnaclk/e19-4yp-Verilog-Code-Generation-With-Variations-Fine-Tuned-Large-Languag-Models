module sw2led2 (
input wire [7:0] sw,
output wire [7:0] ld
) ;
assign ld = sw;
endmodule


assign {cout,s} = a - b;



### Results:

### Task 1:
##### Sw/Ld:
<img width="471" alt="sw2led" src="https://user-images.githubusercontent.com/81161401/218233323-f1f01007-7923-4966-877b-2d273c7ac014.png">

##### 4-bit ALU Instruction:
<img width="417" alt="4-bit alu" src="https://user-images.githubusercontent.com/81161401/218233344-10b0a9ac-8c0f-4e09-83ad-49649755706a.png">

##### 8-bit ALU Instruction:
<img width="475" alt="8-bit alu" src="https://user-images.githubusercontent.com/81161401/218233364-1d59b9b1-663b-4fdb-b13c-4fce22afb8d8.png">

##### 16-bit ALU Instruction:
<img width="494" alt="16-bit alu" src="https://user-images.githubusercontent.com/81161401/218233383-e01c2453-6218-494d-9367-e505135b2a8b.png">

##### Signed ALU Instruction:
<img width="524" alt="signed alu" src