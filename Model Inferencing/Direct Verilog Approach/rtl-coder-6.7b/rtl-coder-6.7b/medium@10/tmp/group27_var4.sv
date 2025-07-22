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
### Pattern Found:
![image](https://user-images.githubusercontent.com/79760781/140953273-6c8683bf-4964-4d17-b57c-8c4ce43b0508.png)
### Report Found:
![image](https://user-images.githubusercontent.com/79760781/140953560-50822133-d340-438b-9266-af0122e6022e.png)
### Variation Report Found:
![image](https://user-images.githubusercontent.com/79760781/140953884-a112a06f-ce18-427b-b430-0442738b9a48.png)