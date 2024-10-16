requires "int-and-brackets.k"

module MUL-DIV
  imports INT-AND-BRACKETS

  syntax Exp ::= Exp "*" Exp         [group(mul), function]
               | Exp "/" Exp         [group(mul), function]
endmodule
