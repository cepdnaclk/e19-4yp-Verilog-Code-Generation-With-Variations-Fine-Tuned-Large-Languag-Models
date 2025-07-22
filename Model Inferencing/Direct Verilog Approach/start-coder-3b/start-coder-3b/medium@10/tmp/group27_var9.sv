```
module aoi_gate(o,a1,a2,b1,b2);
input a1,a2,b1,b2;// a1,a2,b1,b2 form the input
//ports of the module
output o;//o is the single output port of the module
wire o1,o2;//o1 and o2 are intermediate signals
//within the module
and g1(o1,a1,a2); //The AND gate primitive has two
and g2(o2,b1,b2);// instantiations with assigned
//names g1 & g2.
nor g3(o,o1,o2);//The nor gate has one instantiation
//with assigned name g3.
endmodule
```
### Result:
![image](https://user-images.githubusercontent.com/45888540/121716141-cc59d300-cb0d-11eb-8103-502454411be9.png)

endmodule
/FPGA/Verilog code/code_3/code_3_1.v
module code_3_1 (output_1,input_74, input_75, input_76, input_77);
wire output_1, input_74, input_75, input_76;
wire input_77;
wire q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26;
wire q27,q28,q29,q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,q40,q41,q42;
wire q43,q44,q45,q46,q47,q48,q49,q50,q51,q52,q53,q54,q55,q56,q57,q58;
wire q59,q60,q61,q62,q63,q64,q65,q66,q67,q68,q69,q70,q71,q72,q73,q74;
wire q75,q76,q77,q78,q79,q80,q81,q82,q83,q84,q85,q86,q87,q88,q89,q90;
wire q91,q92,q93,q94,q95,q96,q97,q98,q99,q100,q101,q102,q103;
wire_or (output_1, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31, q32, q33, q34, q35, q36, q37, q38, q39, q40, q41, q42, q43, q44, q45, q46, q47, q48, q49, q50, q51, q52, q53, q54, q55, q56, q57, q58, q59, q60, q61, q62, q63, q64, q65, q66, q67, q68, q69, q70, q71, q72, q73, q74, q75, q76, q77, q78, q79, q80, q81, q82, q83, q84, q85, q86, q87, q88, q89, q90, q91, q92, q93, q94, q95, q96, q97, q98, q99, q100, q101, q102, q103);
wire_and (q11, input_74, q12);
wire_and (q13,  q12, q14);
wire_and (q15, q14, q16);
wire_and (q17,q16,q18);
wire_and (q19,q18,q20);
wire_and (q21,q20,q22);
wire_and (q23,q22,q24);
wire_and (q25,q24,q26);
wire_and (q27,q14,q28);
wire_and (q29,q28,q30);
wire_and (q31,q30,q32);
wire_and (q33,q32,q34);
wire_and (q35,q34,q36);
wire_and (q37,q36,q38);
wire_and (q39,q38,q40);
wire_and (q41,q20,q42);
wire_and (q43,q42,q44);
wire_and (q45,q44,q46);
wire_and (q47,q46,q48);
wire_and (q49,q48,q50);
wire_and (q51,q50,q52);
wire_and (q53,q52,q54);
wire_and (q55,q42,q56);
wire_and (q57,q56,q58);
wire_and (q59,q58,q60);
wire_and (q61,q60,q62);
wire_and (q63,q62,q64);
wire_and (q65,q64,q66);
wire_and (q67,q44,q68);
wire_and (q69,q68,q70);
wire_and (q71,q70,q72);
wire_and (q73,q72,q74);
wire_and (q75,q56,q76);
wire_and (q77,q76,q78);
wire_and (q79,q78,q80);
wire_and (q81,q80,q82);
wire_and (q83,q82,q84);
wire_and (q85,q84,q86);
wire_and (q87,q86,q88);
wire_and (q89,q88,q90);
wire_or (q91, q75, q77, q79, q81, q83, q85, q87, q89);
wire_and (q92, q91, q93);
wire_and (q94, q93, q95);
wire_and (q96, q95, q97);
wire_and (q98, q97, q99);
wire_and (q100, q99, q101);
wire_and (q102, q101, q103);
wire_and (q75, q102, q104);
wire_and (q77,q75,q76);
wire_and(q79,q77,q78);
wire