module tst_dff_p_b();
  reg di,clk; wire do;
  dff_p d1(do,di,clk); // Instantiate the DFF
  initial begin
    if($time==0) // Test bench name & Clock initialization
      $display ("%m: Top-level testbench module");
    $monitor($time," clk=%b, di=%b, do=%b",clk,di,do);
  end
  always #3 clk=~clk; // Generate clock
  always #5 di=~di; // Toggle data
  always #2 di=di[7:7]; // Toggle data based on bit 7
endmodule
### Output:
![DFF_p_b_v_i_i_b_30](https://user-images.githubusercontent.com/80323921/110428228-90e04100-80c7-11eb-8377-1104508f6512.png)
/P1/P1A/S1/S1_a_v_i/S1_a_v_i_b.py
# S1_a_v_i_b
# To build a test bench for the DFF module with initialzation and with various inputs.
# To generate the verilog code for the DFF module in the S1_a_v_i_b.py file.

# Importing required packages to run the code in a Jupyter notebook.
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from IPython.display import Image, display

# Importing required packages to run the code in a IDE.
# import numpy as np
# import pandas as pd
# import matplotlib.pyplot as plt
# from IPython.display import Image, display

# Create a Function to create a DFF Module
def dff_p(clk,di,do):
  d1=di.copy() # Keep the initial value of di as di.copy() for clarity.
  for i in range(len(clk)): # Loop for the size of clk
    if clk[i]: # If a clk is high then
      d1[i]=di[i] # the next output do[i] will be the di[i] value.
    else: # If a clk is low then
      d1[i]=do[i] # the next output do[i] will be the do[i] value.
      if not(di[i]): # If di[i] is false then
        do[i]=do[i-1] # the next output do[i] will be the previous value of do[i-1]
  if di[-1]: # If di[-1] is true then
    d1[-1]=di[-1] # the next output do[-1] will be the di[-1] value.
  else: # If di[-1] is false then
    d1[-1]=do[-1] # the next output do[-1] will be the do[-1] value.
  do=np.array(d1) # Create a numpy array of do.
  print("Output of do:",do) # Print the output of do.
  print("Output of do and di:",d1) # Print the output of do and di.
  return do # Returns the do array.

# Create the initializations for di, clk and do.
di=np.array([0,1,0,1])
clk=np.array([0,0,1,0])
do=np.array([0,1,1,0])

# Create a list variable to store different combinations of di and clk inputs.
di_clk_combs = []

# Append the initializations to the list variable.
di_clk_combs.append(['0','0'_clk_combs[2]="00 01"
di_clk_combs[3]="00 10"
di_clk_combs[4]="00 11"
di_clk_combs[5]="01 00"
di_clk_combs[6]="01 01"
di_clk_combs[7]="01 10"
di_clk_combs[8]="01 11"
di_clk_combs[9]="10 00"
di_clk_combs[10]="10 01"
di_clk_combs[11]="10 10"
di_clk_combs[12]="10 11"
di_clk_combs[13]="11 00"
di_clk_combs[14]="11 01"
di_clk_combs[15]="11 10"
di_clk_combs[16]="11 11"

# Create an empty list variable to store the output of do.
do_list=[]

# Create a for loop with the length of di_clk_combs.
for i in range(len(di_clk_combs)):
  
  # Print the inputs obtained from the previous for loop.
  print("The inputs are:",di_clk_combs[i])
  
  # Use the previous function for the inputs.
  do=dff_p(int(di_clk_combs[i][0]),int(di_clk_combs[i][1]),do)
  
  # Append the output obtained from the previous function to the do_list.
  do_list.append(do)
  
# Print the do_list.
print("Output of do list:",do_list)

# Plot the output of do based on the inputs.
plt.plot(do_list)
plt.xlabel("Outputs of do")
plt.ylabel("Inputs of di (x axis) and clk (y axis)")
plt.title("DFF_p_b")
plt.legend(["DFF_p_b"],loc="best")
plt.show()
,'0','0'])
di_clk_combs.append(['0','1','0','1'])
di_clk_combs.append(['0','1','1','0'])
di_clk_combs.append(['0','1','1','1'])
di_clk_combs.append(['1','0','0','0'])
di_clk_combs.append(['1','0','0','1'])
di_clk_combs.append(['1','0','1','0'])
di_clk_combs.append(['1','0','1','1'])
di_clk_combs.append(['1','1','0','0'])
di_clk_combs.append(['1','1','0','1'])
di_clk_combs.append(['1','1','1','0'])
di_clk_combs.append(['1','1','1','1'])
di_clk_combs.append(['0','0','0','0'])
di_clk_combs.append(['0','0','0','1'])
di_clk_combs.append(['0','0','1','0'])
di_clk_combs.append(['0','0','1','1'])
di_clk_combs.append(['0','0','0','1'])
di_clk_combs.append(['0','0','1','0'])
di_clk_combs.append(['0','0','1','1'])
di_clk_combs.append(['0','0','0','1'])

# Print the inputs obtained by the previous for loop.
print("The inputs are:",di_clk_combs)

# Print the outputs of do based on the inputs in the above for loop.
print("The outputs are:",dff_p(di[0],di[1],do))
print("The outputs are:",dff_p(di[1],di[2],do))
print("The outputs are:",dff_p(di[2],di[3],do))

# Convert the do_list from lists to arrays as it is required for the plot.
do_list=np.array(do_list)

# Create a for loop with the size of do_list.
for i in range(len(do_list)):
  
  # Print the output of do_list in a tabular format.
  print("The outputs are:",do_list[i])

# Change the element of the list of lists to strings.
for i in range(len(di_clk_combs)):
  di_clk_combs[i] = ''.join(di_clk_combs[i])

# Print the inputs obtained by the previous for loop.
print("The inputs are:",di_clk_combs)

# Print the outputs of do based on the inputs in the above for loop.
print("The outputs are:",dff_p(int(di_clk_combs[0][0]),int(di_clk_combs[0][1]),do))
print("