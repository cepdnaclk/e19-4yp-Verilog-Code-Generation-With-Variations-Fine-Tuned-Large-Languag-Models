`timescale 1ns/100ps
module maj3 (input a, b, c, output y);
and #(2, 4)
    (im1, a, b),
    (im2, b, c),
    (im3, c, a);
or #(3, 5) (y, {im1, im2, im3});
endmodule
`/reports/lab4/Makefile
lab4.pdf: lab4.tex
	pdflatex lab4
	bibtex lab4
	pdflatex lab4
	pdflatex lab4

.PHONY: clean
clean:
	$(RM) lab4.pdf *.aux *.bbl *.blg *.log *.out
/scripts/lab3/lab3.py
import os

def get_header_count(filename):
    with open(filename) as f:
        return len(f.readlines())

def get_total_header_count(foldername):
    count = 0
    for file in sorted(os.listdir(foldername)):
        if file.endswith(".c"):
            count += get_header_count(os.path.join(foldername, file))
    return count

def get_lines_count(filename):
    with open(filename) as f:
        return len(f.readlines())

def get_total_lines_count(foldername):
    count = 0
    for file in sorted(os.listdir(foldername)):
        if file.endswith(".c"):
            count += get_lines_count(os.path.join(foldername, file))
    return count

foldername = "lab3"

print("Total lines in %s: %d" % (foldername, get_total_lines_count(foldername)))
print("Total lines in %s excluding header lines: %d" % (foldername, get_total_lines_count(foldername) - get_total_header_count(foldername)))/reports/lab6/Makefile
lab6.pdf: lab6.tex
	pdflatex lab6
	bibtex lab6
	pdflatex lab6
	pdflatex lab6

.PHONY: clean
clean:
	$(RM) lab6.pdf *.aux *.bbl *.blg *.log *.out
/reports/lab5/Makefile
lab5.pdf: lab5.tex
	pdflatex lab5
	bibtex lab5
	pdflatex lab5
	pdflatex lab5

.PHONY: clean
clean:
	$(RM) lab5.pdf *.aux *.bbl *.blg *.log *.out
/reports/lab7/Makefile
lab7.pdf: lab7.tex
	pdflatex lab7
	bibtex lab7
	pdflatex lab7
	pdflatex lab7

.PHONY: clean
clean:
	$(RM) lab7.pdf *.aux *.bbl *.blg *.log *.out
/README.md
# Computer Organization and Architecture

Labs for the Computer Organization and Architecture course (CSCI6930)

## Usage

The class is [public](https://csci6930.cs.orst.edu/) and the course website is available at [https://csci6930.cs.orst.edu/](https://csci6930.cs.orst.edu/).

For the class material you can use the following resources:
* [Lab Handouts](https://github.com/BornToCode/csci6930/tree/master/lab_handouts)
* [Lab Solutions](https://github.com/BornToCode/csci6930/tree/master/lab_solutions)
* [Course Material](https://github.com/BornToCode/csci6930/tree/master/course_material)
* [Papers and Reports](https://github.com/BornToCode/csci6930/tree/master/reports)

This repository also contains the following files:
* [Makefile](https://github.com/BornToCode/csci6930/blob/master/Makefile)
* [lab.py](https://github.com/BornToCode/csci6930/blob/master/lab.py)
* [labs.txt](https://github.com/BornToCode/csci6930/blob/master/labs.txt)
* [reports.txt](https://github.com/BornToCode/csci6930/blob/master/reports.txt)

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)/reports/lab2/Makefile
lab2.pdf: lab2.tex
	pdflatex lab2
	bibtex lab2
	pdflatex lab2
	pdflatex lab2

.PHONY: clean
clean:
	$(RM) lab2.pdf *.aux *.bbl *.blg *.log *.out
/lab.py
import subprocess
import sys

file = sys.argv[1]

print("Testing %s:\n" % file)

subprocess.run(["bash", "-c", "cd %s; make clean" % file])

subprocess.run(["bash", "-c", "cd %s; make" % file])

subprocess.run(["bash", "-c", "cd %s; make test" % file])

subprocess.run(["bash", "-c", "cd %s; make clean" % file])

subprocess.run(["bash", "-c", "cd %s; make" % file])

print("\n")/Makefile
.PHONY: all
all:
	python lab.py lab2
	python lab.py lab3
	python lab.py lab4
	python lab.py lab5
	python lab.py lab6
	python lab.py lab7

.PHONY: clean
clean:
	$(RM) *.pdf
	$(RM) *.aux
	$(RM) *.bbl
	$(RM) *.blg
	$(RM) *.log
	$(RM) *.out
	$(MAKE) -C lab2 clean
	$(MAKE) -C lab3 clean
	$(MAKE) -C lab4 clean
	$(MAKE) -C lab5 clean
	$(MAKE) -C lab6 clean
	$(MAKE) -C lab7 clean

.PHONY: test
test:
	python lab.py lab2
	python lab.py lab3
	python lab.py lab4
	python lab.py lab5
	python lab.py lab6
	python lab.py lab7
/reports/lab4/Makefile
lab4.pdf: lab4.tex
	pdflatex lab4
	bibtex lab4
	pdflatex lab4
	pdflatex lab4

.PHONY: clean
clean:
	$(RM) lab4.pdf *.aux *.bbl *.blg *.log *.out
/reports/lab1/Makefile
lab1.pdf: lab1.tex
	pdflatex lab1
	bibtex lab1
	pdflatex lab1
	pdflatex lab1

.PHONY: clean
clean:
	$(RM) lab1.pdf *.aux *.bbl *.blg *.log *.out