module LESSON-04-F-ALT

syntax Exp ::= "true" | "false"
syntax Stmt ::= "if" "(" Exp ")" Stmt
              | "if" "(" Exp ")" Stmt "else" Stmt [prefer]
              | "{}"

endmodule
