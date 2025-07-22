```SystemVerilog
module wire_array_output_input_3( input wire [4:0] in[4:0], output wire [6:0] out[6:0] );
    assign out[0:1] = in[0:1];
endmodule

```
/Project 3/code/main.c
/* File: main.c
 * Description: 
 *      Main function for program.
 *      Reads the command line arguments and calls corresponding functions.
 * Parameters:
 *      argc: argument count
 *      argv: argument vector
 * Return:
 *      EXIT_SUCCESS: success
 *      EXIT_FAILURE: failure
 */

#include "mystring.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include "bstree.h"


int main( int argc, char* argv[] )
{
    // check to see if user entered correct number of arguments
    if( argc!= 2 )
    {
        printf( "Usage:./main input_file_name\n" );
        return EXIT_FAILURE;
    }

    // set the seed
    srand( time( NULL ) );

    // declare variables
    FILE* inputFile;
    char inputFileName[100];
    char command;
    char* commandInput;
    long long commandNumber;
    FILE* outputFile;
    char outputFileName[100];

    // open the input file
    strcpy( inputFileName, argv[1] );
    inputFile = fopen( inputFileName, "r" );

    // if the input file does not open, display error message to user
    if( inputFile == NULL )
    {
        printf( "Cannot open file: %s\n", inputFileName );
        return EXIT_FAILURE;
    }

    // get the output file name from user
    printf( "Please enter the name of the output file:\n" );
    scanf( " %s", outputFileName );

    // open the output file
    outputFile = fopen( outputFileName, "w" );

    // check if the output file can be opened
    if( outputFile == NULL )
    {
        printf( "Cannot open file: %s\n", outputFileName );
        return EXIT_FAILURE;
    }

    // parse the commands in the input file
    while( fscanf( inputFile, " %c %lld", &command, &commandNumber )!= EOF )
    {
        // call parse_command function
        parse_command( command, commandNumber, outputFile );
    }

    // close all of the files
    fclose( inputFile );
    fclose( outputFile );

    // return success
    return EXIT_SUCCESS;
}

/* Function: parse_command
 * Description: 
 *      Reads and parses the command from the input file.
 * Parameters:
 *      command: the command that is to be parsed
 *      commandNumber: the number associated with the command
 *      outputFile: the output file
 * Return:
 *      void
 */
void parse_command( char command, long long commandNumber, FILE* outputFile )
{
    // switch statement determines which function to call
    switch( command )
    {
        // case to create a new tree
        case 'C':
            // create new tree
            create_tree( commandNumber, outputFile );
            break;

        // case to insert a new node into the tree
        case 'I':
            // insert a new node into the tree
            insert_node( commandNumber, outputFile );
            break;

        // case to search for a node in the tree
        case 'S':
            // search for a node in the tree
            search_tree( commandNumber, outputFile );
            break;

        // case to delete a node from the tree
        case 'D':
            // delete a node from the tree
            delete_node( commandNumber, outputFile );
            break;

        // case to destroy the tree
        case 'K':
            // destroy the tree
            destroy_tree( commandNumber );
            break;

        // default
        default:
            // return a failure response
            fprintf( outputFile, "Please enter a valid command.\n" );
            break;
    }
}

/* Function: create_tree
 * Description: 
 *      Creates a new binary search tree and sets min and max to the given number.
 * Parameters:
 *      commandNumber: the number that is to be used for min/max
 *      outputFile: the output file
 * Return:
 *      void
 */
void create_tree( long long commandNumber, FILE* outputFile )
{
    // create a new tree
    root = new_bstree( commandNumber );

    // set min and max to the given number
    min = commandNumber;
    max = commandNumber;

    // return a success response
    fprintf( outputFile, "New tree created.\n" );
}

/* Function