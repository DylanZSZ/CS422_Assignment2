requires "int-and-brackets.k"

module ADD-SUB-NEG
  imports INT-AND-BRACKETS

  syntax Exp ::= "-" Exp             [group(unary), function]
               | Exp "+" Exp         [group(add), function]
               | Exp "-" Exp         [group(add), function]
endmodule
