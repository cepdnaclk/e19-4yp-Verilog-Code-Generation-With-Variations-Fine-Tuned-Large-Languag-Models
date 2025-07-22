module example5(x1, x2, x3, f);
input x1, x2, x3;
output f;
reg f;
always @(x1 or x2 or x3)
    if (x2 == 1 && x2[1:0] < 2)
        f = x1;
    else
        f = x3;
endmodule
/hw2/test/example1.c
#include "stdlib.h"
#include "stdio.h"
#include "unistd.h"
#include "string.h"
#include "fcntl.h"
#include "errno.h"
#include "limits.h"
#include "sys/stat.h"
#include "sys/types.h"

int main(int argc, char *argv[])
{
    int fd, i, j;
    char line[4000];

    for (i = 0; i < 4000; ++i) {
        line[i] = (i % 13) + 90;
    }

    line[i - 1] = 0;
    fd = open(argv[1], O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
    if (fd < 0) exit(2);
    write(fd, line, 4000);
    close(fd);

    fd = open(argv[1], O_RDONLY);
    if (fd < 0) exit(2);
    i = 0;
    j = 0;
    while (1) {
        j = read(fd, line, 4000);
        if (j <= 0) {
            printf("%d\n", i);
            break;
        }
        i += 1;
    }
    close(fd);
    return 0;
}/hw7/test/test_example7.c
#include "stdlib.h"
#include "stdio.h"
#include "unistd.h"
#include "string.h"
#include "fcntl.h"
#include "errno.h"
#include "limits.h"
#include "sys/stat.h"
#include "sys/types.h"

int main(int argc, char *argv[])
{
    int fd, i, j;
    char line[4000];

    for (i = 0; i < 4000; ++i) {
        line[i] = (i % 13) + 90;
    }

    line[i - 1] = 0;
    fd = open(argv[1], O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
    if (fd < 0) exit(2);
    write(fd, line, 4000);
    close(fd);

    fd = open(argv[1], O_RDONLY);
    if (fd < 0) exit(2);
    i = 0;
    j = 0;
    while (1) {
        j = read(fd, line, 4000);
        if (j <= 0) {
            printf("%d\n", i);
            break;
        }
        i += 1;
    }
    close(fd);
    return 0;
}/hw6/test/test_example2.c
#include "stdlib.h"
#include "stdio.h"
#include "unistd.h"
#include "string.h"
#include "fcntl.h"
#include "errno.h"
#include "limits.h"
#include "sys/stat.h"
#include "sys/types.h"

int main(int argc, char *argv[])
{
    int fd, i, j;
    char line[4000];

    for (i = 0; i < 4000; ++i) {
        line[i] = (i % 13) + 90;
    }

    line[i - 1] = 0;
    fd = open(argv[1], O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
    if (fd < 0) exit(2);
    write(fd, line, 4000);
    close(fd);

    fd = open(argv[1], O_RDONLY);
    if (fd < 0) exit(2);
    i = 0;
    j = 0;
    while (1) {
        j = read(fd, line, 4000);
        if (j <= 0) {
            printf("%d\n", i);
            break;
        }
        i += 1;
    }
    close(fd);
    return 0;
}/hw2/test/test_example5.py
import os
import random
import subprocess
import signal
import time
from threading import Thread, RLock

def get_result(file_path):
    cmd = 'python3./test_example5.py {0}'.format(file_path)
    p = subprocess.Popen(cmd, shell=True)
    os.waitpid(-1, os.WNOHANG|os.WUNTRACED)
    time.sleep(1)
    assert (p.poll()!= None)
    if p.returncode!= 0:
        # print('Error:'+ file_path)
        return -1
    else:
        f = open(file_path + '.result', 'r')
        line = f.readline().strip()
        f.close()
        return int(line)

if __name__ == '__main__':
    f = open('test_example5.txt', 'r')
    lines = f.readlines()
    f.close()
    # files = [line.strip().split('/')[-1] for line in lines]
    # random.shuffle(files)
    # files = files[:10]
    files = lines
    print(files)
    with open('test_example5.txt', 'r') as f:
        lines = f.readlines()
    num = len(files)
    print('Total:'+ str(num))

    max_idx = num
    total = 0
    failed_cnt = 0
    for i in range(max_idx):
        path = files[i]
        result = get_result(path)
        # print('Result:'+ str(result))
        if result < 0:
            failed_cnt += 1
            continue
        total += result

    print('Total ='+ str(total))
    print('Failed ='+ str(failed_cnt))/hw8/test/example4.c
#include "stdlib.h"
#include "stdio.h"
#include "unistd.h"
#include "string.h"
#include "fcntl.h"
#include "errno.h"
#include "limits.h"
#include "sys/stat.h"
#include "sys/types.h"

int main(int argc, char *argv[])
{
    printf("Hello World!\n");
    int file_1 = open("test.txt", O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
    write(file_1, "Hello World!\n", 13);
    close(file_1);
    file_1 = open("test.txt", O_RDONLY);
    int file_2 = dup(file_1);
    write(file_2, "Hello World!\n", 13);
    close(file_2);
    close(file_1);

    return 0;
}/hw3/test/example1.c
#include "stdlib.h"
#include "stdio.h"
#include "unistd.h"
#include "string.h"
#include "fcntl.h"
#include "errno.h"
#include "limits.h"
#include "sys/stat.h"
#include "sys/types.h"

int main(int argc, char *argv[])
{
    int fd, i, j;
    char line[4000];

    for (i = 0; i < 4000; ++i) {
        line[i] = (i % 13) + 90;
    }

    line[i - 1] = 0;
    fd = open(argv[1], O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
    if (fd < 0) exit(2);
    write(fd, line, 4000);
    close(fd);

    fd = open(argv[1], O_RDONLY);
    if (fd < 0) exit(2);
    i = 0;
    j = 0;
    while (1) {
        j = read(fd, line, 4000);
        if (j <= 0) {
            printf("%d\n", i);