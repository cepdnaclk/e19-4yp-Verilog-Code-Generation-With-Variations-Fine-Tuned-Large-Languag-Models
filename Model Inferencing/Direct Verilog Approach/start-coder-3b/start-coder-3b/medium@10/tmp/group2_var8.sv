#include <stdio.h>
#include <stdlib.h>

int main() {
    int i = 0;
    int n = 10;
    int my_array[n][3] = {0};
    
    for (i = 0; i < n; i++) {
        int packed_array[3] = {0};
        packed_array[0] = i;
        packed_array[1] = i + i + 1;
        packed_array[2] = i + i + i + 1;
        my_array[i] = packed_array;
    }

    for (i = 0; i < n; i++) {
        printf("Array location: [%d][%d], 0: %d, 1: %d, 2: %d\n", i, 0, my_array[i][0], my_array[i][1], my_array[i][2]);
    }

	return 0;
}

#include <iostream>
#include <stdlib.h>

using namespace std;

int main() {
    int i = 0;
    int n = 10;
    int my_array[n][3] = {0};

    for (i = 0; i < n; i++) {
        int packed_array[3] = {0};
        packed_array[0] = i;
        packed_array[1] = i + i + 1;
        packed_array[2] = i + i + i + 1;
        my_array[i] = packed_array;
    }

    for (i = 0; i < n; i++) {
        cout << "Array location: [" << i << "][" << 0 << "], 0: " << my_array[i][0] << ", 1: " << my_array[i][1] << ", 2: " << my_array[i][2] << "\n";
    }

	return 0;
}

### Results:
##### C Code
Array location: [0][0], 0: 0, 1: 0, 2: 0
Array location: [1][0], 0: 1, 1: 2, 2: 3
Array location: [2][0], 0: 2, 1: 4, 2: 6
Array location: [3][0], 0: 3, 1: 6, 2: 9
Array location: [4][0], 0: 4, 1: 8, 2: 12
Array location: [5][0], 0: 5, 1: 10, 2: 15
Array location: [6][0], 0: 6, 1: 12, 2: 18
Array location: [7][0], 0: 7, 1: 14, 2: 21
Array location: [8][0], 0: 8, 1: 16, 2: 24
Array location: [9][0], 0: 9, 1: 18, 2: 27
##### Verilog Code
```
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
always @(posedge Clock)
    begin
        Q1 <= D;
        Q2 <= Q1;
    end
endmodule
```
### Results:
##### C Code
Array location: [0][0], 0: 0, 1: 0, 2: 0
Array location: [1][0], 0: 1, 1: 2, 2: 3
Array location: [2][0], 0: 2, 1: 4, 2: 6
Array location: [3][0], 0: 3, 1: 6, 2: 9
Array location: [4][0], 0: 4, 1: 8, 2: 12
Array location: [5][0], 0: 5, 1: 10, 2: 15
Array location: [6][0], 0: 6, 1: 12, 2: 18
Array location: [7][0], 0: 7, 1: 14, 2: 21
Array location: [8][0], 0: 8, 1: 16, 2: 24
Array location: [9][0], 0: 9, 1: 18, 2: 27
##### Verilog Code
```
module example7_4(D, Clock, Q1, Q2);
input D, Clock;
output Q1, Q2;
reg Q1, Q2;
always @(posedge Clock)
    begin
        Q1 <= D;
        Q2 <= Q1;
    end
endmodule
```

```
$ gcc -o output.out output.c
$./output.out
Array location: [0][0], 0: 0, 1: 0, 2: 0
Array location: [1][0], 0: 1, 1: 2, 2: 3
Array location: [2][0], 0: 2, 1: 4, 2: 6
Array location: [3][0], 0: 3, 1: 6, 2: 9
Array location: [4][0], 0: 4, 1: 8, 2: 12
Array location: [5][0], 0: 5, 1: 10, 2: 15
Array location: [6][0], 0: 6, 1: 12, 2: 18
Array location: [7][0], 0: 7, 1: 14, 2: 21
Array location: [8][0], 0: 8, 1: 16, 2: 24
Array location: [9][0], 0: 9, 1: 18, 2: 27
```

```
$ i++ # i = 10, n = 10
$ while [ $i -lt $n ] && [ $i -ge 0 ] ; do echo i=$i; i++; done
i=10
i=9
i=8
i=7
i=6
i=5
i=4
i=3
i=2
i=1
i=0
```

```
$ gcc -o output.out output.c
$./output.out
Array location: [0][0], 0: 0, 1: 0, 2: 0
Array location: [1][0], 0: 1, 1: 2, 2: 3
Array location: [2][0], 0: 2, 1: 4, 2: 6
Array location: [3][0], 0: 3, 1: 6, 2: 9
Array location: [4][0], 0: 4, 1: 8, 2: 12
Array location: [5][0], 0: 5, 1: 10, 2: 15
Array location: [6][0], 0: 6, 1: 12, 2: 18
Array location: [7][0], 0: 7, 1: 14, 2: 21
Array location: [8][0], 0: 8, 1: 16, 2: 24
Array location: [9][0], 0: 9, 1: 18, 2: 27
```

```
$ i-- # i = -1, n = 10
$ while [ $i -lt $n -gt 0 ] && [ $i -ge 0 ] ; do echo i=$i; i--; done
i=-1
i=-2
i=-3
i=-4
i=-5
i=-6
i=-7
i=-8
i=-9
i=-10
```

```
$ i++ # i = 10, n = 10
$ while [ $i -lt $n ] && [ $i -ge 0 ] ; do echo i=$i; i++; done
i=10
```

```
$ i-- # i = -1, n = 10
$ while [ $i -lt $n -gt 0 ] && [ $i -ge 0 ] ; do echo i=$i; i--; done
i=-1