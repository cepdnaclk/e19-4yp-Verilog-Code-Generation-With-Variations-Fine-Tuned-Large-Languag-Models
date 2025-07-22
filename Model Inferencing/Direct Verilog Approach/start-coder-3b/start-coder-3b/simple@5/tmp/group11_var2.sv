module DataComponent (DataIn, DataOut, ControlSignals);
struct Data {
rand DataIn, DataOut;
};
typedef struct Data Data;
Data Data_Inst;
endmodule

**3.2.1.2**

**Original Code**

module ShiftComponent (Data, Out, Shift, ControlSignals);
input [7:0] Data;
output [7:0] Out;
input Shift;
input ControlSignals;
endmodule

**3.2.1.3**

**Original Code**

module BufferComponent (DataIn, DataOut, ControlSignals);
input DataIn;
output DataOut;
input ControlSignals;
endmodule

**3.2.1.4**

**Original Code**

module ALU (DataInA, DataInB, OperandA, OperandB, Result, ControlSignals);
input [7:0] DataInA;
input [7:0] DataInB;
input [4:0] OperandA;
input [4:0] OperandB;
output [7:0] Result;
input ControlSignals;
endmodule

**3.2.2**

**3.2.2.1**

**Original Verilog code**

module BufferComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
endmodule

**3.2.2.2**

**Original Verilog code**

module ShiftComponent (Data, Out, Shift, ControlSignals);
input [7:0] Data;
output [7:0] Out;
input Shift;
input ControlSignals;
endmodule

**3.2.2.3**

**Original Verilog code**

module AddComponent (DataInA, DataInB, OperandA, OperandB, Result, ControlSignals);
input [7:0] DataInA;
input [7:0] DataInB;
input [4:0] OperandA;
input [4:0] OperandB;
output [7:0] Result;
input ControlSignals;
endmodule

**3.2.2.4**

**Original Verilog code**

module ALU (DataInA, DataInB, OperandA, OperandB, Result, ControlSignals);
input [7:0] DataInA;
input [7:0] DataInB;
input [4:0] OperandA;
input [4:0] OperandB;
output [7:0] Result;
input ControlSignals;
endmodule

**3.2.3**

**3.2.3.1**

**Original Verilog code**

module ShiftComponent (Data, Out, Shift, ControlSignals);
input [7:0] Data;
output [7:0] Out;
input Shift;
input ControlSignals;
endmodule

**3.2.3.2**

**Original Verilog code**

module AddComponent (DataInA, DataInB, OperandA, OperandB, Result, ControlSignals);
input [7:0] DataInA;
input [7:0] DataInB;
input [4:0] OperandA;
input [4:0] OperandB;
output [7:0] Result;
input ControlSignals;
endmodule

**3.2.3.3**

**Original Verilog code**

module ALU (DataInA, DataInB, OperandA, OperandB, Result, ControlSignals);
input [7:0] DataInA;
input [7:0] DataInB;
input [4:0] OperandA;
input [4:0] OperandB;
output [7:0] Result;
input ControlSignals;
endmodule

**3.2.3.4**

**Original Verilog code**

module BufferComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
endmodule

**3.2.4**

**3.2.4.1**

**Original Verilog code**

module ShiftComponent (Data, Out, Shift, ControlSignals);
input [7:0] Data;
output [7:0] Out;
input Shift;
input ControlSignals;
endmodule

**3.2.4.2**

**Original Verilog code**

module AddComponent (DataInA, DataInB, OperandA, OperandB, Result, ControlSignals);
input [7:0] DataInA;
input [7:0] DataInB;
input [4:0] OperandA;
input [4:0] OperandB;
output [7:0] Result;
input ControlSignals;
endmodule

**3.2.4.3**

**Original Verilog code**

module BufferComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
endmodule

**3.2.4.4**

**Original Verilog code**

module ALU (DataInA, DataInB, OperandA, OperandB, Result, ControlSignals);
input [7:0] DataInA;
input [7:0] DataInB;
input [4:0] OperandA;
input [4:0] OperandB;
output [7:0] Result;
input ControlSignals;
endmodule

**3.2.5**

**3.2.5.1**

**Original Verilog code**

module AddComponent (DataInA, DataInB, OperandA, OperandB, Result, ControlSignals);
input [7:0] DataInA;
input [7:0] DataInB;
input [4:0] OperandA;
input [4:0] OperandB;
output [7:0] Result;
input ControlSignals;
endmodule

**3.2.5.2**

**Original Verilog code**

module ShiftComponent (Data, Out, Shift, ControlSignals);
input [7:0] Data;
output [7:0] Out;
input Shift;
input ControlSignals;
endmodule

**3.2.5.3**

**Original Verilog code**

module BufferComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
endmodule

**3.2.5.4**

**Original Verilog code**

module ALU (DataInA, DataInB, OperandA, OperandB, Result, ControlSignals);
input [7:0] DataInA;
input [7:0] DataInB;
input [4:0] OperandA;
input [4:0] OperandB;
output [7:0] Result;
input ControlSignals;
endmodule

**3.2.6**

**3.2.6.1**

**Original Verilog code**

module ShiftComponent (Data, Out, Shift, ControlSignals);
input [7:0] Data;
output [7:0] Out;
input Shift;
input ControlSignals;
endmodule

**3.2.6.2**

**Original Verilog code**

module BufferComponent (DataIn, DataOut, ControlSignals);
input [7:0] DataIn;
output [7:0] DataOut;
input ControlSignals;
endmodule

**3.2.6.3**

**Original Verilog code**

module AddComponent (DataInA, DataInB, OperandA, OperandB, Result, ControlSignals);
input [7:0] DataInA;
input [7:0] DataInB;
input [4:0] OperandA;
input [4:0] OperandB;
output [7:0] Result;
input ControlSignals;
endmodule

**3.2.6.4**

**Original Verilog code**

module ALU (DataInA, DataInB, OperandA, OperandB, Result, ControlSignals);
input [7:0] DataInA;
input [7:0] DataInB;
input [4:0] OperandA;
input [4:0] OperandB;
output [7:0] Result;
input ControlSignals;
endmodule

**3.3**

**3.3.1**

**3.3.1.1**

**Original Verilog code**

module ShiftComponent (Data,