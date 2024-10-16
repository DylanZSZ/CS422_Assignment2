module LESSON-04-EX2-INLINE

syntax Exp ::= Int
             | "-" Exp [function]
             > left: Exp "*" Exp [function]
             | Exp "/" Exp [function]
             > left: Exp "+" Exp [function]
             | Exp "-" Exp [function]
syntax Int ::= r"[0-9]+"          [token]
endmodule
