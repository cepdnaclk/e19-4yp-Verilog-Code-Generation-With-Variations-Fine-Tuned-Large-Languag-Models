module Problem8(input  [3:0] a, b, output [3:0] diff);
  packed struct {
    reg [3:0] x, y, z;
  } diff;
endmodule
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>

#include "y86.h"

uint32_t execute_call(uint32_t *registers, code_t *code, uint32_t address, int32_t offset) {
  uint32_t ip;   // instruction pointer
  uint32_t sp;   // stack pointer
  uint32_t ret;  // return address
  uint32_t size; // size of the function we call

  /* Check if the stack pointer is valid: it must be less than the stack top
     This test is not required for the full solution */

  /* Check if the address of the call is in the same segment the call is
     being made in.  Make sure that the offset is within the segment. */

  /* Make sure that there is room to put the return address on the stack */

  /* Store the return address onto the stack, and save the return address */

  /* Set the instruction pointer to the address field of the instruction
     that called this function */

  /* Update the stack pointer */

  /* Modify the flags in the EFLAGS register to reflect the result of the
     function being called */

  /* Return the value calculated by the function being called */
}

int main(void) {
  int32_t offset[3];
  int32_t offset2;
  uint32_t stacktop = 0x00403000;
  uint32_t registers[NUM_REGISTERS];
  code_t code;
  uint32_t *segments;
  segment_t segment;
  uint32_t i;
  uint32_t address;
  uint32_t result;
  uint32_t return_address;

  /* Initialize the values of the array of code segments */

  segment.num_bytes = 0x004000c8;
  segment.bytes     = (uint8_t*)malloc(sizeof(uint8_t) * segment.num_bytes); 
  memcpy(segment.bytes, code_bin, segment.num_bytes);
  segments = (uint32_t*)malloc(sizeof(uint32_t) * NUM_CODE_SEGMENTS);
  segments[0] = (uint32_t)segment.bytes;
  segments[1] = (uint32_t)segment.bytes + segment.num_bytes;
  segments[2] = (uint32_t)segment.bytes + 2*segment.num_bytes;
  segments[3] = (uint32_t)segment.bytes + 3*segment.num_bytes;
  segments[4] = (uint32_t)segment.bytes + 4*segment.num_bytes;

  /* Set the segment register to point to the 0th segment */

  /* Set the instruction pointer to point to code segment 0's program counter */

  /* Call the function to execute the first instruction */

  /* Check for a branch */

  /* If the branch was taken, set the program counter to the target
     address, otherwise set it to the next instruction. */

  /* Check for a function call */

  /* If a function call was made, execute the call and then skip the next
     instruction. Otherwise, skip the next instruction. */

  /* If we've finished all the instructions in this code segment, return
     back to the caller (the code that called this function). */

  /* Update the flags to reflect the function's result if a function
     call was made */

  /* Check for a value in the EFLAGS register.  If it is 1, set the EFLAGS
     register back to 0, otherwise leave it the same. */

  /* Save the return address on the stack and update the stack pointer */

  /* Return from the function */

  /* Check if the stack pointer is valid: it must be less than the stack
     top */

  /* Update the instruction pointer to the address saved in the stack */

  /* Restore the stack pointer */


  /* Call the function to execute the second instruction */

  /* Check for a branch */

  /* If the branch was taken, set the program counter to the target
     address, otherwise set it to the next instruction. */

  /* Check for a function call */

  /* If a function call was made, execute the call and then skip the next
     instruction. Otherwise, skip the next instruction. */

  /* If we've finished all the instructions in this code segment, return
     back to the caller (the code that called this function). */

  /* Update the flags to reflect the function's result if a function
     call was made */

  /* Check for a value in the EFLAGS register.  If it is 1, set the EFLAGS
     register back to 0, otherwise leave it the same. */

  /* Save the return address on the stack and update the stack pointer */

  /* Return from the function */

  /* Check if the stack pointer is valid: it must be less than the stack
     top */

  /* Update the instruction pointer to the address saved in the stack */

  /* Restore the stack pointer */


  /* Call the function to execute the second instruction */

  /* Check for a branch */

  /* If the branch was taken, set the program counter to the target
     address, otherwise set it to the next instruction. */

  /* Check for a function call */

  /* If a function call was made, execute the call and then skip the next
     instruction. Otherwise, skip the next instruction. */

  /* If we've finished all the instructions in this code segment, return
     back to the caller (the code that called this function). */

  /* Update the flags to reflect the function's result if a function
     call was made */

  /* Check for a value in the EFLAGS register.  If it is 1, set the EFLAGS
     register back to 0, otherwise leave it the same. */

  /* Save the return address on the stack and update the stack pointer */

  /* Return from the function */

  /* Check if the stack pointer is valid: it must be less than the stack
     top */

  /* Update the instruction pointer to the address saved in the stack */

  /* Restore the stack pointer */


  /* Call the function to execute the third instruction */

  /* Check for a branch */

  /* If the branch was taken, set the program counter to the target
     address, otherwise set it to the next instruction. */

  /* Check for a function call */

  /* If a function call was made, execute the call and then skip the next
     instruction. Otherwise, skip the next instruction. */

  /* If we've finished all the instructions in this code segment, return
     back to the caller (the code that called this function). */

  /* Update the flags to reflect the function's result if a function
     call was made */

  /* Check for a value in the EFLAGS register.  If it is 1, set the EFLAGS
     register back to 0, otherwise leave it the same. */

  /* Save the return address on the stack and update the stack pointer */

  /* Return from the function */

  /* Check if the stack pointer is valid: it must be less than the stack
     top */

  /* Update the instruction pointer to the address saved in the stack */

  /* Restore the stack pointer */


  /* Call the function to execute the third instruction */

  /* Check for a branch */

  /* If the branch was taken, set the program counter to the target
     address, otherwise set it to the next instruction. */

  /* Check for a function call */

  /* If a function call was made, execute the call and then skip the next
     instruction. Otherwise, skip the next instruction. */

  /* If we've finished all the instructions in this code segment, return
     back to the caller (the code that called this function). */

  /* Update the flags to reflect the function's result if a function
     call was made */

  /* Check for a value in the EFLAGS register.  If it is 1, set the EFLAGS
     register back to 0, otherwise leave it the same. */

  /* Save the return address on the stack and update the stack pointer */

  /* Return from the function */

  /* Check if the stack pointer is valid: it must be less than the stack
     top */

  /* Update the instruction pointer to the address saved in the stack */

  /* Restore the stack pointer */


  /* Call the function to execute the fourth instruction */

  /* Check for a branch */

  /* If the branch was taken, set the program counter to the target
     address, otherwise set it to the next instruction. */

  /* Check for a function call */

  /* If a function call was made, execute the call and then skip the next
     instruction. Otherwise, skip the next instruction. */

  /* If we've finished all the instructions in this code segment, return
     back to the caller (the code that called this function). */

  /* Update the flags to reflect the function's result if a function
     call was made */

  /* Check for a value in the EFLAGS register.  If it is 1, set the EFLAGS
     register back to 0, otherwise leave it the same. */

  /* Save the return address on the stack and update the stack pointer */

  /* Return from the function */

  /* Check if