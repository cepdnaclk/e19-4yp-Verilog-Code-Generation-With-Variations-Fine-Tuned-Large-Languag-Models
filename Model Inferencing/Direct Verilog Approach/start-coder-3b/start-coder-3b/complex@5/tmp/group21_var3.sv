module Prob_6_10_Counter (Count_Counter, clk, rst);
// Sequential binary counter
output [4: 0] Count_Counter;
input clk, rst;
reg [5: 0] Count_Counter;
always @ (posedge clk) if (rst) Count_Counter <= 0; else Count_Counter <= Count_Counter + 1;
always @(Count_Counter) if (unsigned(Count_Counter) inside {0,4,16,64,256,1024,4096,16384}) Count_Counter <= 0;
endmodule
## References:

[1]  and. Digital Design, Fifth Edition. McGraw-Hill Education, 2012.

[2], ECE423/523. Fundamentals of Digital Design: Design Methodology, Implementation, and Applications, Second Edition, Cengage Learning, 2016.

[3],,,. Electronics and Design. McGraw-Hill Education, 2013.

[4],,. Computer Organization and Design, Fifth Edition. Pearson Prentice Hall, 2016.

[5]  and. Digital System Design and Architecture, Fourth Edition. Pearson, 2016.

[6]. Digital Design: An Introduction. Pearson, 2016.

[7],,. Circuit Design and Simulation, Fifth Edition. Pearson, 2012.

[8],. Digital Design: An Introduction. Pearson, 2012.

[9]  and. Digital System Design, Second Edition. McGraw-Hill Education, 2012.

[10].  and. Modern Digital System Design, Third Edition. Pearson, 2015.

[11]  and. Digital Design: Modeling, Analysis, and Digital Integrated Circuits, Third Edition, McGraw-Hill Education, 2012.

[12]. Introduction to Digital Design. Pearson, 2013.

[13]. Digital System Design. Pearson, 2016.

[14]. Digital Design. Pearson, 2016.

[15]. Digital System Design. Pearson, 2016.

[16]. Digital Design. Pearson, 2016.

[17],,. Modern Digital System Design, Third Edition. Pearson, 2012.

[18]. Digital System Design. Pearson, 2016.

[19], and. Digital System Design. Pearson, 2016.

[20]. Digital Design: An Introduction. Pearson, 2012.

[21]. Digital System Design, Second Edition. McGraw-Hill Education, 2012.

[22]. Digital Design: Modeling, Analysis, and Digital Integrated Circuits, Fifth Edition, McGraw-Hill Education, 2016.

[23]. Introduction to Digital Design.