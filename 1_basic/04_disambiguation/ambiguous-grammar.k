module AMBIGUOUS-GRAMMAR

syntax Stmt ::= "x" Stmt
              | "x" Stmt "y"
              | "z"

endmodule
