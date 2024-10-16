module INT-AND-BRACKETS
  syntax Exp ::= Int
               | "(" Exp ")" [bracket]
  syntax Int ::= r"[0-9]+"          [token]
endmodule
