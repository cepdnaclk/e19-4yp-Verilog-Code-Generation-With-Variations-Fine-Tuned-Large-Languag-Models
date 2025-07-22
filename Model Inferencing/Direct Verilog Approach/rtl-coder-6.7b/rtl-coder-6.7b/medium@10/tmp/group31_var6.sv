module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    if(a)
    begin: AList
        if(b)
        begin: BList
            if(c)
            begin: CList
                xReg <= 1;
            end
            else
            begin: DList
                xReg <= 0;
            end
        end
        else
        begin: EList
            xReg <= 0;
        end
    end
    else
    begin: FList
        xReg <= 0;
    end
    if(b | c)
    begin: GList
        yReg <= a;
    end
    else
    begin: HList
        yReg <= ~a;
    end
end
endmodule
### Results:
| Variable | Value |
| --- | --- |
| a | - |
| b | - |
| c | - |
| xPart | - |
| yPart | - |
### Counter Example:

| Variable | Value |
| --- | --- |
| a | 0 |
| b | 1 |
| c | 1 |
| xPart | 0 |
| yPart | 0 |
### Explanation:
The 3D array slice chosen by variables 'a', 'b' and 'c' is not correctly included in the branch. This fails the '1' for the 3D array slice and is thus assigned to '0' for both xPart and yPart.
### Test Case:

| Variable | Value |
| --- | --- |
| a | 1 |
| b | 1 |
| c | 1 |
| xPart | 1 |
| yPart | 0 |
### Counter Example:

| Variable | Value |
| --- | --- |
| a | 0 |
| b | 0 |
| c | 0 |
| xPart | 0 |
| yPart | 1 |
### Explanation:
The 3D array slice chosen by variables 'a', 'b' and 'c' is not correctly excluded