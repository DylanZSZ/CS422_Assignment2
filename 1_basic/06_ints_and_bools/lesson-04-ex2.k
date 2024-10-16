module LESSON-04-EX2
  imports INT

  syntax Exp ::= Int
               | "-" Exp [group(unary), function]
               | Exp "*" Exp [group(mul), function]
               | Exp "/" Exp [group(mul), function]
               | Exp "+" Exp [group(add), function]
               | Exp "-" Exp [group(add), function]

  syntax Int ::= r"[0-9]+"          [token]
  syntax priority unary > mul > add
  syntax left mul
  syntax left add

  // Rules defining arithmetic operations
  rule E1:Exp + E2:Exp => E1 +Int E2
  rule E1:Exp - E2:Exp => E1 -Int E2
  rule E1:Exp * E2:Exp => E1 *Int E2
  rule E1:Exp / E2:Exp => E1 /Int E2
  rule - E:Exp         => 0 -Int E
endmodule
