```verilog
module Johnson_Counter (count, enable, clock, reset);
output [3: 0] count;
input enable;
input clock, reset;
reg [3: 0] count;


generate
    genvar i;
    for (i=0;i<4;i=i+1) begin
        always @ (posedge clock, posedge reset)
            if (reset == 1) count[i] <= 0;
            else if (enable) begin
                if(i==0) begin
                    case (count)
                    // list of inputs
                    inside {[0:1],[3:4]}: count[i] <= 1;
                    inside {[2:3]}: count[i] <= 0;
                    default: count[i] <= 0;
                    endcase
                end
                else if(i==1) begin
                    case (count)
                    // list of inputs
                    inside {[1:2],[4:5]}: count[i] <= 1;
                    inside {[3:5]}: count[i] <= 0;
                    default: count[i] <= 0;
                    endcase
                end
               .
               .
                else if(i==4) begin
                    case (count)
                    // list of inputs
                    inside {[3:3],[7:7]}: count[i] <= 1;
                    inside {[5:6],[0:0]}: count[i] <= 0;
                    default: count[i] <= 0;
                    endcase
                end
            end
        end
    end
    else begin
        always @ (posedge clock, posedge reset)
            if (reset == 1) count[i] <= 0;
            else if (enable) begin
                case (count)
                // list of inputs
                inside {[3:3],[7:7]}: count[i] <= 1;
                inside {[5:6],[0:0]}: count[i] <= 0;
                default: count[i] <= 0;
                endcase
            end
        end
    end
endgenerate
endmodule
```

### Compilation Message:
 
```veril