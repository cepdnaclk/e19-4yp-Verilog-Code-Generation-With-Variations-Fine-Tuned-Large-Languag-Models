module example7_5(x1, x2, x3, Clock, f, g);
input x1, x2, x3, Clock;
output f, g;
reg f, g;
integer i;
always @(posedge Clock)
begin
case (i)
0: begin
    f = x1;
end
1: begin
    f = x2;
end
2: begin
    f = x3;
end
default: begin
    f = 0;
end
endcase
g = f | x3;
end
endmodule
### Sample Circuit:
<img width="805" alt="Screen Shot 2021-07-25 at 10 06 19 am" src="https://user-images.githubusercontent.com/33456128/126874115-3187f92c-9f6d-417f-a736-e8482837d498.png">
### Simulation Results:
<img width="1386" alt="Screen Shot 2021-07-25 at 10 11 25 am" src="https://user-images.githubusercontent.com/33456128/126874124-336b626d-4e28-4c0d-b06c-1b2bc81b7735.png">
/example6-2.rst
.. code-block:: verilog

   module example6_2(x1, x2, x3, x4, Clock, f, g, h);
   input x1, x2, x3, x4, Clock;
   output f, g, h;
   reg f, g, h;
   integer i;
   always @(posedge Clock)
   begin
   case (i)
   0: begin
       f = x1;
   end
   1: begin
       f = x2;
   end
   2: begin
       f = x3;
   end
   3: begin
       f = x4;
   end
   default: begin
       f = 0;
   end
endcase
g = ~f;
h = x3 | x4;
end
endmodule

.. code-block:: verilog

   module example6_2(x1, x2, x3, x4, Clock, f, g, h);
   input x1, x2, x3, x4, Clock;
   output f, g, h;
   reg f, g, h;
   integer i;
   always @(posedge Clock)
   begin
   case (i)
   0: begin
       f = x1;
   end
   1: begin
       f = x2;
   end
   2: begin
       f = x3;
   end
   3: begin
       f = x4;
   end
   default: begin
       f = 0;
   end
endcase
g = ~f;
h = x3 | x4;
end
endmodule

.. code-block:: verilog

   module example6_2(x1, x2, x3, x4, Clock, f, g, h);
   input x1, x2, x3, x4, Clock;
   output f, g, h;
   reg f, g, h;
   integer i;
   always @(posedge Clock)
   begin
   case (i)
   0: begin
       f = x1;
   end
   1: begin
       f = x2;
   end
   2: begin
       f = x3;
   end
   3: begin
       f = x4;
   end
   default: begin
       f = 0;
   end
endcase
g = ~f;
h = x3 | x4;
end
endmodule

.. code-block:: verilog

   module example6_2(x1, x2, x3, x4, Clock, f, g, h);
   input x1, x2, x3, x4, Clock;
   output f, g, h;
   reg f, g, h;
   integer i;
   always @(posedge Clock)
   begin
   case (i)
   0: begin
       f = x1;
   end
   1: begin
       f = x2;
   end
   2: begin
       f = x3;
   end
   3: begin
       f = x4;
   end
   default: begin
       f = 0;
   end
endcase
g = ~f;
h = x3 | x4;
end
endmodule

.. code-block:: verilog

   module example6_2(x1, x2, x3, x4, Clock, f, g, h);
   input x1, x2, x3, x4, Clock;
   output f, g, h;
   reg f, g, h;
   integer i;
   always @(posedge Clock)
   begin
   case (i)
   0: begin
       f = x1;
   end
   1: begin
       f = x2;
   end
   2: begin
       f = x3;
   end
   3: begin
       f = x4;
   end
   default: begin
       f = 0;
   end
endcase
g = ~f;
h = x3 | x4;
end
endmodule

.. code-block:: verilog

   module example6_2(x1, x2, x3, x4, Clock, f, g, h);
   input x1, x2, x3, x4, Clock;
   output f, g, h;
   reg f, g, h;
   integer i;
   always @(posedge Clock)
   begin
   case (i)
   0: begin
       f = x1;
   end
   1: begin
       f = x2;
   end
   2: begin
       f = x3;
   end
   3: begin
       f = x4;
   end
   default: begin
       f = 0;
   end
endcase
g = ~f;
h = x3 | x4;
end
endmodule

.. code-block:: verilog

   module example6_2(x1, x2, x3, x4, Clock, f, g, h);
   input x1, x2, x3, x4, Clock;
   output f, g, h;
   reg f, g, h;
   integer i;
   always @(posedge Clock)
   begin
   case (i)
   0: begin
       f = x1;
   end
   1: begin
       f = x2;
   end
   2: begin
       f = x3;
   end
   3: begin
       f = x4;
   end
   default: begin
       f = 0;
   end
endcase
g = ~f;
h = x3 | x4;
end
endmodule

.. code-block:: verilog

   module example6_2(x1, x2, x3, x4, Clock, f, g, h);
   input x1, x2, x3, x4, Clock;
   output f, g, h;
   reg f, g, h;
   integer i;
   always @(posedge Clock)
   begin
   case (i)
   0: begin
       f = x1;
   end
   1: begin
       f = x2;
   end
   2: begin
       f = x3;
   end
   3: begin
       f = x4;
   end
   default: begin
       f = 0;
   end
endcase
g = ~f;
h = x3 | x4;
end
endmodule

.. code-block:: verilog

   module example6_2(x1, x2, x3, x4, Clock, f, g, h);
   input x1, x2, x3, x4, Clock;
   output f, g, h;
   reg f, g, h;
   integer i;
   always @(posedge Clock)
   begin
   case (i)
   0: begin
       f = x1;
   end
   1: begin
       f = x2;
   end
   2: begin
       f = x3;
   end
   3: begin
       f = x4;
   end
   default: begin
       f = 0;
   end
endcase
g = ~f;
h = x3 | x4;
end
endmodule

.. code-block:: verilog

   module example6_2(x1, x2, x3, x4, Clock, f, g, h);
   input x1, x2, x3, x4, Clock;
   output f, g, h;
   reg f, g, h;
   integer i;
   always @(posedge Clock)
   begin
   case (i)
   0: begin
       f = x1;
   end
   1: begin
       f = x2;
   end
   2: begin
       f = x3;
   end
   3: begin
       f = x4;
   end
   default: begin
       f = 0;
   end
endcase
g = ~f;
h = x3 | x4;
end
end