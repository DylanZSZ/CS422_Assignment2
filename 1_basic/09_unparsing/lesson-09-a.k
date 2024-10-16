module LESSON-09-A // Modified
  imports BOOL
  
  syntax Exp ::= "(" Exp ")" [bracket]
               | Bool
               > "!" Exp
               > right: // Changed into right assoc
                 Exp "&&" Exp
               | Exp "^" Exp
               | Exp "||" Exp

  syntax Exp ::= id(Exp) [function]
  rule id(E) => E
endmodule
