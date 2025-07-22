module mux_2to1(
input [12:0] a, input [12:0] b,
input [12:0] c, input [12:0] d,
input [1:0] select,
output [12:0] select_out
);
assign select_out = {select,select};
always @(a, b, c, d)
begin
select_out = {select, select};
case(select_out)
0: begin
select_out = a;
end
1: begin
select_out = b;
end
2: begin
select_out = c;
end
3: begin
select_out = d;
end
endcase
end
endmodule
### Result:
![image](https://github.com/Ying-Yuan-Chan/FPGA-Project/blob/master/Lab9/mux_2to1/result.png?raw=true)
/Lab2/Lab2_2.py
while 1:
    print("Enter the name of the file to be parsed: ")
    fileName = input()
    try:
        with open(fileName, 'r') as file1:
            a = file1.read()
        break
    except:
        print("File not found, please try again.\n")

def find_sub_list(haystack, needle):
    start = haystack.find(needle[0])
    if start == -1:
        return []
    return [start + i for i, c in enumerate(haystack[start:]) if c == needle[i]]

def find_sub_list_len(haystack, needle, size):
    start = find_sub_list(haystack, needle)
    if not start:
        return 0
    return [start + i for i, c in enumerate(haystack[start:]) if c == needle[i]]

def find_sub_list_len_2(haystack, needle, size):
    start = list(find_sub_list(haystack, needle)) + [-1]
    return [start[i] + j for i in range(len(start) - 1) for j in range(size) if start[i]!= start[i + 1]]

def find_sub_list_len_3(haystack, needle, size):
    start = list(find_sub_list(haystack, needle)) + [-1]