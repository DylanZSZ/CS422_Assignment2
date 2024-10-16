module LESSON-04-EX2

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

endmodule
