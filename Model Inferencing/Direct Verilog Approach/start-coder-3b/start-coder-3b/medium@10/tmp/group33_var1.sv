1. add 2 functions:
    - void get_var_range_in_slice_range(int index,ref int out_in_lower,ref int out_in_upper)
    - void get_var_range_in_slice_var(ref int  in_var_lower, ref int in_var_upper)
2. add 2 variables:
    - static int var_range_lower_in;
    - static int var_range_upper_in;
3. add 2 conditions:
    - if(in_var_lower == var_range_lower_in && in_var_upper == var_range_upper_in){
      out_in_lower=var_range_lower_in;out_in_upper=var_range_upper_in;
    }
    - if(var_range_lower_in == 1 && var_range_upper_in == 3){
      out_in_lower=var_range_lower_in;out_in_upper=var_range_upper_in;
    }
4. add 2 initials:
    - // Get var_range_lower_in and var_range_upper_in for all slice ranges
    - for(int i = 0; i < array_size(slice_var_ranges); i++){
      get_var_range_in_slice_range(i, slice_var_ranges[i][0], slice_var_ranges[i][1]);
      if(slice_var_ranges[i][0] == 1 && slice_var_ranges[i][1] == 3){
        get_var_range_in_slice_var(in_var_ranges[i][0], in_var_ranges[i][1]);
      }
    }
5. add assert:
    - assert(var_range_lower_in == 1 && var_range_upper_in == 3, "slice_in is not legal, error index: " + var_range_lower_in + "_" + var_range_upper_in);
6. add $monitors
    - $monitor($time, "var_range_lower_in = %d", var_range_lower_in);
    - $monitor($time, "var_range_upper_in  = %d", var_range_upper_in);
### Simulation result for all variations:
#### Without variation:
<img src = "Without variation.png" height=400 width=200>

#### With variation:
<img src="With variation.png" height=400 width=200>
#include<iostream>
using namespace std;

int main(){
	cout << "Enter 2 numbers: " << endl;
	int a,b;
	cin >> a >> b;
	cout << "You entered the following numbers: " << a << " " << b << endl;


	return 0;
}
#include<iostream>
using namespace std;

int main(){
	int counter =0;
	for(int i =0; i <=100; i++){
		if(i % 2 == 0){
			cout << i << " ";
			counter ++;
		}
		if(counter == 10){
			break;
		}
	}
}
#include<iostream>
using namespace std;

int main(){
	int a,b;
	cout << "Enter the first number: " << endl;
	cin >> a;
	cout << "Enter the second number: " <<endl;
	cin >> b;

	int sum = a+b;
	cout << a << " + " << b << " = " << sum << endl;

	int difference = a - b;
	cout << a << " - " << b << " = " << difference << endl;

	int product = a*b;
	cout << a << " * " << b << " = " << product << endl;

	int quotient = a/b;
	cout << a << " / " << b << " = " << quotient << endl;

	int remainder = a%b;
	cout << a << " % " << b << " = " << remainder << endl;

	int a_pow_b = a*b;
	cout << a << " to the power of " << b << " = " << a_pow_b << endl;
}
#include<iostream>
using namespace std;

int main(){
	// Initialize variables
	int counter = 1;
	int sum = 0;

	// While loop
	while(counter <= 10){
		int x;
		cout << "Enter a number: " << endl;
		cin >> x;

		sum += x;

		cout << "The sum is : " << sum << endl;

		counter ++;
	}
}
#include<iostream>
using namespace std;

int main(){
	// Assign input to variable
	int x = 10;
}
#include<iostream>
using namespace std;

int main(){
	int a,b;
	cout << "Enter the first number: " << endl;
	cin >> a;
	cout << "Enter the second number: " <<endl;
	cin >> b;

	int sum = a+b;
	cout << a << " + " << b << " = " << sum << endl;

	int difference = a - b;
	cout << a << " - " << b << " = " << difference << endl;

	int product = a*b;
	cout << a << " * " << b << " = " << product << endl;

	int quotient = a/b;
	cout << a << " / " << b << " = " << quotient << endl;

	int remainder = a%b;
	cout << a << " % " << b << " = " << remainder << endl;

	int a_pow_b = a*b;
	cout << a << " to the power of " << b << " = " << a_pow_b << endl;
}
#include<iostream>
using namespace std;

int main(){
	// Initialize variables
	int counter = 1;
	int sum = 0;

	// While loop
	while(counter <= 10){
		int x;
		cout << "Enter a number: " << endl;
		cin >> x;

		sum += x;

		cout << "The sum is : " << sum << endl;

		counter ++;
	}
}
#include<stdio.h>

int main(){
	printf("Welcome To The Best C World!\n");
}
import math

def get_input_from_user(default_value, message, type = str):
    try:
        input_value = input(message)
    except:
        input_value=default_value
    if input_value == "":
        return default_value

    if type == int:
        return int(input_value)
    elif type == float:
        return float(input_value)
    else:
        return input_value

def get_num_of_digits(n):
    if n == 0:
        return 1
    return math.ceil(math.log10(abs(n)))

def get_num_of_digits_for_num_str(input_str):
    if input_str == "":
        return 0
    return len(input_str)
import random
import matplotlib.pyplot as plt
def main():
    while True:
        num = input("Enter a number between 1 and 100: ")
        if num == "exit":
            break
        num = int(num)
        if num < 1 or num > 100:
            print("Please enter a number between 1 and 100.")
            continue
        random_num = random.randint(1, 100)
        print("Your number, " + str(num) + ", is", end="")
        if num > random_num:
            print(" bigger than the random number")
        elif num < random_num:
            print(" smaller than the random number")
        else:
            print(" the same as the random number")

def main2():
    x = 0
    y = 1
    count = 1
    for i in range(100):
        x = x + 1
        y = y + 0.5
        count += 1
        plt.plot(x,y,color='blue')
    print(count)
    plt.show()

def main3():
    x = 0
    y = 1
    count = 0
    while True:
        key = input("key: ")
        if key == "1":
            print(x)
        elif key == "2":
            print(y)
        elif key == "exit":
            break
        else:
            x = x + 1
            y = y + 0.5
            count