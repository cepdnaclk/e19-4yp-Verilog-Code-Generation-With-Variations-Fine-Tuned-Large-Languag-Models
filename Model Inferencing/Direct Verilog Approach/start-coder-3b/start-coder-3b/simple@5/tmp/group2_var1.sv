module test;
reg [3:0] x, y, z;
wire a;
assign #25 a = 1;
always begin
    x = #10 a;
end
endmodule
### Generated Code:
```
// Generated: 07/16/2020 14:38:52
module test;
logic [1:0] a;
assign a = 1;
always @(posedge a or negedge a) begin
if (a) a = 1;
end
always @* begin
  x = 0;
  y = 0;
  z = 0;
  if (a) begin
    x = 1;
    y = 1;
    z = 1;
  end
end
endmodule
###
```
#include <iostream>
#include <vector>

using namespace std;

int main() {

	vector<int> V(5);
	int iV = 0; // variable to hold total value of vector elements

	for(int i=0; i<5; i++) {
		cout << "Enter a number to add to vector V: ";
		cin >> V[i]; // fills the vector with user input
		iV += V[i]; // adds up the contents of the vector
	}

	cout << "V =";

	for(int i=0; i<5; i++) {
		cout << V[i] << ", ";
	}

	cout << " and they add to " << iV << "." << endl;
}
#include <iostream>

using namespace std;

int main() {

	cout << "Hello world. " << endl;	// endl = end line, and clears line
	cout << 123 << endl;

	int x = 5;

	cout << x << endl;
	int y = 7;
	cout << y << endl;
	// x = 5;
	// y = "cat";
	// cout << x << y << endl;
	// cout << x << " " << y << endl;

	int a = 5;
	int b = 7;

	cout << a + b << endl;
	cout << a - b << endl;
	cout << a * b << endl;
	cout << a / b << endl;

	int c = 7;

	cout << a + c << endl;
	cout << a - c << endl;
	cout << a * c << endl;
	cout << a / c << endl;

	cout << "Enter a number: ";	// prompts user to input number
	int d;
	cin >> d;

	cout << "d = " << d << endl;

	// casting
	int e = 5;
	float f = 7.6;

	cout << e + f << endl;

	// arithmetic operators
	cout << "Enter a number: ";
	int g;
	cin >> g;

	cout << "Enter a number: ";
	int h;
	cin >> h;

	cout << "g + h = " << g + h << endl;
	cout << "g - h = " << g - h << endl;
	cout << "g * h = " << g * h << endl;
	cout << "g / h = " << g / h << endl;
	cout << "g % h = " << g % h << endl;

	int i = 19;

	cout << "i++ = " << i++ << endl;
	cout << "i = " << i << endl;

	int j = 7;

	cout << "++j = " << ++j << endl;
	cout << "j = " << j << endl;

	int k = 6;

	cout << "j-- = " << j-- << endl;
	cout << "j = " << j << endl;

	int l = 2;

	cout << "--k = " << --k << endl;
	cout << "k = " << k << endl;

	int m = 7;
	int n = 19;

	cout << "m < n = " << (m < n) << endl;
	cout << "m <= n = " << (m <= n) << endl;
	cout << "m > n = " << (m > n) << endl;
	cout << "m >= n = " << (m >= n) << endl;
	cout << "m == n = " << (m == n) << endl;
	cout << "m!= n = " << (m!= n) << endl;

	int o = 5;

	cout << "o = " << o << endl;
	cout << "o += 7 = " << (o+=7) << endl;
	cout << "o = " << o << endl;

	cout << "o = " << o << endl;
	cout << "o -= 7 = " << (o-=7) << endl;
	cout << "o = " << o << endl;

	cout << "o = " << o << endl;
	cout << "o %= 7 = " << (o%=7) << endl;
	cout << "o = " << o << endl;

	cout << "o = " << o << endl;
	cout << "o *= 7 = " << (o*=7) << endl;
	cout << "o = " << o << endl;

	cout << "o = " << o << endl;
	cout << "o /= 7 = " << (o/=7) << endl;
	cout << "o = " << o << endl;

	cout << "o = " << o << endl;
	cout << "o /= 7 = " << (o/=7) << endl;
	cout << "o = " << o << endl;

	int p = 14;
	int q = 7;

	cout << "p = " << p << endl;
	cout << "q = " << q << endl;
	cout << "p % q = " << p % q << endl;
	cout << "q % p = " << q % p << endl;
}
#include <iostream>
#include <string>

using namespace std;

// function prototypes
bool compare(string, string);
void print(string, string);
bool compare(int, int);
void print(int, int);
void print(int, int, int);

int main() {

	// compare("dog", "cat");
	// print("dog", "cat");

	// compare(3, 4);
	// print(3, 4);

	print(5, 6, 7);

}

// function definitions

bool compare(string x, string y) {

	int xLength = x.length();
	int yLength = y.length();

	if(xLength == yLength) {
		return true;
	} else {
		return false;
	}
}

void print(string x, string y) {

	if(compare(x, y)) {
		cout << x << " and " << y << " are equal length strings." << endl;
	} else {
		cout << x << " and " << y << " are not equal length strings." << endl;
	}

}

bool compare(int x, int y) {

	if(x == y) {
		return true;
	} else {
		return false;
	}
}

void print(int x, int y) {

	if(compare(x, y)) {
		cout << x << " and " << y << " are equal integers." << endl;
	} else {
		cout << x << " and " << y << " are not equal integers." << endl;
	}
}

void print(int x, int y, int z) {

	if(compare(x, y)) {
		cout << x << " and " << y << " are equal integers." << endl;
	} else {
		cout << x << " and " << y << " are not equal integers." << endl;
	}

	if(compare(x, z)) {
		cout << x << " and " << z << " are equal integers." << endl;
	} else {
		cout << x << " and " << z << " are not equal integers." << endl;
	}

	if(compare(y, z)) {
		cout << y << " and " << z << " are equal integers." << endl;
	} else {
		cout << y << " and " << z << " are not equal integers." << endl;
	}
}
#include <iostream>

using namespace std;

/* function prototypes */
void swap(int *, int *);
void swap