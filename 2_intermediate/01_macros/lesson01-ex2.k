module LESSON-14-D-SYNTAX
  imports INT-SYNTAX
  imports BOOL-SYNTAX

  syntax Exp ::= Int
               | Bool
               | "(" Exp ")"             // Allow parentheses
               > left: Exp "+" Exp [strict]
               > left: Exp "/" Exp [strict]
               > left: Exp "&&" Exp [seqstrict]
endmodule

module LESSON01-EX2
  imports LESSON-14-D-SYNTAX
  imports INT
  imports BOOL

  configuration <k> $PGM:Exp </k>

  // Define arithmetic operations using 'anywhere' rules
  rule I1:Int + I2:Int => I1 +Int I2 [anywhere]
  rule I1:Int / I2:Int => I1 /Int I2 [anywhere]
  rule B1:Bool && B2:Bool => B1 andBool B2 [anywhere]

  // Define when an expression is considered a result
  syntax Bool ::= isKResult(K) [symbol(isKResult), function]
  rule isKResult(_:Int)  => true
  rule isKResult(_:Bool) => true
  rule isKResult(_)      => false [owise]
endmodule
