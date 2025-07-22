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
or #(tplh2, tphl2) (y, im1[1], im2[1], im3[1]);
endmodule
### Output of `iverilog -o maj3_p.vvp maj3_p.v`
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
or #(tplh2, tphl2) (y, im1[1], im2[1], im3[1]);
endmodule
`
/Lab5/lab5_2_2/lab5_2_2.cpp
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <iostream>
#include <errno.h>
#include <netdb.h>

#ifndef PORT
#define PORT 9999
#endif
#ifndef BACKLOG
#define BACKLOG 10
#endif
#ifndef IP
#define IP "192.168.1.20"
#endif
#ifndef MESSAGE
#define MESSAGE "Hello World"
#endif

int
main(int argc, char *argv[])
{
  int sockfd, conn;
  struct sockaddr_in server, client;
  char buffer[256];
  socklen_t addrlen = sizeof(client);
  int len;

  if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
    std::cerr << "socket: " << strerror(errno) << '\n';
    exit(1);
  }

  memset(&server, 0, sizeof(server));
  memset(&client, 0, sizeof(client));

  server.sin_family = AF_INET;
  server.sin_addr.s_addr = htonl(INADDR_ANY);
  server.sin_port = htons(9999);

  if (bind(sockfd, (struct sockaddr *)&server, sizeof(server)) == -1) {
    std::cerr << "bind: " << strerror(errno) << '\n';
    exit(1);
  }

  if (listen(sockfd, BACKLOG) == -1) {
    std::cerr << "listen: " << strerror(errno) << '\n';
    exit(1);
  }

  std::cout << "[+] Waiting for connections...\n";

  while (1) {
    if ((conn = accept(sockfd, (struct sockaddr *)&client, &addrlen)) == -1) {
      std::cerr << "accept: " << strerror(errno) << '\n';
      exit(1);
    }

    len = recv(conn, &buffer, sizeof(buffer), 0);
    std::cout << "[+] Received " << len << " bytes from " << inet_ntoa(client.sin_addr) << ':' << ntohs(client.sin_port) << '\n';
    std::cout << "[+] Data: " << buffer << '\n';
    close(conn);
  }

  return 0;
}
/Lab7/lab7_3/lab7_3.cpp
#include <iostream>
#include <string>
#include <stdio.h>
#include <stdlib.h>

#define FNAME "in.bin"
#define LNAME "last.bin"

int main(int argc, char *argv[]) {
    FILE *fp;
    unsigned size;
    char *fname, *lname;
    struct Person { char first[16], last[16]; } *pFirst, *pLast;

    fp = fopen(FNAME, "rb+");
    if (fp == NULL) {
        fp = fopen(FNAME, "wb");
        if (fp == NULL) {
            printf("Unable to open %s for write\n", FNAME);
            return EXIT_FAILURE;
        }
    }

    fseek(fp, 0, SEEK_END);
    size = ftell(fp);
    if (size % sizeof(struct Person)) {
        printf("ERROR: Input file size is not evenly divisible by person size\n");
        return EXIT_FAILURE;
    }
    fseek(fp, 0, SEEK_SET);
    printf("Filesize: %d\n", size);

    fseek(fp, 0, SEEK_END);
    size = ftell(fp);

    pFirst = (struct Person *)malloc(size);
    if (pFirst == NULL) {
        printf("ERROR: Unable to allocate the first persons memory!\n");
        return EXIT_FAILURE;
    }
    fread(pFirst, size, 1, fp);

    fclose(fp);
    fp = fopen(LNAME, "rb+");
    if (fp == NULL) {
        fp = fopen(LNAME, "wb");
        if (fp == NULL) {
            printf("ERROR: Unable to open %s for write\n", LNAME);
            return EXIT_FAILURE;
        }
    }
    fseek(fp, 0, SEEK_END);
    size = ftell(fp);
    if (size % sizeof(struct Person)) {
        printf("ERROR: Input file size is not evenly divisible by person size\n");
        return EXIT_FAILURE;
    }
    fseek(fp, 0, SEEK_SET);
    printf("Filesize: %d\n", size);

    fseek(fp, 0, SEEK_END);
    size = ftell(fp);

    pLast = (struct Person *)malloc(size);
    if (pLast == NULL) {
        printf("ERROR: Unable to allocate the last persons memory!\n");
        return EXIT_FAILURE;
    }
    fread(pLast, size, 1, fp);

    fclose(fp);

    printf("\nFirst Persons\n");
    for (int i = 0; i < size / sizeof(struct Person); i++) {
        printf("Person: %d, First Name: %s, Last Name: %s\n", i, pFirst[i].first, pFirst[i].last);
    }

    printf("\nLast Persons\n");
    for (int i = 0; i < size / sizeof(struct Person); i++) {
        printf("Person: %d, First Name: %s, Last Name: %s\n", i, pLast[i].first, pLast[i].last);
    }

    free(pFirst);
    free(pLast);

    return EXIT_SUCCESS;
}
/Lab5/lab5_3_3/lab5_3_3.cpp
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <errno.h>
#include <netdb.h>
#include <poll.h>
#include <signal.h>

#ifndef PORT
#define PORT 9999
#endif
#ifndef BACKLOG
#define BACKLOG 10
#endif
#ifndef IP
#define IP "192.168.1.20"
#endif
#ifndef MESSAGE
#define MESSAGE "Hello World"
#endif
#ifndef POLL_TIME
#define POLL_TIME 500
#endif

void
handle_sig(int signal)
{
  std::cout << "[!] SIGINT caught!\n";
  exit(EXIT_FAILURE);
}

int
main(int argc, char *argv[])
{
  int sockfd, conn;
  struct sockaddr_in server, client;
  char buffer[256];
  socklen_t addrlen = sizeof(client);
  int len;
  struct pollfd ufds[2];
  
  signal(SIGINT, handle_sig);

  if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1