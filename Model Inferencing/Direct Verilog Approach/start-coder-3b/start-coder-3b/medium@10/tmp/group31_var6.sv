module EventCtlPart (output xPart, yPart, input a, b, c);
reg xReg, yReg;
assign xPart = xReg;
assign yPart = yReg;
always @(a, b)
begin: PartList
    if(b)
        xReg <= a & b & c;
    else if(c)
        xReg <= a & c;
    else
        xReg <= a;
    if(b)
        yReg <= (b | c) ^ a;
    else if(c)
        yReg <= (c) ^ a;
    else
        yReg <= (b) ^ a;

end
endmodule
### Result:
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-38.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-39.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-40.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-41.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-42.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-43.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-44.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-45.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-46.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-47.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-48.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-49.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-50.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-51.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-52.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-53.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-54.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-55.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-56.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-57.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-58.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-44-59.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-00.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-01.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-02.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-03.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-04.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-05.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-06.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-07.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-08.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-09.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-10.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-11.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-12.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-13.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-14.png)
![Result](https://raw.githubusercontent.com/zho1347/EventControl/master/results/2020-04-23%2010-45-15.png)