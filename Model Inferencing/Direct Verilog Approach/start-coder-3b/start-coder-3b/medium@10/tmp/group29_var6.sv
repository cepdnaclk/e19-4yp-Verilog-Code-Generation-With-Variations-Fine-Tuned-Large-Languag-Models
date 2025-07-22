---
```
module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q;
always @(posedge Clock)
    if (!Sel)
        Q <= D0;
    else
        Q <= D1;
endmodule
```

---
```
module muxdff(D0, D1, Sel, Clock, Q);
input D0, D1, Sel, Clock;
output Q;
reg Q[0..3];
always @(posedge Clock)
    if (!Sel)
        Q[0] <= D0;
    else
        Q[1] <= D1;
endmodule
```

---
```
package muxdff(D0, D1, Sel, Clock, Q);
import "std_logic_1164.v";

library ieee;

use ieee.std_logic_1164.all;

package body muxdff is

end package;
```


---
```
package muxdff(D0, D1, Sel, Clock, Q);
import "std_logic_1164.v";

library ieee;

use ieee.std_logic_1164.all;


end package;
```

---
```
package muxdff(D0, D1, Sel, Clock, Q);
import "std_logic_1164.v";

library ieee;

use ieee.std_logic_1164.all;

package body muxdff is

end package;
```
---
```
package muxdff(D0, D1, Sel, Clock, Q);
import "std_logic_1164.v";

library ieee;

use ieee.std_logic_1164.all;

package body muxdff is

end package;
```

---
```
package muxdff(D0, D1, Sel, Clock, Q);
import "std_logic_1164.v";

library ieee;

use ieee.std_logic_1164.all;

package body muxdff is

end package;
```

---
```
package muxdff(D0, D1, Sel, Clock, Q);
import "std_logic_1164.v";

library ieee;

use ieee.std_logic_1164.all;

package body muxdff is

end package;
```

---
```
package muxdff(D0, D1, Sel, Clock, Q);
import "std_logic_1164.v";

library ieee;

use ieee.std_logic_1164.all;

package body muxdff is

end package;
```

---
```
package muxdff(D0, D1, Sel, Clock, Q);
import "std_logic_1164.v";

library ieee;

use ieee.std_logic_1164.all;

package body muxdff is

end package;
```

---
```
package muxdff(D0, D1, Sel, Clock, Q);
import "std_logic_1164.v";

library ieee;

use ieee.std_logic_1164.all;

package body muxdff is

end package;
```

---
```
package muxdff(D0, D1, Sel, Clock, Q);
import "std_logic_1164.v";

library ieee;

use ieee.std_logic_1164.all;

package body muxdff is

end package;
```

---
```
package muxdff(D0, D1, Sel, Clock, Q);
import "std_logic_1164.v";

library ieee;

use ieee.std_logic_1164.all;

package body muxdff is

end package;
```

---
```
package muxdff(D0, D1, Sel, Clock, Q);
import "std_logic_1164.v";

library ieee;

use ieee.std_logic_1164.all;

package body muxdff is

end package;
```



import sys
import os
import random
import string
from shutil import copyfile

files_folder = sys.argv[1]
num_files = int(sys.argv[2])

def get_words():
    file = open("Dictionary.txt", "r")
    lines = file.readlines()
    words = []
    for line in lines:
        words.append(line.strip())
    return words

def get_verilog_file(words, lines, start):
    if start > len(lines):
        return "Done"
    elif len(words) > 0:
        if start == len(lines):
            return "Done"
        else:
            line = lines[start]
            start += 1
            if "==" not in line:
                return get_verilog_file(words, lines, start)
            else:
                rand_word = words.pop(0)
                copyfile("Module.v", "verilog_files/" + rand_word + ".v")
                new_file = open(rand_word + ".v", "r+")
                new_file.write("module " + rand_word + "(")
                for word in line.split("=="):
                    new_file.write(word + ", ")
                new_file.seek(-2, os.SEEK_END)
                new_file.truncate()
                new_file.write(");\n")
                for word in line.split("=="):
                    new_file.write("input " + word + ";\n")
                new_file.write("output Q;\n")
                new_file.write("reg Q;\n")
                new_file.write("always @(*)\n")
                new_file.write("begin\n")
                new_file.write("Q <= " + line[0:len(line)-2] + ";\n")
                new_file.write("end\n")
                new_file.write("endmodule\n")
                new_file.close()
                return get_verilog_file(words, lines, start)
    else:
        return get_verilog_file(words, lines, start)


words = get_words()
lines = []
for file in os.listdir(files_folder):
    if file.endswith(".txt") and file[0].isdigit():
        file = open(files_folder + "/" + file, "r")
        lines += file.readlines()
start = 0
while num_files > 0:
    words = get_words()
    verilog_file = get_verilog_file(words, lines, start)
    if verilog_file == "Done":
        break
    num_files -= 1
# 1)

### The difference between an array and a vector is that the size of the array cannot be changed and is defined at compile-time whereas the size of a vector can be changed and is defined at runtime.

### The difference between a std_logic_vector and a std_logic_array is that the size of the std_logic_vector is fixed at compile time and is defined at the time of initialization whereas the size of a std_logic_array is defined at runtime.

---

# 2)

### I would choose the first option assuming each test would be independent of each other because the first option is the only one that makes each test isolated from each other.
### I would choose the second option assuming the tests were dependent on one another because the second option would ensure all tests were independent of each other.
### I would choose the third option assuming the tests were dependent on one another because the third option would ensure all tests were independent of each other.
### I would choose the fourth option assuming the tests were dependent on one another because the fourth option would ensure all tests were independent of each other.

---

# 3)

### If we want to test the muxdff component, we would need a valid value, a invalid value, an invalid input, and a boundary value. An example of a valid value would be 0, 1, 2, 3. An example of an invalid value would be -1, 4, 5. An example of an invalid input would be 0, 1, 2, 3, 4, 5. And an example of a boundary value would be 0, 1.

---

# 4)

### I would create a function that would be called in the main module that would take the input arguments and pass them to the testbench file. In order to make the testbench file as simple as possible, I would also create a while loop with a while counter that would be incremented and decremented inside the main module.

---

# 5)

### The problem of a random number generator is that it cannot