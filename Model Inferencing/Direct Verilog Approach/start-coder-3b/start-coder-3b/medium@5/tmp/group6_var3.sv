module clock_gen_for; // Renamed module for clarity
  reg clk, en;
  integer i; // Declare integer index i
  integer T = 2; // Declare integer constant T
  // Generate clock using for loop
  always @(posedge en)
    for (i=0; i<T; i=i+1) // Start clock generation every 2 time units
      clk = ~clk;
  initial
  begin
    clk = 1'b0; // Initialize clock
    en = 1'b0; // Start disabled
  end
  initial $monitor("clk=%b, t=%0d, en=%b ", clk,$time,en);
endmodule
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

// Function Prototypes
int validate_port(char *port);
int validate_ip_address(char *ip_address);
int main (int argc, char *argv[]) {
	char ip_address[15];
	char port[6];
	char file_name[20];
	int i;

	printf("\nEnter IP address (e.g., 10.0.0.1 or 127.0.0.1): ");
	fgets(ip_address, 15, stdin);
	if (validate_ip_address(ip_address)) {
		i = strlen(ip_address) - 1;
		if (ip_address[i] == '\n') {
			ip_address[i] = '\0';
		}
	}
	else {
		printf("\nInvalid IP address entered!");
		exit(1);
	}

	printf("\nEnter port (e.g., 8080): ");
	fgets(port, 6, stdin);
	if (validate_port(port)) {
		i = strlen(port) - 1;
		if (port[i] == '\n') {
			port[i] = '\0';
		}
	}
	else {
		printf("\nInvalid port entered!");
		exit(1);
	}

	printf("\nEnter file name (e.g., index.html): ");
	fgets(file_name, 20, stdin);
	i = strlen(file_name) - 1;
	if (file_name[i] == '\n') {
		file_name[i] = '\0';
	}

	FILE *file = fopen(file_name, "w");
	if (file == NULL) {
		printf("\nCould not open file!");
		exit(1);
	}

	// Socket file descriptor
	int sockfd;
	if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
		perror("\nError opening socket!");
		exit(1);
	}
	printf("\nSocket opened!");

	// Initialize struct'server_info'
	struct hostent *server_info;
	if ((server_info = gethostbyname(ip_address)) == NULL) {
		perror("\nError getting server information!");
		exit(1);
	}

	// Initialize struct'serv_addr'
	struct sockaddr_in serv_addr;
	serv_addr.sin_family = AF_INET;
	bcopy((char *)server_info->h_addr, (char *)&serv_addr.sin_addr.s_addr, server_info->h_length);
	serv_addr.sin_port = htons(atoi(port));

	// Create connection to ip address and port
	if (connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) == -1) {
		perror("\nError connecting to server!");
		exit(1);
	}
	printf("\nConnected to server!");

	char message[256];
	sprintf(message, "GET /%s HTTP/1.1\r\n", file_name);
	sprintf(message, "%sHost: %s\r\n\r\n", message, ip_address);
	send(sockfd, message, strlen(message), 0);
	printf("\nSent message to server!\n");

	// Receive HTTP response from server
	printf("\nServer Response:\n");
	int n;
	while ((n = recv(sockfd, message, 256, 0)) > 0) {
		printf("%s", message);
	}

	close(sockfd);
	fclose(file);
}


// Function Definitions
int validate_port(char *port) {
	int i;
	for (i = 0; i < strlen(port); i++) {
		if (!isalnum(port[i])) {
			return 0;
		}
	}

	if (strlen(port)!= 4) {
		return 0;
	}
	else {
		return 1;
	}
}

int validate_ip_address(char *ip_address) {
	int i;
	for (i = 0; i < strlen(ip_address); i++) {
		if (!isdigit(ip_address[i]) && ip_address[i]!= '.') {
			return 0;
		}
	}

	int periods = 0;
	for (i = 0; i < strlen(ip_address); i++) {
		if (ip_address[i] == '.') {
			periods++;
		}
	}

	if (periods!= 3) {
		return 0;
	}
	else {
		return 1;
	}
}#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

// Function Prototypes
int validate_port(char *port);
int validate_ip_address(char *ip_address);
int validate_file_name(char *file_name);
int main (int argc, char *argv[]) {
	// Socket file descriptor
	int sockfd;
	if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
		perror("\nError opening socket!");
		exit(1);
	}
	printf("\nSocket opened!");

	// Initialize struct'server_info'
	struct hostent *server_info;
	if ((server_info = gethostbyname(argv[1])) == NULL) {
		perror("\nError getting server information!");
		exit(1);
	}

	// Initialize struct'serv_addr'
	struct sockaddr_in serv_addr;
	serv_addr.sin_family = AF_INET;
	bcopy((char *)server_info->h_addr, (char *)&serv_addr.sin_addr.s_addr, server_info->h_length);
	serv_addr.sin_port = htons(atoi(argv[2]));

	// Create connection to ip address and port
	if (connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) == -1) {
		perror("\nError connecting to server!");
		exit(1);
	}
	printf("\nConnected to server!");

	// Receive HTTP response from server
	char message[256];
	char response[256];
	char file_name[256];
	sprintf(file_name, "HTTP/1.0 %s %s\r\n", argv[3], file_name);
	sprintf(file_name, "%sHost: %s\r\n\r\n", file_name, argv[1]);
	send(sockfd, file_name, strlen(file_name), 0);
	printf("\nSent message to server!\n");

	// Receive HTTP response from server
	printf("\nServer Response:\n");
	int n;
	while ((n = recv(sockfd, message, 256, 0)) > 0) {
		printf("%s", message);
	}
}


// Function Definitions
int validate_port(char *port) {
	int i;
	for (i = 0; i < strlen(port); i++) {
		if (!isalnum(port[i])) {
			return 0;
		}