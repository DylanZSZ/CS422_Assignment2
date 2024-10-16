module AMBIGUOUS-GRAMMAR-RESOLVED

syntax Stmt ::= "x" Stmt
              | "x" Stmt "y" [prefer]
              | "z"

endmodule
