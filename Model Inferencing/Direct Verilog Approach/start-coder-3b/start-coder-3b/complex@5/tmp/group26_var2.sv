{% highlight python linenos %}
class PLL_Test(VivadoTest):
    def build(self):
        self.v = VivadoTest.build(self)
        self.i = [self.v.PLL_PLL_inst]

    def test(self):
        in_value = [[1, 0, 0, 0, 0, 0, 0, 0],
                    [0, 1, 0, 0, 0, 0, 0, 0],
                    [0, 0, 1, 0, 0, 0, 0, 0],
                    [0, 0, 0, 1, 0, 0, 0, 0],
                    [0, 0, 0, 0, 1, 0, 0, 0],
                    [0, 0, 0, 0, 0, 1, 0, 0],
                    [0, 0, 0, 0, 0, 0, 1, 0],
                    [0, 0, 0, 0, 0, 0, 0, 1]]

        out_value = [[0, 0],
                     [0, 0],
                     [1, 1],
                     [1, 1],
                     [1, 1],
                     [1, 1],
                     [1, 1],
                     [1, 1]]

        for idx, inst in enumerate(self.i):
            self._d = inst.I_PLLClock
            self._e = inst.I_Reset
            self.wait(10)
            self._a = in_value[idx]
            self.wait(10)
            self._b = inst.O_AdjustFreq

            if self._a!= out_value[idx]:
                self.fail("Error: " + str(idx) + "th test failed")
{% endhighlight %}
### Result:
{% highlight console linenos %}
Test PLL_Test
Start: 2020-09-09 21:36:28.450102
Error: 7th test failed

Test PLL_Test
Start: 2020-09-09 21:36:28.651264
Error: 7th test failed

Test PLL_Test
Start: 2020-09-09 21:36:28.852336
Error: 7th test failed

Test PLL_Test
Start: 2020-09-09 21:36:29.058138
Error: 7th test failed
{% endhighlight %}
/_posts/2019-12-15-Vivado-Synthesis-1.md
---
title: "Vivado Design - Synthesis 1"
date: 2019-12-15
categories: Vivado
tags: Vivado Synthesis
---

{% include toc %}

### Synopsis
This document contains all the notes of ['s](https://caichao.github.io/) lecture, available at [here](https://www.youtube.com/playlist?list=PL2fX3U6U6mE573r7y84aZ5qL0U-T4g5iY).

### Preparatory Steps:
- Clone the [repository](https://github.com/caichao/Vivado_Course.git)
- Make a new directory for this design
- Copy the content of the `Vivado_Course/Part3 - Design_2` directory into your newly created design folder
- Open Vivado, and click **File -> Open -> Project**
- Select the path of the newly created design folder
- If you have already created a design, click **FILE -> CLOSE CURRENT PROJECT** to close the current project
- Click **FILE -> Export -> Export Hardware** to export the design.

### Content:
- [Vivado Design - Synthesis 1](#vivado-design---synthesis-1)
  - [Synopsis](#synopsis)
  - [Preparatory Steps:](#preparatory-steps)
  - [Content:](#content)
  - [Lecture 1 - Introduction](#lecture-1---introduction)
    - [Design Overview:](#design-overview)
    - [Overview of HLS - Hardware Level Synthesis Tool](#overview-of-hls---hardware-level-synthesis-tool)
  - [Lecture 2 - Design 1](#lecture-2---design-1)
    - [Overview of the First Project - Fibonacci](#overview-of-the-first-project---fibonacci)
  - [Lecture 3 - Design 2](#lecture-3---design-2)
    - [Overview of the Second Project - Division](#overview-of-the-second-project---division)
  - [Lecture 4 - Design 3](#lecture-4---design-3)
    - [Overview of the Third Project - Shift Register](#overview-of-the-third-project---shift-register)
  - [Lecture 5 - Design 4](#lecture-5---design-4)
    - [Overview of the Fourth Project - Register File](#overview-of-the-fourth-project---register-file)
  - [Lecture 6 - Design 5](#lecture-6---design-5)
    - [Overview of the Fifth Project - Simple PAM](#overview-of-the-fifth-project---simple-pam)
  - [Lecture 7 - Design 6](#lecture-7---design-6)
    - [Overview of the Sixth Project - Addition](#overview-of-the-sixth-project---addition)
  - [Lecture 8 - Design 7](#lecture-8---design-7)
    - [Overview of the Seventh Project - Multiplication](#overview-of-the-seventh-project---multiplication)
  - [Lecture 9 - Design 8](#lecture-9---design-8)
    - [Overview of the Eighth Project - PLL](#overview-of-the-eighth-project---pll)
  - [Lecture 10 - Design 9](#lecture-10---design-9)
    - [Overview of the Ninth Project - PLL (Continued)](#overview-of-the-ninth-project---pll-continued)
  - [Lecture 11 - Design 10](#lecture-11---design-10)
    - [Overview of the Tenth Project - PLL (Continued)](#overview-of-the-tenth-project---pll-continued)
  - [Lecture 12 - Design 11](#lecture-12---design-11)
    - [Overview of the Eleventh Project - PLL (Continued)](#overview-of-the-eleventh-project---pll-continued)
  - [Lecture 13 - HLS Flows](#lecture-13---hls-flows)
    - [Overview of the HLS Flow](#overview-of-the-hls-flow)
    - [HLS Flows](#hls-flows)
  - [Lecture 14 - HLS Project 1](#lecture-14---hls-project-1)
    - [HLS Project Overview](#hls-project-overview)
    - [Part 1 - HLS Project 1](#hls-project-1-1)
  - [Lecture 15 - HLS Project 2](#lecture-15---hls-project-2)
    - [Part 2 - HLS Project 2](#hls-project-2-1)
  - [Lecture 16 - HLS Project 3](#lecture-16---hls-project-3)
    - [Part 3 - HLS Project 3](#hls-project-3-1)
  - [Lecture 17 - HLS Project 4](#lecture-17---hls-project-4)
    - [Part 4 - HLS Project 4](#hls-project-4-1)
  - [Lecture 18 - HLS Project 5](#lecture-18---hls-project-5)
    - [Part 5 - HLS Project 5](#hls-project-5-1)
  - [Lecture 19 - HLS Project 6](#lecture-19---hls-project-6)
    - [Part 6 - HLS Project 6](#hls-project-6-1)
  - [Lecture 20 - HLS Project 7](#lecture-20---hls-project-7)
    - [Part 7 - HLS Project 7](#hls-project-7-1)
  - [Lecture 21 - HLS Project 8](#lecture-21---hls-project-8)
    - [Part 8 - HLS Project 8](#hls-project-8-1)
  - [Lecture 22 -