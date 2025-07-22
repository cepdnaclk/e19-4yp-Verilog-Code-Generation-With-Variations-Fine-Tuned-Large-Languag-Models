module jk(c,q,s,t,d,e,f,g);
  input c,q,s,t;
  output d,e,f,g;
  assign d = s;
  assign e = t;
  assign f = c & q;
  assign g = c | q;
endmodule
#include<iostream>
//
//A01023450

using namespace std;

int main(){
	int num, count = 0;
	cout << "Enter a positive integer: ";
	cin >> num;
	while (count < num){
		count++;
		cout << count << "\n";
	}
	return 0;
}
#include <iostream>
//
//A01023450

using namespace std;

int main(){
	int num;
	cout << "Enter a positive integer: ";
	cin >> num;
	int count = 0;
	while (count < num){
		count++;
		if (count % 3 == 0){
			if (count % 5 == 0){
				cout << "FizzBuzz\n";
			}else{
				cout << "Fizz\n";
			}
		}
		else if (count % 5 == 0){
			cout << "Buzz\n";
		}else{
			cout << count << "\n";
		}
	}
	ret;
}
urn 0d the code for the 1000 mile loop.
//Then I took the output of my computer and calculated my mileage by hand and got 11.3

using namespace std;

int main(){
	int k = 1;
	int time;
	int distance;

	time = 299792.458;
	distance = 100000000;
	cout << "time(in seconds): " << time << endl;
	cout << "distance(in km): " << distance << endl;
	cout << "time(in miles): " << time / 60 << endl;
	cout << "distance(in miles): " << distance / 1609 << endl;
	cout << "speed(in miles/h):" << distance / time * 60 << endl;
	cout << "speed(in km/h):" << distance / time << endl;
	cout << "average speed(in km/h):" << distance / time << endl;

	return 0;
}
#include <iostream>
//
//A01023450

//I started by using the formula for time which is 
//t = (d / 100000000) * (60 / 299792.458)
//Then I used t to fin#include <iostream>
#include <iomanip>
//
//A01023450

using namespace std;

int main(){
	char name[30];
	char major[30];
	int hours;
	double gpa;
	cout << "Name: ";
	cin.getline(name, 30);
	cout << "Major: ";
	cin.getline(major, 30);
	cout << "Number of hours: ";
	cin >> hours;
	cout << "GPA: ";
	cin >> gpa;
	cout << "\n"
	<< "Name: " << name << "\n"
	<< "Major: " << major << "\n"
	<< "Number of hours in this semester: " << hours << "\n"
	<< "GPA for this semester: " << setprecision(2) << gpa << "\n";
	

	return 0;
}
endl;
	cout << "5. " << array[4] << endl;
	cout << "6. " << array[5] << endl;
	cout << "7. " << array[6] << endl;
	cout << "8. " << array[7] << endl;
	cout << "9. " << array[8] << endl;
	cout << "10. " << array[9] << endl;

	return 0;
}
#include <iostream>
//
//A01023450

using namespace std;

int main(){
	string array[10];

	cout << "Enter 10 string elements: " << endl;
	for (int i = 0; i <10; i++){
		cin >> array[i];
	}
	cout << "\n\n" << endl;

	cout << "1. " << array[0] << endl;
	cout << "2. " << array[1] << endl;
	cout << "3. " << array[2] << endl;
	cout << "4. " << array[3] << #include <iostream>
//
//A01023450

using namespace std;

int main(){
	int num;
	int count = 1;
	cout << "Enter a positive integer: ";
	cin >> num;
	while (count < num){
		count++;
		if (count % 3 == 0 && count % 5 == 0){
			cout << "FizzBuzz\n";
		}
		else if (count % 3 == 0){
			cout << "Fizz\n";
		}
		else if (count % 5 == 0){
			cout << "Buzz\n";
		}
		else{
			cout << count << "\n";
		}
	}
	return 0;
}

		cout << "Number of hours in this semester: " << hours << endl;
		cout << "GPA for this semester: " << setprecision(2) << gpa << endl;

	}
	return 0;
}
#include <iostream>
//
//A01023450

using namespace std;

int main(){
	char name[30];
	char major[30];
	int hours;
	double gpa;
	cout << "Name: ";
	cin.getline(name, 30);
	cout << "Major: ";
	cin.getline(major, 30);
	cout << "Number of hours in this semester: ";
	cin >> hours;
	cout << "GPA for this semester: ";
	cin >> gpa;
	cout << "\n"
	<< "Name: " << name << endl
	<< "Major: " << major << endl#include <iostream>
//
//A01023450

using namespace std;

int main(){
	int hours;
	int minutes;
	int seconds;
	cout << "Enter the number of hours: ";
	cin >> hours;
	cout << "Enter the number of minutes: ";
	cin >> minutes;
	cout << "Enter the number of seconds: ";
	cin >> seconds;
	int total t << "It is " << total << " seconds in total" << endl;

	return 0;
}
= (hours * 3600) + (minutes * 60) + seconds;
	cou#include <iostream>
//
	cout << "Enter the number of meters: ";
	cin >> meters;
	cout << meters << "m is " << meters*3.281 << " feet" << endl;

	return 0;
}

//A01023450

using namespace std;

int main(){
	int meters;#include <iostream>
//
//A01023450