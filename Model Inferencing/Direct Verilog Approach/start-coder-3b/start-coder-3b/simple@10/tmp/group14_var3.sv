module alu_8bit_1();
  input [7:0] a,b;
  input    f;
  output    [7:0] d;
  output    co;
  reg cci;
  wire [7:0] alu_sum;
  assign d = alu_sum;
  CarryAdd c0(cci,co,f);
  alu_8bit alu(alumin8,alu_sum,a,b,f,cci);
  initial begin cci=1'b0; alumin8=8'h0; f=2'b00; alu_sum=8'b0; a=8'h0; b=8'h0; #30 $stop; end
endmodule
![image](https://user-images.githubusercontent.com/33499623/126174685-94940a2d-a0cf-41b0-8007-e8d8d0487a2e.png)
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/shm.h>
#include <sys/ipc.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <assert.h>
#include <errno.h>
#include <semaphore.h>
#include <sys/mman.h>
#include <time.h>
#include <sys/time.h>
#include <pthread.h>
#include <sys/mman.h>

#define N 8
#define SIZE (N+2)
#define PRODUCER 0
#define CONSUMER 1


char buf[SIZE];
int in=0;
int out=0;

sem_t sem_empty;
sem_t sem_full;

pthread_mutex_t mutex;


void *producer(void *arg){
	int i,index;
  while(1){
    //pthread_mutex_lock(&mutex);
		index = in;
		in = (in+1)%N;

		for(int i=0;i<strlen((char*)arg);i++){
			buf[index] = ((char*)arg)[i];
			sleep(2);
			index++;
			index = index%N;
		}

    //pthread_mutex_unlock(&mutex);
		sem_post(&sem_full);
    sem_wait(&sem_empty);
	}
}

void *consumer(void *arg){
	int index;
	while(1){
		sem_wait(&sem_full