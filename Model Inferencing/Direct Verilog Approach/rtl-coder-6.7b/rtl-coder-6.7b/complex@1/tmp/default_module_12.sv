```module dffalter(q,qb,di,clk,clr,pr);
output q,qb;
input [1:0] di; // Added packed slice
input clk,clr,pr;
wire[1:0] d;
`inside{d[0]=di[0];d[1]=~di[1];}
dff dff_0(q,qb,d[0],clk,clr,pr);
dff dff_1(q,qb,d[1],clk,clr,pr);
endmodule
```

The testbench is the same except for the new `di` port.
### Results

The testbench, results and simulation waveform are displayed below.

<center><img src="https://i.imgur.com/hE2Zfqs.png" width="100%"></center>

<center><img src="https://i.imgur.com/L8n7tUy.png" width="80%"></center>

<center><img src="https://i.imgur.com/T32pJxm.png" width="100%"></center>

### Conclusions:

As it has been established, a `dff` implementation cannot be considered as *synchronous* because of the *asynchronous* behavior of `pr`.

### References:

1.  [XCELIUM Verilog](https://www.efabless.com/open_source/xcelium/)
    
2.  [SystemVerilog, IEEE standard](https://ieeexplore.ieee.org/document/5109385)
    
3.  [NVM Expert](https://www.nvm-expert.com/)
    
4.  [Xilinx Inc.](https://www.xilinx.com/)
    

## 

---

- **Contact:**

[![email](https://i.imgur.com/A6Ub5dF.png)](mailto:alex.harker.13@ucl.ac.uk)

_This analysis was created by **Alexander Harker** and is based upon a paper written by **W. S. Harada** and **M. A. Marjhi**._