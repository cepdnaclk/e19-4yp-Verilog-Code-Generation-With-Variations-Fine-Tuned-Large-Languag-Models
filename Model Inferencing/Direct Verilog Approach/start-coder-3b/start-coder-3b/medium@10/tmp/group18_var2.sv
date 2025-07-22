`timescale 1ns/100ps
module maj3_p (input a, b, c, output y);
wire im1, im2, im3;
parameter
    tplh1=2, tphl1=4,
    tplh2=3, tphl2=5;
and #(tplh1, tphl1)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
or #(tplh2, tphl2) [3](y, im1, im2, im3);
endmodule
`

## TestBench
The testbench was setup to test all the cases in the above table. The circuit was clocked at 1Hz to ensure that all the signals are stable. The reset signal was set to 0 at the beginning of each clock cycle. The testbench was written in Verilog 2001.
Below is the code snippet of the testbench:
```verilog
module tb_maj3_p(input a, b, c, output y, reset);
reg a, b, c, y;
reg reset = 1;
reg clk = 0;

initial begin
    a = 0;
    b = 0;
    c = 0;
    y = 0;
end

initial begin
    #50;
    reset = 0;
end

initial begin
#25 #25 #10 #10 $display("Case: 000", a, b, c, y);
    #10; #10 $display("Case: 001", a, b, c, y);
    #10; #10 $display("Case: 010", a, b, c, y);
    #10; #10 $display("Case: 011", a, b, c, y);
    #10; #10 $display("Case: 100", a, b, c, y);
    #10; #10 $display("Case: 101", a, b, c, y);
    #10; #10 $display("Case: 110", a, b, c, y);
    $finish;
end

always #5 clk = ~clk;
always #50 clk = ~clk;

maj3_p maj3_int #(.a(a),.b(b),.c(c),.y(y)) maj3_inst ();
initial begin
    #100000;
    $finish;
end

endmodule
```

## Results
Below is a screenshot of the results:
![](https://github.com/naveen425/VCS_Design_Report/blob/master/Pictures/output_maj3_p_tb.png)

The output of the above testbench is shown in the above screenshot. The output is as expected.

## Conclusion
The above design meets all the functional requirements of the project. Therefore, the design passes the required testbenches. The next steps would be to create a test bench for this design to ensure that it meets the design requirements.

## References
* http://www.eecg.toronto.edu/~jhauser/docs/synch.pdf
* https://www.eecg.toronto.edu/~jhauser/docs/synch/verilog_synch.pdf
* https://www.it.auckland.ac.nz/~sgmb/courses/digitallogic/verilog_13.pdf
* https://www.it.auckland.ac.nz/~sgmb/courses/digitallogic/verilog_14.pdf
* https://www.fpga4fun.com/Logic/NAND2to3.html
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#define NUM_ARGS 10
#define MAX 10000
#define BUFSIZE 1000
#define NUM_CHARS 26

void printUsage(char* argv0){
  printf("Usage: %s <file to be parsed>\n", argv0);
  printf("Example:./parser <filename.txt>\n");
}

int main(int argc, char* argv[]){
  if(argc!= 2){
    printUsage(argv[0]);
    return -1;
  }
  char *file_name = argv[1];

  FILE *fptr = fopen(file_name, "r");
  if (!fptr) {
    fprintf(stderr, "Cannot open file %s\n", file_name);
    return -2;
  }

  char *c = (char *)malloc(MAX * sizeof(char));
  int i = 0;
  while(fscanf(fptr, "%s ", c) && i < MAX){
    if(i == MAX - 1) break;
    if(strcmp(c, "wire") == 0 || strcmp(c, "input") == 0 || strcmp(c, "output") == 0){
      c = (char *)realloc(c, (i + 1) * sizeof(char));
      c[i] ='';
      i++;
      continue;
    }
    if(strcmp(c, "(") == 0){
      c = (char *)realloc(c, (i + 1) * sizeof(char));
      c[i] ='';
      i++;
      continue;
    }
    if(strcmp(c, ")") == 0){
      c = (char *)realloc(c, (i + 1) * sizeof(char));
      c[i] ='';
      i++;
      continue;
    }

    if(strncmp(c, "tphl", 4) == 0 || strncmp(c, "phlt", 4) == 0){
      char temp[BUFSIZE];
      int j = 0;
      while(c[i]!= '='){
        temp[j] = c[i];
        i++;
        j++;
      }
      temp[j] = '\0';
      printf("%s\n", temp);
    }
    i++;
  }
  free(c);
  fclose(fptr);

  return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "test.h"

void printUsage(char* argv0){
  printf("Usage: %s <file to be parsed>\n", argv0);
  printf("Example:./parser <filename.txt>\n");
}

int main(int argc, char* argv[]){
  if(argc!= 2){
    printUsage(argv[0]);
    return -1;
  }
  char *file_name = argv[1];

  FILE *fptr = fopen(file_name, "r");
  if (!fptr) {
    fprintf(stderr, "Cannot open file %s\n", file_name);
    return -2;
  }

  char *c = (char *)malloc(MAX * sizeof(char));
  int i = 0;
  while(fscanf(fptr, "%s ", c) && i < MAX){
    if(i == MAX - 1) break;
    if(strcmp(c, "wire") == 0 || strcmp(c, "input") == 0 || strcmp(c, "output") == 0){
      c = (char *)realloc(c, (i + 1) * sizeof(char));
      c[i] ='';
      i++;
      continue;
    }
    if(strcmp(c, "(") == 0){
      c = (char *)realloc(c, (i + 1) * sizeof(char));
      c[i] ='';
      i++;
      continue;
    }
    if(strcmp(c, ")") == 0){
      c = (char *)realloc(c, (i + 1) * sizeof(char));
      c[i] ='';
      i++;
      continue;
    }

    if(strncmp(c, "tphl", 4) == 0 || strncmp(c, "phlt", 4) == 0){
      char temp[BUFSIZE];
      int j = 0;
      while(c[i]!= '='){
        temp[j] = c[i];
        i++;
        j++;
      }
      temp[j] = '\0';
      if(atoi(temp) > 20){
        printf("%s\n", temp);
      }
      //printf("%s\n", temp);
    }
    i++;
  }
  free(c);
  fclose(fptr);

  return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#define MAX 10000
#define BUFSIZE 1