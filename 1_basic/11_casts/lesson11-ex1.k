module LESSON11-EX1
  imports INT
  imports BOOL
  imports STRING

  syntax Exp ::= Int
               | Bool
               | String
               | Exp "+" Exp
               | Exp "&&" Exp
               | Exp "." Exp    // String concatenation operator

  syntax Exp ::= eval(Exp) [function]

  // Base cases
  rule eval(I:Int)    => I
  rule eval(B:Bool)   => B
  rule eval(S:String) => S

  // Integer addition
  rule eval(E1 + E2) =>
       {eval(E1)}:>Int +Int {eval(E2)}:>Int

  // Boolean conjunction
  rule eval(E1 && E2) =>
       {eval(E1)}:>Bool andBool {eval(E2)}:>Bool

  // String concatenation
  rule eval(E1 . E2) =>
       {eval(E1)}:>String +String {eval(E2)}:>String
endmodule
