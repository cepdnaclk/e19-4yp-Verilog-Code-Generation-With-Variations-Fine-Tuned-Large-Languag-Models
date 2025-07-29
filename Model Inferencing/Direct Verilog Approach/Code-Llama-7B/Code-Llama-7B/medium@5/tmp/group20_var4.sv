\begin{verbatim}
module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else Count = Count + 1;
end
always @(Count[2]) Count[2:0] = Count[1:0];
endmodule

\end{verbatim}
### Final Verilog Implementation:
\begin{verbatim}
module Chap1Counter (Clk, Reset, Count);
input Clk, Reset;
output [3:0] Count;
reg [3:0] Count;
always @(posedge Clk) begin
    if(Reset) Count = 0;
    else Count = Count + 1;
end
always @(Count[2]) begin
    Count[2:0] = Count[1:0];
end
endmodule
\end{verbatim}
### Comments:
The procedural assignment within the final block now behaves as an always block.
The code now reads as:
* The input bit from Count[2] is used to slice the Count register.
* The result of the slice is assigned to the Count register.

### References:
* Section 8.5.2.1 of the 1800-2012 LRM

### Table of Contents:
[1. Introduction](#1-introduction)   
[2. Instructions and Example for the Finals Examination](#2-instructions-and-example-for-the-finals-examination)   
[3. The Finals Examination](#3-the-finals-examination)   
[4. Final Examination Answer](#4-final-examination-answer)   
[5. Exercises](#5-exercises)   
[6. Exercises Solution](#6-exercises-solution)   
[7. Example Exercises](#7-example-exercises)   
[8. Example Exercises Solution](#8-example-exercises-solution)   
[References](#9-references) 



### 1. Introduction


### 2. Instructions and Example for the Finals Examination

* The finals examination will be held according to the same format as the [practice session](/verilog/session2/session2/).
* The examination will be conducted simultaneously in an online format with the participant(s) and an examiner(s).
* The exam will be conducted as one question at a time.
* The online exam will be timed. The examiner(s) will monitor the timers during the exam.
* The questions will be released online 30 days in advance of the examination.
* The questions will be presented as a multiple-choice question.
* The examination will consist of 150 to 250 questions.
* The examination will be weighted approximately 15% to 25%.
* The examination will be conducted remotely through a web-based portal that can be accessed from any computer or mobile device (tablet, smartphone, etc.) that has an internet connection.
* The exam is untimed. The exam will have 40 minutes in total.
* The exam will be an open book exam. The examiner(s) may ask the participant(s) to make their own notes or drawings, but will generally not have access to, and will not be able to review, other notes or drawings made by the participant(s).
* The participant(s) will have a moderate level of interaction with the examiner(s) and may ask questions.
* The exam may be given more than once. The participant(s) will be asked to indicate if they would like to retake the exam at the beginning of the exam. The participant(s) will be asked if they would like to retake the exam only once.
* The exam could be given multiple times, but only once at a time.
* The participant(s) will be asked to read the instructions before starting the exam. The participant(s) will be asked to turn on the webcam. The participant(s) will be asked to complete the exam before the time limit of 1 hour begins.
* The participant