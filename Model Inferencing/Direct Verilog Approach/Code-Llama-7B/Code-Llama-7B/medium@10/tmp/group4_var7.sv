module jkflipflop(
  output out1,out2,clock,reset,
  input [1:0] switch1, switch2
);
  wire notin1, notin2, nor3out, nor4out, nor3norflipout, nor4norflipout;
  wire nor3norflip, nor4norflip;
  nor3NMOS nor3norflipinst(notin2, switch1[0], switch1[1], nor3norflip);
  nor3NMOS nor3norflipinst2(notin1, nor3norflip, nor4norflip, nor3norflipout);
  nor3NMOS nor4norflipinst(notout2, nor3norflip, nor4norflip, nor4norflipout);
  nor3NMOS nor4norflipinst2(notout1, nor4norflip, switch2[1], nor4norflip);
  notgate notinst1(notin1, switch2[0]);
  notgate notinst2(notin2, switch1[1]);
  notgate notinst3(notout1, clock);
  notgate notinst4(notout2, reset);
  andNMOS andinst1(out1, notin1, nor3norflipout);
  andNMOS andinst2(out2, notin2, nor4norflipout);
endmodule
### Discussion / Commentary
##### 1. What is the purpose of adding the case statement?
##### 2. What do you think is the difference between the index and the function call result for the case statement index?
##### 3. What happens if the index is an input?
##### 4. What happens if the index is a constant?
##### 5. What is the purpose of the pullup/pulldown devices?
##### 6. Is a pullup device required for an output?
##### 7. What are some other uses for pullup/pulldown devices?
##### 8. What happens if the function call result is used in a pullup/pulldown device?
##### 9. Why are the devices for the case statement necessary?
##### 10. Why is there no pullup/pulldown device inside the nmos or notgate instances?
##### 11. How is the nor3norflipreg needed if nor3norflipout is also used?
##### 12. What happens if the nor3norflip and nor4norflip wires are connected directly to each other instead of being connected to nor3norflipinst and nor4norflipinst?
##### 13. Why is the reg (register) needed? Would it work if it was removed?
##### 14. What happens to the inputs of the inside notgate instances if just the nmos instances are used?
##### 15. What happens to the inputs of the inside nmos instances if just the notgate instances are used?
##### 16. Why is the reg needed for the notgate instances as well?
##### 17. How can you see if the output of the instances is what you expect?
##### 18. Would it work to have a notgate with an input of an output from an NOR gate?
##### 19. What would happen if the wire is removed from the jkflipflop and replaced with an input?
##### 20. Would it work to have a notgate with an input of an output from an NOR gate?
##### 21. What would happen if the jkflipflop was just an AND gate with an input of an output from a NOR gate?
##### 22. What would happen if the jkflipflop was just an AND gate with an input of an output of an NOR gate?
##### 23. What would happen if the jkflipflop was just an AND gate with an input of an output of a NOR gate and another AND gate?
##### 24. What are the inputs of the jkflipflop instances?
##### 25. What is the output of the jkflipflop instances?
##### 26. What are the differences between an input and an output?
##### 27. Do you think a pullup device is needed on a notgate input?
#####