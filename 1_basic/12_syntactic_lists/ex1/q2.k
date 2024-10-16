module Q2
  syntax Id  ::= r"[a-zA-Z_][a-zA-Z0-9_]*" [token]
  syntax Exp ::= Id
               | Exp "(" Exps ")"
  syntax Exps ::= List{Exp, ","}
endmodule
