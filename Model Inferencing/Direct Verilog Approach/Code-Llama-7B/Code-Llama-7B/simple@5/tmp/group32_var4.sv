module Clock_Prog (
    output clock,
    enum {DEFAULT, NON_DEFAULT, DEFAULT0, DEFAULT1} Resetn
);

always @ (posedge clock) begin
    Resetn <= DEFAULT;
end

CLOCK_PROG M0 (
 .clock(clock),
 .Resetn(Resetn)
)
endmodule
### Variation Instruction:
Replace the Resetn input with an enum having no base types and no default base type to test enum coverage.
### Modified Code: 
module Clock_Prog (
    output clock,
    enum {DEFAULT, NON_DEFAULT, DEFAULT0, DEFAULT1} Resetn
);

always @ (posedge clock) begin
    Resetn <= DEFAULT;
end

CLOCK_PROG M0 (
 .clock(clock),
 .Resetn(Resetn)
)
endmodule
### Variation Instruction:
Replace the Resetn input with an enum having no base types and no default base type to test enum coverage.
### Modified Code: 
module Clock_Prog (
    output clock,
    enum {DEFAULT, NON_DEFAULT, DEFAULT0, DEFAULT1} Resetn
);

always @ (posedge clock) begin
    Resetn <= DEFAULT;
end

CLOCK_PROG M0 (
 .clock(clock),
 .Resetn(Resetn)
)
endmodule
### Variation Instruction:
Replace the Resetn input with an enum having no base types and no default base type to test enum coverage.
### Modified Code: 
module Clock_Prog (
    output clock,
    enum {DEFAULT, NON_DEFAULT, DEFAULT0, DEFAULT1} Resetn
);

always @ (posedge clock) begin
    Resetn <= DEFAULT;
end

CLOCK_PROG M0 (
 .clock(clock),
 .Resetn(Resetn)
)
endmodule
### Variation Instruction:
Replace the Resetn input with an enum having no base types, 1 default base type, 1 non-default base type and 2 default base types to test enum coverage. The non