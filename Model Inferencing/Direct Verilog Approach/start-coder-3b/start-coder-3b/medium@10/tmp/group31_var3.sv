module EventCtrlPart(output xPart, yPart, input a, b, c);
begin:
    for(i=0; i < 8; i=i+2)
    begin: for(j=0; j < 8; j=j+2)
    begin:
        if(y==1) begin:
            xPart = xPart | yPart;
            yPart = yPart | xPart;
        end
        if(y==0) begin:
            xPart = xPart | yPart;
            yPart = yPart | xPart;
            xPart = xPart | yPart;
            yPart = yPart | xPart;
        end
        if(y==2) begin:
            xPart = xPart | yPart;
            yPart = yPart | xPart;
            xPart = xPart | yPart;
            yPart = yPart |