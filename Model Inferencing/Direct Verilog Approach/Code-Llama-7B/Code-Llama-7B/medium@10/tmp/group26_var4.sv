module example5(x1, x2, x3, f);
input x1, x2, x3;
output f;
reg f;
always @(x1 or x2 or x3)
    if (x2 == 1)
        f = x1;
    else 
        if ((x3[1] >= 0) && (x3[1] <= 1))
            f = x3;
endmodule
### Extracted Information:
### Extracted Instances:
| File Name | Instance Name | Module Name  |
|：--------:|:-------------:|:------------:|
| example5.v | example5 | example5 |
### Extracted Interfaces:
| Port Name | Interface Name |
|：--------:|:--------------:|
| x1 | example5_x1 |
| x2 | example5_x2 |
| x3 | example5_x3 |
### Extracted Objects:
| Object Name | Object Type | Port Name |
|：----------:|:-----------:|:--------:|
| x1 | INPUT | x1 |
| x2 | INPUT | x2 |
| x3 | INPUT | x3 |
| f | OUTPUT | f |
### Extracted Parameters:
| Parameter Name | Parameter Type | Parent |
|：-------------:|:--------------:|:------:|
| x1 | INPUT | x1 |
| x2 | INPUT | x2 |
| x3 | INPUT | x3 |
| f | OUTPUT | f |
### Extracted Ports:
| Port Name | Port Type | Parent |
|：-------:|:---------:|:------:|
| x1 | INPUT | x1 |
| x2 | INPUT | x2 |
| x3 | INPUT | x3 |
| f | OUTPUT | f |
### Extracted Syn