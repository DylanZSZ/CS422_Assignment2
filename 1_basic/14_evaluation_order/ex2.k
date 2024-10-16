module EX2-SYNTAX
  imports INT-SYNTAX
  imports BOOL-SYNTAX

  syntax Exp ::= Int
               | Bool
               > left: Exp "*" Exp      [seqstrict]
               > left: Exp "/" Exp      [seqstrict]
               > left: Exp "+" Exp      [seqstrict]
               > left: Exp "-" Exp      [seqstrict]
               > left: Exp "<"  Exp     [seqstrict]
               > left: Exp "<=" Exp     [seqstrict]
               > left: Exp ">"  Exp     [seqstrict]
               > left: Exp ">=" Exp     [seqstrict]
               > left: Exp "==" Exp     [seqstrict]
               > left: Exp "!=" Exp     [seqstrict]
               > left: Exp "&&" Exp     [seqstrict]
               > left: Exp "||" Exp     [seqstrict]

  syntax Int ::= r"[0-9]+"              [token]
  


  syntax KResult ::= Int | Bool
endmodule

module EX2
  imports EX2-SYNTAX
  imports INT
  imports BOOL

  configuration <k> $PGM:Exp </k>

  // Arithmetic operations
  rule <k> I1:Int + I2:Int => I1 +Int I2 ...</k>
  rule <k> I1:Int - I2:Int => I1 -Int I2 ...</k>
  rule <k> I1:Int * I2:Int => I1 *Int I2 ...</k>
  rule <k> I1:Int / I2:Int => I1 /Int I2 ...</k> requires I2 =/=Int 0

  // Comparison operations
  rule <k> I1:Int <  I2:Int => I1 <Int I2 ...</k>
  rule <k> I1:Int <= I2:Int => I1 <=Int I2 ...</k>
  rule <k> I1:Int >  I2:Int => I1 >Int I2 ...</k>
  rule <k> I1:Int >= I2:Int => I1 >=Int I2 ...</k>

  // Equality operations
  rule <k> I1:Int == I2:Int => I1 ==Int I2 ...</k>
  rule <k> I1:Int != I2:Int => notBool (I1 ==Int I2) ...</k>
  rule <k> B1:Bool == B2:Bool => B1 ==Bool B2 ...</k>
  rule <k> B1:Bool != B2:Bool => notBool (B1 ==Bool B2) ...</k>

  // Logical operations 
  rule <k> B1:Bool && B2:Bool => B1 andBool B2 ...</k>
  rule <k> B1:Bool || B2:Bool => B1 orBool B2 ...</k>
endmodule
