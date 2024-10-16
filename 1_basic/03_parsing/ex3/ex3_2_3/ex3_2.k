module EX3_2
    syntax Exp ::= Int
                | "(" Exp ")"
                | Exp "+" Exp
                | Exp "-" Exp
                | Exp "*" Exp
                | Exp "/" Exp
                | "-" Exp
    
    syntax Int ::= r"[0-9]+" [token]
endmodule
