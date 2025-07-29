module dff_case(do,di,clk); // Behavioral D Flip-Flop with case Statement
output do;
input di,clk;
reg do; // Output must be reg for procedural assignment
initial
do=1'b0; // Initialize output
// Assign input 'di' to output 'do' on negative clock edge
always@(negedge clk) do = di; // Use non-blocking <= for sequential logic
case(i) // Case statement has input parameter i
0:do=1;
1:do=0;
2:do=1;
3:do=0;
default:do=1;
endcase // Use default value when no match
endmodule

#### To Compile:
> 
> *iverilog dff_case.v
>  vvvvvvvv
> 
> ### Execute the following two steps sequentially in the terminal window:
> 
> > *vvvvvvvv
> > 
> >     
> >     ```
> >     >./a.out
> >     
> >     ``` 
> > 
> ### See the following waveform:
> 
> > *vvvvvvvv
> > 
> >     ```
> >     > gtkwave dff_case.vcd
> >     
> >     ``` 
> > 

#### To Compile:
> 
> *iverilog dff_case_array.v
>  vvvvvvvv
> 
> ### Execute the following two steps sequentially in the terminal window:
> 
> > *vvvvvvvv
> > 
> >     
> >     ```
> >     >./a.out
> >     
> >     ``` 
> > 
> ### See the following waveform:
> 
> > *vvvvvvvv
> > 
> >     ```
> >     > gtkwave dff_case_array.vcd
> >     
> >     ``` 
> > 

#### To Compile:
> 
> *iverilog dff_case_array_indexed.v
>  vvvvvvvv
> 
> ### Execute the following two steps sequentially in the terminal window:
> 
> > *vvvvvvvv
> > 
> >     
> >     ```
> >     >./a.out
> >     
> >     ``` 
> > 
> ### See the following waveform:
> 
> > *vvvvvvvv
> > 
> >     ```
> >     > gtkwave dff_case_array_indexed.vcd
> >     
> >     ``` 
> > 

#### To Compile:
> 
> *iverilog dff_case_array_indexed_range.v
>  vvvvvvvv
> 
> ### Execute the following two steps sequentially in the terminal window:
> 
> > *vvvvvvvv
> > 
> >     
> >     ```
> >     >./a.out
> >     
> >     ``` 
> > 
> ### See the following waveform:
> 
> > *vvvvvvvv
> > 
> >     ```
> >     > gtkwave dff_case_array_indexed_range.vcd
> >     
> >     ``` 
> > 

#### To Compile:
> 
> *iverilog dff_case_array_indexed_range_list.v
>  vvvvvvvv
> 
> ### Execute the following two steps sequentially in the terminal window:
> 
> > *vvvvvvvv
> > 
> >     
> >     ```
> >     >./a.out
> >     
> >     ``` 
> > 
> ### See the following waveform:
> 
> > *vvvvvvvv
> > 
> >     ```
> >     > gtkwave dff_case_array_indexed_range_list.vcd
> >