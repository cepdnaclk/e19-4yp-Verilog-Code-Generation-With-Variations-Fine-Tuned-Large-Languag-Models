module FourFlopsStructL2 #(parameter DClk = 2, DBuf = 1)
(output[3:0] Q, input[3:0] D, input Ena, Clk);
wire[3:0] QWire;
localparam DTot = DBuf + DClk;
DFF DReg[3:0] (.Q(QWire),.D(D),.Clk(Clk));
assign #DTot Q = (Ena==1'b1)? QWire : 'bz;
endmodule
### Verilog Code Before Modification:
`module Test_FourFlopsStructL2 #(parameter DClk = 2, DBuf = 1) (output[3:0] Q, input[3:0] D, input Ena, Clk);`
### Verilog Code After Modification:
`module Test_FourFlopsStructL2 #(parameter DClk = 2, DBuf = 1) (output[7:0] Q, input[7:0] D, input Ena, Clk);`
### Simulation Before Modification:
![Simulation Before Modification](https://github.com/Tian-Chen-Wei/TestCode/blob/master/SimExamples/Test_FourFlopsStructL2/Before.png)
### Simulation After Modification:
![Simulation After Modification](https://github.com/Tian-Chen-Wei/TestCode/blob/master/SimExamples/Test_FourFlopsStructL2/After.png)
### Explaination:
We can see from our Simulation that the modified code works as expected. The byte-type vector input works and the modified code is backward compatible.
g -m "Updating README.md"
git push
cp "SimExamples/$file" "SimExamples/Test_$file"
git add "SimExamples/Test_$file"
git commit -m "Add test files"
git push
/SimExamples/push.sh
#!/bin/bash


file=$1
git add README.md
git commit -m "Updating README.md"
git push
cp "$file" "SimExamples/Test_$file"
git add "SimExamples/Test_$file"
git commit -m "Add test files"
git push
cp "SimExamples/$file" "SimExamples/Test_$file"
git add "SimExamples/Test_$file"
git commit -m "Add test files"
git push
cp "SimExamples/$file" "SimExamples/Test_$file"
git add "SimExamples/Test_$file"
git commit -m "Add test files"
git push
cp "SimExamples/$file" "SimExamples/Test_$file"
git add "SimExamples/Test_$file"
git commit -m "Add test files"
git push
cp "SimExamples/$file" "SimExamples/Test_$file"
git add "SimExamples/Test_$file"
git commit -m "Add test files"
git push
cp "SimExamples/$file" "SimExamples/Test_$file"
git add "SimExamples/Test_$file"
git commit -m "Add test files"
git push
cp "SimExamples/$file" "SimExamples/Test_$file"
git add "SimExamples/Test_$file"
git commit -m "Add test files"
git push
cp "SimExamples/$file" "SimExamples/Test_$file"
git add "SimExamples/Test_$file"
git commit -m "Add test files"
git push
cp "SimExamples/$file" "SimExamples/Test_$file"
git add "SimExamples/Test_$file"
git commit -m "Add test files"
git push
cp "SimExamples/$file" "SimExamples/Test_$file"
git add "SimExamples/Test_$file"
git commit -m "Add test files"
git push
cp "SimExamples/$file" "SimExamples/Test_$file"
git add "SimExamples/Test_$file"
git commit -m "Add test files"
git push
cp "SimExamples/$file" "SimExamples/Test_$file"
git add "SimExamples/Test_$file"
git commit -m "Add test files"
git push
cp "SimExamples/$file" "SimExamples