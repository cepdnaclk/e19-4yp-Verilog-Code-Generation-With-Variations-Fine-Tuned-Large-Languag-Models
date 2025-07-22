module ha_8(s,ca,a,b); // Half Adder with specparam path delays
input a,b; output s,ca;
specify
specparam dl1 = 1; // Define specify parameter for s delay
specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
// Assign path delays using specparams
(a, b *> s) = dl1;
(a, b *> ca) = dl2;
endspecify
**`if (b)`**
xor (s,a,b);
and (ca,a,b);
**`else`**
xor (s,a,b);
and (ca,a,!b);
endmodule

# **Task 1 - 5**

In this task, we will create a new instance of a module and add it to the design in a new module `ha_8_x`, with a module-level parameter `x` that specifies the number of halfs adders to be combined with its instances. There is one problem with the previous module `ha_8`, as in case of a large number of instances, the number of XOR and AND modules will also become large. We can do this by decomposing the `ha_8` module into smaller modules in a way that the `ha_8_x` will be able to use the new modules instead of the original `ha_8` module.

**`ha_8_x` module:**

```
module ha_8_x(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  half_adder_1(s,ca,a,b);
endmodule
```

**`half_adder_1` module:**

```
module half_adder_1(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
```

**`half_adder_2` module:**

```
module half_adder_2(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
```

**`half_adder_3` module:**

```
module half_adder_3(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
```

**`half_adder_4` module:**

```
module half_adder_4(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
```

**`half_adder_5` module:**

```
module half_adder_5(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
```

**`half_adder_6` module:**

```
module half_adder_6(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
```

**`half_adder_7` module:**

```
module half_adder_7(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
```

**`half_adder_8` module:**

```
module half_adder_8(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  xor (s,a,b);
  and (ca,a,b);
endmodule
```

**`ha_8_x` module:**

```
module ha_8_x(s,ca,a,b); // Half Adder with specparam path delays
  input a,b; output s,ca;
  specify
    specparam dl1 = 1; // Define specify parameter for s delay
    specparam dl2 = dl1 + 1; // Define specify parameter for ca delay based on dl1
    // Assign path delays using specparams
    (a, b *> s) = dl1;
    (a, b *> ca) = dl2;
  endspecify
  
  wire [7:0] temp = {a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]} + {b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0]};
  localparam x = 8;
  for (genvar i = 0; i < x; i = i + 1) begin
    if (temp[i]) begin
      assign ${i} = half_adder_1(s,ca,a,b);
    end else begin
      assign ${i} = half_adder_2(s,ca,a,b);
    end
  end
endmodule
```

**`ha_8_x` instantiation:**

```
module top;
input [7:0] a;
input [7:0] b;
output [7:0] s;
output [7:0] ca;
assign s = ha_8_x(s,ca,a,b);
endmodule
```

![Screenshot 2021-03-19