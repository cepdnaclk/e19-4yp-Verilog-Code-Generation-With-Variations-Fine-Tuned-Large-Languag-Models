// Verilog code for Problem 4
module XOR_Gate_Wildcard(
    input [1:0] A [*], B [*],
    output [1:0] Y [*]
);
    assign Y = A ^ B;
endmodule
"""

from sys import maxsize

class Variation:
    def __init__(self, code_line):
        self.code_line = code_line
        self.code_id = self.code_line.split(" ")[2]
        self.code_variation_type = self.code_line.split("  ")[1].replace(",", " ").strip()
        self.code_explanation = self.code_line.split("  ")[2].strip()
        self.code_modified_code = self.code_line.split("  ")[3].strip()
        self.variable_name = self.code_line.split("  ")[4].strip()
        self.variable_range = self.code_line.split("  ")[5].strip()
        self.variable_range_range = self.code_line.split("  ")[6].strip()
        if(len(self.code_line.split(" ")) > 7):
            self.variable_range_range_range = self.code_line.split("  ")[7].strip()
        else:
            self.variable_range_range_range = "None"

    def __str__(self):
        return "id: " + self.code_id + "\nVariation Type: " + self.code_variation_type + "\nExplanation: " + self.code_explanation + "\nModified Code: " + self.code_modified_code + "\nVariable Name: " + self.variable_name + "\nVariable Range: " + self.variable_range + "\nVariable Range Range: " + self.variable_range_range + "\nVariable Range Range Range: " + self.variable_range_range_range + "\n\n"

if __name__ == "__main__":
    variations = []
    for line in open("verilog.txt"):
        if line!= "\n":
            variations.append(Variation(line))

    num_variations = len(variations)

    max_id = 0
    max_id_index = 0
    for i in range(num_variations):
        if variations[i].code_id > max_id:
            max_id = variations[i].code_id
            max_id_index = i

    min_id = maxsize
    min_id_index = 0
    for i in range(num_variations):
        if variations[i].code_id < min_id:
            min_id = variations[i].code_id
            min_id_index = i

    print("Max ID: " + str(max_id) + " at Index: " + str(max_id_index) + " Variation: " + variations[max_id_index].code_variation_type)
    print("Min ID: " + str(min_id) + " at Index: " + str(min_id_index) + " Variation: " + variations[min_id_index].code_variation_type)

    for variation in variations:
        print(variation)

    
/src/main.rs
use std::env;
use std::fs::File;
use std::io::Read;

mod problem1;
mod problem2;
mod problem3;
mod problem4;

fn main() -> std::io::Result<()> {
    let args: Vec<String> = env::args().collect();
    
    let file_name = &args[1];
    let file = File::open(file_name)?;

    let mut file_contents = String::new();
    file.read_to_string(&mut file_contents)?;

    let problem_type = match file_name {
        "Problem01" => "Problem1",
        "Problem02" => "Problem2",
        "Problem03" => "Problem3",
        "Problem04" => "Problem4",
        _ => "None",
    };

    if problem_type!= "None" {
        let problem_func = match problem_type {
            "Problem1" => problem1::problem1,
            "Problem2" => problem2::problem2,
            "Problem3" => problem3::problem3,
            "Problem4" => problem4::problem4,
            _ => "None",
        };

        let file_content_lines = file_contents.lines().collect::<Vec<&str>>();
        for i in 0..file_content_lines.len() {
            let file_line = file_content_lines.get(i).unwrap();
            if file_line.to_string().starts_with("### Base Verilog Code:") {
                match problem_func(&file_contents.replace(file_line, ""), &file_name, i) {
                    Ok(_) => {}
                    Err(_) => {}
                };
            } else if file_line.to_string().starts_with("### Variation Instruction:") {
                match problem_func(&file_contents.replace(file_line, ""), &file_name, i) {
                    Ok(_) => {}
                    Err(_) => {}
                };
            }
        }
    }

    Ok(())
}

/*
// Verilog code for Problem 1
module Problem1(
input A0_0, A0_1, A0_2, A0_3, A1_0, A1_1, A1_2, A1_3, A2_0, A2_1, A2_2, A2_3, A3_0, A3_1, A3_2, A3_3, B0_0, B0_1, B0_2, B0_3, B1_0, B1_1, B1_2, B1_3, B2_0, B2_1, B2_2, B2_3, B3_0, B3_1, B3_2, B3_3,
output C0_0, C0_1, C0_2, C0_3, C1_0, C1_1, C1_2, C1_3, C2_0, C2_1, C2_2, C2_3, C3_0, C3_1, C3_2, C3_3
);
always_comb begin
C0_0 = A0_0& (~A1_0);
C0_1 = A0_1& (~A1_1);
C0_2 = A0_2& (~A1_2);
C0_3 = A0_3& (~A1_3);
C1_0 = A1_0& (~A0_0);
C1_1 = A1_1& (~A0_1);
C1_2 = A1_2& (~A0_2);
C1_3 = A1_3& (~A0_3);
C2_0 = A2_0& (~A3_0);
C2_1 = A2_1& (~A3_1);
C2_2 = A2_2& (~A3_2);
C2_3 = A2_3& (~A3_3);
C3_0 = A3_0& (~A2_0);
C3_1 = A3_1& (~A2_1);
C3_2 = A3_2& (~A2_2);
C3_3 = A3_3& (~A2_3);
end
endmodule
// Problem 2
module Problem2(
input A0_0, A0_1, A0_2, A0_3, A1_0, A1_1, A1_2, A1_3, A2_0, A2_1, A2_2, A2_3, A3_0, A3_1, A3_2, A3_3, B0_0, B0_1, B0_2, B0_3, B1_0, B1_1, B1_2, B1_3, B2_0, B2_1, B2_2, B2_3, B3_0, B3_1, B3_2, B3_3,
output Y
);
assign Y = ~A0_0& (~A0_1& (~A0_2& (~A0_3))) & (~A1_0& (~A1_1& (~A1_2& (~A