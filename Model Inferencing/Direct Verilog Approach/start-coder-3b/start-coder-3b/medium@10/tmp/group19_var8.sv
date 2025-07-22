module counter (
    input wire clk, rst,
    output reg [3:0] count
);
initial
    reg [3:0] initial_count = 4'b0000;
always @(posedge clk or posedge rst) begin
    if (rst) count <= initial_count;
    else count <= count + 1;
end
endmodule
```

### C++ code

```cpp
// C++ code
// C++ code
#include <iostream>

using namespace std;

int main() {
    int count = 0;
    int initial_count = 0;

    cout << "Please enter the initial count value: ";
    cin >> initial_count;

    cout << "\nInitial value of the count is set to: " << initial_count << "\n";

    for (count = 0; count < initial_count; count++) {
        cout << "Count: " << count << endl;
    }

    return 0;
}
```

### Result

![C++ code output](img/005-output.png)

### Verilog code

```verilog
module counter (
    input wire clk, rst,
    output reg [3:0] count
);
initial
    reg [3:0] initial_count = 4'b0000;
always @(posedge clk or posedge rst) begin
    if (rst) count <= initial_count;
    else count <= count + 1;
end
endmodule
```

### Variation Instruction

Add a logic variable which will have the result of the array slice as the tested operand

### Modified code

```verilog
module counter (
    input wire clk, rst,
    output reg [3:0] count
);

logic result;

initial
    reg [3:0] initial_count = 4'b0000;
always @(posedge clk or posedge rst) begin
    if (rst) count <= initial_count;
    else count <= count + 1;
end

always @(posedge clk or posedge rst) begin
    if (rst) result <= 0;
    else result <= result | 1;
end
endmodule
```

### Verilog code

```verilog
module counter (
    input wire clk, rst,
    output reg [3:0] count
);

logic result;

initial
    reg [3:0] initial_count = 4'b0000;
always @(posedge clk or posedge rst) begin
    if (rst) count <= initial_count;
    else count <= count + 1;
end

always @(posedge clk or posedge rst) begin
    if (rst) result <= 0;
    else result <= result | 1;
end
endmodule
```

### Result

![Verilog code output](img/005-output-2.png)

# 6. Multiple array access with the same operand

### C++ code

```cpp
// C++ code
// C++ code
#include <iostream>

using namespace std;

int main() {
    int count = 0;
    int initial_count = 0;

    cout << "Please enter the initial count value: ";
    cin >> initial_count;

    cout << "\nInitial value of the count is set to: " << initial_count << "\n";

    for (count = 0; count < initial_count; count++) {
        cout << "Count: " << count << endl;
    }

    return 0;
}
```

### Result

![C++ code output](img/006-output.png)

### Verilog code

```verilog
module counter (
    input wire clk, rst,
    output reg [3:0] count
);
initial
    reg [3:0] initial_count = 4'b0000;
always @(posedge clk or posedge rst) begin
    if (rst) count <= initial_count;
    else count <= count + 1;
end
endmodule
```

### Variation Instruction

Add a logic variable which will have the result of the array slice as the tested operand

### Modified code

```verilog
module counter (
    input wire clk, rst,
    output reg [3:0] count
);

logic result;

initial
    reg [3:0] initial_count = 4'b0000;
always @(posedge clk or posedge rst) begin
    if (rst) count <= initial_count;
    else count <= count + 1;
end

always @(posedge clk or posedge rst) begin
    if (rst) result <= 0;
    else result <= result | 1;
end
endmodule
```

### Verilog code

```verilog
module counter (
    input wire clk, rst,
    output reg [3:0] count
);

logic result;

initial
    reg [3:0] initial_count = 4'b0000;
always @(posedge clk or posedge rst) begin
    if (rst) count <= initial_count;
    else count <= count + 1;
end

always @(posedge clk or posedge rst) begin
    if (rst) result <= 0;
    else result <= result | 1;
end
endmodule
```

### Result

![Verilog code output](img/006-output-2.png)

# 7. Multiple array access with different operands

### C++ code

```cpp
// C++ code
#include <iostream>

using namespace std;

int main() {
    int count = 0;
    int initial_count = 0;

    cout << "Please enter the initial count value: ";
    cin >> initial_count;

    cout << "\nInitial value of the count is set to: " << initial_count << "\n";

    for (count = 0; count < initial_count; count++) {
        cout << "Count: " << count << endl;
    }

    return 0;
}
```

### Result

![C++ code output](img/007-output.png)

### Verilog code

```verilog
module counter (
    input wire clk, rst,
    output reg [3:0] count
);
initial
    reg [3:0] initial_count = 4'b0000;
always @(posedge clk or posedge rst) begin
    if (rst) count <= initial_count;
    else count <= count + 1;
end
endmodule
```

### Variation Instruction

Add a logic variable which will have the result of the array slice as the tested operand

### Modified code

```verilog
module counter (
    input wire clk, rst,
    output reg [3:0] count
);

logic result;

initial
    reg [3:0] initial_count = 4'b0000;
always @(posedge clk or posedge rst) begin
    if (rst) count <= initial_count;
    else count <= count + 1;
end

always @(posedge clk or posedge rst) begin
    if (rst) result <= 0;
    else result <= result | 1;
end
endmodule
```

### Verilog code

```verilog
module counter (
    input wire clk, rst,
    output reg [3:0] count
);

logic result;

initial
    reg [3:0] initial_count = 4'b0000;
always @(posedge clk or posedge rst) begin
    if (rst) count <= initial_count;
    else count <= count + 1;
end

always @(posedge clk or posedge rst) begin
    if (rst) result <= 0;
    else result <= result | 1;
end
endmodule
```

### Result

![Verilog code output](img/007-output-2.png)

# 8. Arrays with two dimension

### C++ code

```cpp
// C++ code
#include <iostream>

using namespace std;

int main() {
    int count = 0;
    int initial_count = 0;
    int j = 0, k = 0;

    cout << "Please enter the initial count value: ";
    cin >> initial_count;

    cout << "\nInitial value of the count is set to: " << initial_count << "\n";

    for (count = 0; count < initial_count; count++) {
        cout << "Count: " << count << endl;
    }

    for (j = 0; j < initial_count; j++) {
        for (k = 0; k < initial_count; k++) {
            cout << k << " ";
        }
        cout << endl;
    }

    return 0;
}
```

### Result

![C++ code output](img/008-output.png)