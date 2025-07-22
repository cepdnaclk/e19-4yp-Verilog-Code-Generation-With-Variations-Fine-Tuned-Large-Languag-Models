```

## 3.14

| Original | Modification |
|:---------|:-------------|
| ### Base Verilog Code:  
module mealy(Clock, Resetn, w, z);  
input Clock, Resetn, w;  
output z;  
reg y, Y, z;  
parameter A = 0, B = 1;  
always @(w or y)  
    case (y)  
        A: if (w)  
            begin  
                z = 0;  
                Y = B;  
            end  
        else  
            begin  
                z = 0;  
                Y = A;  
            end  
        B: if (w)  
            begin  
                z = 1;  
                Y = B;  
            end  
        else  
            begin  
                z = 0;  
                Y = A;  
            end  
    endcase  
always @(negedge Resetn or posedge Clock)  
    if (Resetn == 0) y <= A;  
    else y <= Y;  
endmodule  
### Variation Instruction:  
Rewrite FSM state transition using `inside` with an array slice for `w`, placed inside an SV class.  
### Modified Code:  
```  
### Base Verilog Code:  
module mealy(Clock, Resetn, w, z);  
input Clock, Resetn, w;  
output z;  
reg y, Y, z;  
parameter A = 0, B = 1;  
always @(w or y)  
    case (y)  
        A: if (w)  
            begin  
                z = 0;  
                Y = B;  
            end  
        else  
            begin  
                z = 0;  
                Y = A;  
            end  
        B: if (w)  
            begin  
                z = 1;  
                Y = B;  
            end  
        else  
            begin  
                z = 0;  
                Y = A;  
            end  
    endcase  
always @(negedge Resetn or posedge Clock)  
    if (Resetn == 0) y <= A;  
    else y <= Y;  
endmodule  
### Variation Instruction:  
Rewrite FSM state transition using `inside` with an array slice for `w`, placed inside an SV class.  
### Modified Code:  
```

## 3.15

| Original | Modification |
|:---------|:-------------|
| ### Base Verilog Code:  
module mealy(Clock, Resetn, w, z);  
input Clock, Resetn, w;  
output z;  
reg y, Y, z;  
parameter A = 0, B = 1;  
always @(w or y)  
    case (y)  
        A: if (w)  
            begin  
                z = 0;  
                Y = B;  
            end  
        else  
            begin  
                z = 0;  
                Y = A;  
            end  
        B: if (w)  
            begin  
                z = 1;  
                Y = B;  
            end  
        else  
            begin  
                z = 0;  
                Y = A;  
            end  
    endcase  
always @(negedge Resetn or posedge Clock)  
    if (Resetn == 0) y <= A;  
    else y <= Y;  
endmodule  
### Variation Instruction:  
Rewrite FSM state transition using `inside` with an array slice for `w`, placed inside an SV class.  
### Modified Code:  
```  
### Base Verilog Code:  
module mealy(Clock, Resetn, w, z);  
input Clock, Resetn, w;  
output z;  
reg y, Y, z;  
parameter A = 0, B = 1;  
always @(w or y)  
    case (y)  
        A: if (w)  
            begin  
                z = 0;  
                Y = B;  
            end  
        else  
            begin  
                z = 0;  
                Y = A;  
            end  
        B: if (w)  
            begin  
                z = 1;  
                Y = B;  
            end  
        else  
            begin  
                z = 0;  
                Y = A;  
            end  
    endcase  
always @(negedge Resetn or posedge Clock)  
    if (Resetn == 0) y <= A;  
    else y <= Y;  
endmodule  
### Variation Instruction:  
Rewrite FSM state transition using `inside` with an array slice for `w`, placed inside an SV class.  
### Modified Code:  
```

## 3.16

| Original | Modification |
|:---------|:-------------|
| ### Base Verilog Code:  
module mealy(Clock, Resetn, w, z);  
input Clock, Resetn, w;  
output z;  
reg y, Y, z;  
parameter A = 0, B = 1;  
always @(w or y)  
    case (y)  
        A: if (w)  
            begin  
                z = 0;  
                Y = B;  
            end  
        else  
            begin  
                z = 0;  
                Y = A;  
            end  
        B: if (w)  
            begin  
                z = 1;  
                Y = B;  
            end  
        else  
            begin  
                z = 0;  
                Y = A;  
            end  
    endcase  
always @(negedge Resetn or posedge Clock)  
    if (Resetn == 0) y <= A;  
    else y <= Y;  
endmodule  
### Variation Instruction:  
Rewrite FSM state transition using `inside` with an array slice for `w`, placed inside an SV class.  
### Modified Code:  
```  
### Base Verilog Code:  
module mealy(Clock, Resetn, w, z);  
input Clock, Resetn, w;  
output z;  
reg y, Y, z;  
parameter A = 0, B = 1;  
always @(w or y)  
    case (y)  
        A: if (w)  
            begin  
                z = 0;  
                Y = B;  
            end  
        else  
            begin  
                z = 0;  
                Y = A;  
            end  
        B: if (w)  
            begin  
                z = 1;  
                Y = B;  
            end  
        else  
            begin  
                z = 0;  
                Y = A;  
            end  
    endcase  
always @(negedge Resetn or posedge Clock)  
    if (Resetn == 0) y <= A;  
    else y <= Y;  
endmodule  
### Variation Instruction:  
Rewrite FSM state transition using `inside` with an array slice for `w`, placed inside an SV class.  
### Modified Code:  
```

## 3.17

| Original | Modification |
|:---------|:-------------|
| ### Base Verilog Code:  
module mealy(Clock, Resetn, w, z);  
input Clock, Resetn, w;  
output z;  
reg y, Y, z;  
parameter A = 0, B = 1;  
always @(w or y)  
    case (y)  
        A: if (w)  
            begin  
                z = 0;  
                Y = B;  
            end  
        else  
            begin  
                z = 0;  
                Y = A;  
            end  
        B: if (w)  
            begin  
                z = 1;  
                Y = B;  
            end  
        else  
            begin  
                z = 0;  
                Y = A;  
            end  
    endcase  
always @(negedge Resetn or posedge Clock)  
    if (Resetn == 0) y <= A;  
    else y <= Y;  
endmodule  
### Variation Instruction:  
Rewrite FSM state transition using `inside` with an array slice for `w`, placed inside an SV class.  
### Modified Code:  
```  
### Base Verilog Code:  
module mealy(Clock, Resetn, w, z);  
input Clock, Resetn, w;  
output z;  
reg y, Y, z;  
parameter A = 0, B = 1;  
always @(w or y)  
    case (y)  
        A: if (w)  
            begin  
                z = 0;  
                Y = B;  
            end  
        else  
            begin  
                z = 0;  
                Y = A;  
            end