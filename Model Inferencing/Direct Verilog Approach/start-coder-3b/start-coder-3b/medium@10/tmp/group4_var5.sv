module d(a,b,c,d,e);      // 4-input AND
  output a; output b; output c; output d; output e;
  input in1; input in2; input in3; input in4;
  wire not1;
  wire not2;
  wire not3;
  assign not1 = ~in1;
  assign not2 = ~in2;
  assign not3 = ~in3;
  and (a, in1, in2);
  and (b, a, ~not3);
  and (c, not1, in4);
  and (d, b, c);
  and (e, not2, d);
  assign d = {~in1,~in2,~in3,in4};
endmodule
#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<string.h>
#include<sys/wait.h>
#include<sys/socket.h>
#include<sys/types.h>
#include <netdb.h>
#include <netinet/in.h>
#include <arpa/inet.h>

int main(void)
{
    char server_ip[100] = "localhost";
    int port_num = 8080;
    int sockfd = 0;
    int new_sockfd = 0;
    int valread;
    struct sockaddr_in serv_addr;
    struct sockaddr_in cli_addr;
    socklen_t clilen;
    char buffer[1024] = {0};
    if((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0){
        printf("\n Error : Could not create socket \n");
        return -1;
    }
    memset(&serv_addr, '0', sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(port_num);
    int status = inet_pton(AF_INET,server_ip,&serv_addr.sin_addr);
    if(status <= 0){
        printf("\nError : inet_pton error occured\n");
        return -1;
    }
    if(connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0){
        printf("\n Error : connect error \n");
        return -1;
    }
    while(1){
        //Accepts a connection request from a client
        new_sockfd = accept(sockfd, (struct sockaddr *)&cli_addr, &clilen);
        if(new_sockfd < 0){
            printf("\n Error : Acceptance error \n");
        }
        //Receives data on a connected socket
        valread = recv(new_sockfd, buffer, 1024, 0);
        if(valread < 0){
            printf("\n Error : Receiving error \n");
        }
        printf("RECEIVED : %s\n",buffer);
        char *token = strtok(buffer," ");
        char *name = strtok(NULL," ");
        int i = 1;
        char *temp = malloc(sizeof(char)*256);
        while(token!= NULL){
            printf("Word : %s\n",token);
            strcpy(temp,token);
            token = strtok(NULL," ");
            i++;
        }
        if(strcmp(name,"quit") == 0){
            printf("\n Quitting \n");
            break;
        }
        char *str = malloc(sizeof(char)*256);
        sprintf(str,"%s.txt",name);
        printf("FILE NAME : %s\n",str);
        FILE *fp = fopen(str,"r");
        if(fp == NULL){
            printf("\n File not found \n");
        }
        char c = fgetc(fp);
        char *sent = malloc(sizeof(char)*256);
        sprintf(sent,"%s",name);
        strcat(sent,": ");
        int index = 0;
        while(c!= EOF){
            sent[index] = c;
            index++;
            strcat(sent,"");
            c = fgetc(fp);
        }
        sent[index] = '\n';
        sent[index+1] = '\0';
        printf("SENT : %s\n",sent);
        if(valread < 0){
            printf("\n Error : Sending error \n");
        }
        
        send(new_sockfd, sent, strlen(sent), 0);
        if(new_sockfd < 0){
            printf("\n