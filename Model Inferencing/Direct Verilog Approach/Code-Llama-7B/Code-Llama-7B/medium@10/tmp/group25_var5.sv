module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
integer x_array[10];
always @(posedge Clock) begin
    case(x1)
    x2: f = x_array[x2];
    x3: g = x3 & x_array[x3];
    default:;
    endcase
end
endmodule
### Requirement
The Verilog simulator that you are using or will use must support the $bits system task.
### Suggested Solution
Add $bits to the beginning of the array definition to display the contents. Verify that the bit position of the element is correct by changing the value of the dynamic variable index.
### Original Code
module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
integer x_array[10];
always @(posedge Clock) begin
    case(x1)
    x2: f = x_array[x2];
    x3: g = x3 & x_array[x3];
    default:;
    endcase
end
endmodule
### Suggested Solution
Add $bits to the beginning of the array definition to display the contents. Verify that the bit position of the element is correct by changing the value of the dynamic variable index.
### Suggested Solution
Add $bits to the beginning of the array definition to display the contents. Verify that the bit position of the element is correct by changing the value of the dynamic variable index.
### Original Code
module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
integer x_array[10];
always @(posedge Clock) begin
    case(x1)
    x2: f = x_array[x2];
    x3: g = x3 & x_array[x3];
    default:;
    endcase
end
endmodule
### Modified Code
module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
integer x_array[10];
always @(posedge Clock) begin
    case(x1)
    x2: f = x_array[x2];
    x3: g = x3 & x_array[x3];
    default:;
    endcase
end
endmodule
### Original Code
module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
integer x_array[10];
always @(posedge Clock) begin
    case(x1)
    x2: f = x_array[x2];
    x3: g = x3 & x_array[x3];
    default:;
    endcase
end
endmodule
### Modified Code
module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
integer x_array[10];
always @(posedge Clock) begin
    case(x1)
    x2: f = x_array[x2];
    x3: g = x3 & x_array[x3];
    default:;
    endcase
end
endmodule
### Original Code
module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
integer x_array[10];
always @(posedge Clock) begin
    case(x1)
    x2: f = x_array[x2];
    x3: g = x3 & x_array[x3];
    default:;
    end