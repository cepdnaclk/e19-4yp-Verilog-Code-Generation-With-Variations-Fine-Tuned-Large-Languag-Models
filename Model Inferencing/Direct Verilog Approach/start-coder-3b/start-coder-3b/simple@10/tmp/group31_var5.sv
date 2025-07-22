module func1(x1, x2, x3, f);
input x1, x2, x3;
output logic signed f;
assign f = (~x1 & ~x2 & x3) | (~x1 & x2 & ~x3) | (x1 & ~x2 & x3) | (x1 & x2 & ~x3);
endmodule
### Test Instructions:
1. Use the verilator to build the executable file and then execute the file.
2. In the terminal, run the command:./verilator_exec
3. This program will generate the output file as func1_out.txt. To view the output, run the file: cat func1_out.txt
4. Note: You must have the.v file, func1_in.txt, and Makefile in the same directory.
/Lab11/lab11_solution_p1.c
#include <stdio.h>
#include<time.h>
#include<stdlib.h>

// Define the size of the array
#define N 16

// Declare the function
void gen_rand_array(int * const);
void print_array(int *);
void merge(int *, int, int, int);
void merge_sort(int *, int, int);

int main()
{
   // Create the array that will hold the random numbers
   int array1[N];
   int index;
   int i;
   // Randomly generate the numbers for the array1
   gen_rand_array(array1);
   // Print the array before the sorting
   printf("Before: ");
   print_array(array1);
   // Use the merge sort function to sort the array
   merge_sort(array1, 0, N-1);
   // Print the array after the sorting
   printf("After: ");
   print_array(array1);
   return 0;
}

/*
   The merge_sort function uses the merge function to sort the array
   The function takes in the array to be sorted, the start and end index of the sub-array
   The function returns nothing
*/
void merge_sort(int * const array, const int start, const int end)
{
   // Declare i, j, and k
   int i, j, k;
   // Set i as the start index of the first sub-array
   i = start;
   // Set j as the end index of the second sub-array
   j = (start + end) / 2;
   // Set k as the end index of the sub-array
   k = end;
   // Check if the start index is less than the end index
   if (start < end)
   {
      // Call the merge_sort function recursively to sort the two sub-arrays
      merge_sort(array, start, j);
      merge_sort(array, (j + 1), end);
      // Call the merge function to merge the two sorted sub-arrays
      merge(array, i, j, k);
   }
}

/*
   The merge function takes in the array to be sorted, start, j, and k
   The function returns nothing
*/
void merge(int * const array, const int i, const int j, const int k)
{
   // Declare two index variables and the size of the first and second sub-arrays
   int p1, p2, size1, size2;
   // Set the size of the first sub-array to the middle minus the start index
   size1 = j - i;
   // Set the size of the second sub-array to the end minus the middle
   size2 = k - j;
   // Create two sub-arrays of the same sizes as the arrays to be sorted
   int *sub1 = malloc(si
   // Loop through the sub-array starting from the start index
   for(i = 0; i < size1; i++)
   {
      // Assign the elements at index i to sub-array 1
      sub1[i] = array[i + i];
   }
   // Loop through the second sub-array starting from the start index
   for(i = 0; i < size2; i++)
   {
      // Assign the element at index i to sub-array 2
      sub2[i] = array[i + j + 1];
   }
   // Free the sub-array memory
   free(sub1);
   free(sub2);
   // Set i as the start index of the first sub-array
   i = 0;
   // Set j as the start index of the second sub-array
   j = 0;
   // Set k as the start index of the sorted array
   k = i;
   // Loop to merge the two sub-arrays
   while(i < size1 && j < size2)
   {
      // Check if the element at index i in sub-array 1 is less than the element at index j in sub-array 2
      if(sub1[i] < sub2[j])
      {
         // Assign the element at index i in sub-array 1 to the element at index k in the sorted array
         array[k] = sub1[i];
         // Increment i and k
         i++;
         k++;
      }
      else
      {
         // Assign the element at index j in sub-array 2 to the element at index k in the sorted array
         array[k] = sub2[j];
         // Increment j and k
         j++;
         k++;
      }
   }
   // Loop to merge the remaining elements of the first sub-array
   while(i < size1)
   {
      // Assign the element at index i in sub-array 1 to the element at index k in the sorted array
      array[k] = sub1[i];
      // Increment i and k
      i++;
      k++;
   }
   // Loop to merge the remaining elements of the second sub-array
   while(j < size2)
   {
      // Assign the element at index j in sub-array 2 to the element at index k in the sorted array
      array[k] = sub2[j];
      // Increment j and k
      j++;
      k++;
   }
}

/*
   The gen_rand_array function takes in the array to be filled with random numbers
   The function returns nothing
*/
void gen_rand_array(int * const array)
{
    int i;
    // Seed the random number generator
    srand(time(NULL));
    // Loop to fill the array with random numbers between 0 and 100
    for(i = 0; i < N; i++)
    {
        // Assign a random number to the array element
        array[i] = rand() % 100;
    }
}

/*
   The print_array function takes in the array to be printed
   The function returns nothing
*/
void print_array(int * array)
{
    int i;
    int size = sizeof(array) / sizeof(int);
    // Loop to print each element of the array
    for(i = 0; i < size; i++)
    {
        // Print the array element
        printf("%d ", array[i]);
    }
    // Print a newline character
    printf("\n");
}ze1 * sizeof(int));
   int *sub2 = malloc(size2 * sizeof(int));
   int i;
   // Loop to fill the sub-array 1
   for(i = 0; i < size1; i++)
   {
      // Assign the element at index i to sub-array 1
      sub1[i] = array[i + i];
   }
   // Loop to fill the sub-array 2
   for(i = 0; i < size2; i++)
   {
      // Assign the element at index i to sub-array 2
      sub2[i] = array[i + j + 1];
   }
   // Free the sub-array memory
   free(sub1);
   free(sub2);
   // Call the merge function recursively to merge the two sub-arrays
   merge_sort(array, i, j, k);
   merge_sort(array, (j + 1), k);
   // Call the merge function to merge the two sorted sub-arrays
   merge(array, i, j, k);
}

/*
   The merge function takes in the array to be sorted, start, j, and k
   The function returns nothing
*/
void merge(int * const array, const int i, const int j, const int k)
{
   // Declare three index variables and the size of the sorted array
   int p1, p2, size1, size2, size3;
   // Set the size of the first sub-array to the middle minus the start index
   size1 = j - i;
   // Set the size of the second sub-array to the end minus the middle
   size2 = k - j;
   // Allocate memory for the third sub-array
   int *sub1 = malloc(size1 * sizeof(int));
   int *sub2 = malloc(size2 * sizeof(int));
   int i;/HW2/HW2_Q2_part4_answer.c
#include <stdio.h>
#include <stdlib.h>

// Declare the data type
typedef struct data {
    int a;
    int b;
    int c;
    int