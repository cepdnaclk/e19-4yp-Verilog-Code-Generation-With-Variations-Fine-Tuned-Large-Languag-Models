```
module testbench ();
struct randomtest {
    rand rand;
};
generate data;
process data;
endmodule
```
> Note: The testbench must be changed to check the rand member.
### Example:
```
module testbench ();
struct randomtest {
    rand rand;
};
generate data;
process data;
endmodule
```
#include <stdio.h>
#include <stdlib.h>
#include "testbench.h"

extern int testbench();

int main(int argc, char** argv){
    int errorCount = 0;
    for(int i = 0; i < 1000; ++i){
        printf("Running testbench #%d\n", i);
        if(testbench()){
            printf("passed\n");
        } else {
            errorCount++;
            printf("failed\n");
        }
        usleep(100000);
    }

    printf("Passed: %d, Failed: %d\n", 1000 - errorCount, errorCount);
    return 0;
}#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "testbench.h"

int testbench(){
    // srand((unsigned)time(NULL));
    srand((unsigned)1);

    // Declare Test Items
    int item1, item2, item3;

    // Test the case where there are no items
    item1 = first();
    item2 = last();
    item3 = pop();

    if(!(item1 == 0 && item2 == 0 && item3 == -1))
        return 0;

    // Test the case where only one item is in the list
    insert(1);
    item1 = first();
    item2 = last();
    item3 = pop();

    if(!(item1 == 1 && item2 == 1 && item3 == -1))
        return 0;

    // Test the case where there are multiple items in the list
    insert(2);
    insert(3);
    item1 = first();
    item2 = last();
    item3 = pop();

    if(!(item1 == 2 && item2 == 3 && item3 == -1))
        return 0;

    // Test the case where there are no items in the list
    insert(4);
    insert(5);
    insert(6);
    item1 = first();
    item2 = last();
    item3 = pop();
    item1 = pop();
    item2 = pop();

    if(!(item1 == 6 && item2 == 4 && item3 == 5))
        return 0;

    // Test the case where there are items in the list
    item1 = first();
    item2 = last();
    item3 = pop();

    if(!(item1 == 0 && item2 == 0 && item3 == -1))
        return 0;

    return 1;
}#include <stdio.h>
#include <stdlib.h>
#include "testbench.h"

extern int testbench();

int main(int argc, char** argv){
    int errorCount = 0;
    for(int i = 0; i < 5; ++i){
        printf("Running testbench #%d\n", i);
        if(testbench()){
            printf("passed\n");
        } else {
            errorCount++;
            printf("failed\n");
        }
        usleep(100000);
    }

    printf("Passed: %d, Failed: %d\n", 5 - errorCount, errorCount);
    return 0;
}#include <stdio.h>
#include <stdlib.h>
#include "testbench.h"

extern int testbench();

int main(int argc, char** argv){
    int errorCount = 0;
    for(int i = 0; i < 5; ++i){
        printf("Running testbench #%d\n", i);
        if(testbench()){
            printf("passed\n");
        } else {
            errorCount++;
            printf("failed\n");
        }
        usleep(100000);
    }

    printf("Passed: %d, Failed: %d\n", 5 - errorCount, errorCount);
    return 0;
}#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "testbench.h"

int testbench(){
    // srand((unsigned)time(NULL));
    srand((unsigned)1);

    int randData = rand() % 100;
    insert(randData);

    // Declare Test Items
    int item1, item2, item3;

    // Test the case where there are no items
    item1 = first();
    item2 = last();
    item3 = pop();

    if(!(item1 == randData && item2 == randData && item3 == -1))
        return 0;

    return 1;
}#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "testbench.h"

int testbench(){
    // srand((unsigned)time(NULL));
    srand((unsigned)1);

    int randData = rand() % 100;

    // Declare Test Items
    int item1, item2, item3;

    // Test the case where there are no items
    insert(randData);
    item1 = first();
    item2 = last();
    item3 = pop();

    if(!(item1 == randData && item2 == randData && item3 == -1))
        return 0;

    // Test the case where only one item is in the list
    insert(randData);
    item1 = first();
    item2 = last();
    item3 = pop();

    if(!(item1 == randData && item2 == randData && item3 == -1))
        return 0;

    // Test the case where there are multiple items in the list
    insert(randData);
    insert(randData);
    item1 = first();
    item2 = last();
    item3 = pop();

    if(!(item1 == randData && item2 == randData && item3 == -1))
        return 0;

    // Test the case where there are no items in the list
    insert(randData);
    insert(randData);
    insert(randData);
    item1 = first();
    item2 = last();
    item3 = pop();
    item1 = pop();
    item2 = pop();

    if(!(item1 == randData && item2 == randData && item3 == randData))
        return 0;

    // Test the case where there are items in the list
    item1 = first();
    item2 = last();
    item3 = pop();

    if(!(item1 == 0 && item2 == 0 && item3 == -1))
        return 0;

    return 1;
}#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "testbench.h"

int testbench(){
    // srand((unsigned)time(NULL));
    srand((unsigned)1);

    // Declare Test Items
    int item1, item2, item3;

    // Test the case where there are items in the list
    insert(rand() % 100);
    insert(rand() % 100);
    item1 = first();
    item2 = last();
    item3 = pop();

    if(!(item1 == rand() % 100 && item2 == rand() % 100 && item3 == rand() % 100))
        return 0;

    // Test the case where there are no items in the list
    item1 = first();
    item2 = last();
    item3 = pop();
    item1 = pop();
    item2 = pop();

    if(!(item1 == 0 && item2 == 0 && item3 == -1))
        return 0;

    return 1;
}#include <stdio.h>
#include <stdlib.h>
#include "testbench.h"

extern int testbench();

int main(int argc, char** argv){
    int errorCount = 0;
    for(int i = 0; i < 10; ++i){
        printf("Running testbench #%d\n", i);
        if(testbench()){
            printf("passed\n");
        } else {
            errorCount++;
            printf("failed\n");
        }
        usleep(100000);
    }

    printf("Passed: %d, Failed: %d\n", 10 - errorCount, errorCount);
    return 0;
}#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "testbench.h"

int testbench(){
    // srand((unsigned)time(NULL));
    srand((unsigned)1);

    int randData = rand() % 100;