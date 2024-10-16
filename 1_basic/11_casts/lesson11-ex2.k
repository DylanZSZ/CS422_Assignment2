module LESSON11-EX2
  imports INT
  imports BOOL

  // Defining expressions that include both integers and Booleans, as well as various operators
  syntax Exp ::= Int
               | Bool
               | Exp "+" Exp
               | Exp "-" Exp
               | Exp "*" Exp
               | Exp "/" Exp
               | Exp "<" Exp
               | Exp "==" Exp
               | Exp "&&" Exp
               | Exp "||" Exp

  // Function to evaluate expressions
  syntax Exp ::= eval(Exp) [function]

  // Base case rules for evaluating integers and Booleans
  rule eval(I:Int)  => I
  rule eval(B:Bool) => B

  // Arithmetic operation rules for addition, subtraction, multiplication, and division
  rule eval(E1 + E2) =>
       {eval(E1)}:>Int +Int {eval(E2)}:>Int

  rule eval(E1 - E2) =>
       {eval(E1)}:>Int -Int {eval(E2)}:>Int

  rule eval(E1 * E2) =>
       {eval(E1)}:>Int *Int {eval(E2)}:>Int

  rule eval(E1 / E2) =>
       {eval(E1)}:>Int /Int {eval(E2)}:>Int

  // Comparison rule for less-than operator
  rule eval(E1 < E2) =>
       {eval(E1)}:>Int  <Int {eval(E2)}:>Int

  // Rules for evaluating equality, handling both integer and Boolean comparisons
  rule eval(E1:Int == E2:Int) =>
       {eval(E1)}:>Int ==Int {eval(E2)}:>Int

  rule eval(E1:Bool == E2:Bool) =>
       {eval(E1)}:>Bool ==Bool {eval(E2)}:>Bool

  // Logical operation rules for AND and OR
  rule eval(E1 && E2) =>
       {eval(E1)}:>Bool andBool {eval(E2)}:>Bool

  rule eval(E1 || E2) =>
       {eval(E1)}:>Bool orBool {eval(E2)}:>Bool
endmodule
