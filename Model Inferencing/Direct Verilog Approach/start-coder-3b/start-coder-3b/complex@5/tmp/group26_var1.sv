```
module DutyCycle (output[1:0] AdjustFreq, input ClockIn, Reset);
reg[1:0] Adjr;
assign AdjustFreq = Adjr;
reg[1:0] HiCount;
always @(ClockIn, Reset)
if (Reset==1'b1)
    begin
        Adjr = 2'b01;
        HiCount = 2'b0;
    end
else if (ClockIn==1'b1) 
        HiCount = HiCount + 2'b01;
else begin
case (HiCount)
    2'b00: Adjr = 2'b11;
    2'b01: Adjr = 2'b01;
    default: Adjr = 2'b00;
    endcase
    HiCount = 2'b0;
end
endmodule
```## FPGA Designs - Fall 2018
**Project:** Junk Pictures for your Pictures
**Team:**,,,, 

**Introduction:**
Our project was inspired by the fact that, when we were young, we would buy and collect thousands of pictures for our friends, but the sheer quantity of this type of information could be daunting, especially for someone like us that is very busy.

But, we feel that our project is a step in the right direction. With technology, we can automate the collection of pictures and then share them with friends at an individualized and customized level, in a way that no one can say no to.

**Problem:**
There are many websites to upload pictures, but sometimes these large websites are too expensive and inconvenient for us. Furthermore, we have a specific need to collect a certain number of photos from a specific photographer, and we want our photos to be automatically uploaded to a certain website. We are also dealing with the problem of getting to the specific website and logging in. All of this would require constant effort by us.

**Solution:**
Our project is to automate the process of collecting photos. Instead of having to log in to a website and browse through individual photos one-by-one, our project automatically scraps a website and collects photos. The same goes for uploading them to a website of our choice.
The project uses Python to automate the web browser that scrapes and uploads photos.

**Requirements:**
* Python: This project requires python to be installed on the host machine.
* Python libraries:
* BeautifulSoup4, Selenium

**Setup:**
* Clone this repository
* python scrap_and_upload.py
#include <stdio.h>
int main()
{
  int n;
  int num=0;
  int i;
  int sum = 0;
  
  scanf("%d", &n);
  
  for (i=1; i<=n; i++)
  {
    num = num + i;
  }
  
  printf("The sum is %d\n", num);
  return 0;
}
#include <stdio.h>
int main()
{
  int n, i, c = 0;
  int num;
  
  printf("Please enter the number of numbers you want to add \n");
  scanf("%d", &n);
  
  for (i=1; i<=n; i++)
  {
    printf("Enter the %d number \n", i);
    scanf("%d", &num);
    c = c + num;
  }
  printf("The sum is %d\n", c);
  return 0;
}
#include <stdio.h>
int main()
{
  int i = 0;
while (i <= 20)
{
printf ("%d \n", i);
i++;
}
return 0;
}