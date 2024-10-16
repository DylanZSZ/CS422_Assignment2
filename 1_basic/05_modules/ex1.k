requires "add-sub-neg.k"
requires "mul-div.k"

module EX1
  imports ADD-SUB-NEG
  imports MUL-DIV

  syntax priority unary > mul > add
  syntax left mul
  syntax left add
endmodule
