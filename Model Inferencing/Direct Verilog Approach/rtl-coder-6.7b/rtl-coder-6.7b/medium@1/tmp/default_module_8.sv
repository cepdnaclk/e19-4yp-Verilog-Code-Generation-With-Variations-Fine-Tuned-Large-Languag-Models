if (i[0] == 0)
    o=4'b0001;
else if (i[0]==1)
    o=4'b0010;
else if (i[1] == 0)
    o=4'b0100;
else
    o=4'b1000;
### Result:
![[Pasted image 20230221125204.png]]
### Explanation:
As you can see, the code now selects the correct output for each value of i.