module example5(x1, x2, x3, x4, f, g, h);
input x1, x2, x3, x4;
output f, g, h;
assign g = (x1 & x3) | (x2 & x4);
assign h = (x1 | x3) & (x2 | x4);
assign f = g | h;

initial begin
	wait(c);
	f <= g | h;
end
endmodule
### Simulation Input:
- All X
- All X except f
- All X except g
- All X except f, g, and h
- All 1's
- All 1's except f
- All 1's except g
- All 1's except f, g, and h
### Simulation Output:
#### 1
![Image 1](Simulation1.png)

#### 2
![Image 2](Simulation2.png)

#### 3
![Image 3](Simulation3.png)

#### 4
![Image 4](Simulation4.png)

#### 5
![Image 5](Simulation5.png)

#### 6
![Image 6](Simulation6.png)

#### 7
![Image 7](Simulation7.png)

#### 8
![Image 8](Simulation8.png)

#### 9
![Image 9](Simulation9.png)

#### 10
![Image 10](Simulation10.png)

#### 11
![Image 11](Simulation11.png)

#### 12
![Image 12](Simulation12.png)

#### 13
![Image 13](Simulation13.png)

#### 14
![Image 14](Simulation14.png)


### Simulation 1: All X
![Image 1](Simulation1.png)
#### Observations:

##### When x1, x2, x3, and x4 are all X
###### Inputs and Outputs
- f is X (as per simulation code