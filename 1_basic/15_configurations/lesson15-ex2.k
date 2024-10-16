module EX2-SYNTAX
  imports INT-SYNTAX
  imports BOOL-SYNTAX

  syntax Exp ::= Int
               | Bool
               > right: "-" Exp         [seqstrict]
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

module LESSON15-EX2
  imports EX2-SYNTAX
  imports INT
  imports BOOL

  configuration <T>
                  <k> $PGM:Exp </k>
                  <useDiv> $USE_DIV:Bool </useDiv>
               </T>

  // Unary minus rule
  rule <k> - I:Int => 0 -Int I ...</k>

  // Integer arithmetic rules
  rule <k> I1:Int + I2:Int => I1 +Int I2 ...</k>
  rule <k> I1:Int - I2:Int => I1 -Int I2 ...</k>
  rule <k> I1:Int * I2:Int => I1 *Int I2 ...</k>

  // Division rules based on 'USE_DIV' variable
  rule <k> I1:Int / I2:Int => I1 /Int I2 ...</k>
       <useDiv> false </useDiv>
    requires I2 =/=Int 0

  rule <k> I1:Int / I2:Int => I1 divInt I2 ...</k>
       <useDiv> true </useDiv>
    requires I2 =/=Int 0

  // Comparison rules
  rule <k> I1:Int <  I2:Int => I1 <Int I2 ...</k>
  rule <k> I1:Int <= I2:Int => I1 <=Int I2 ...</k>
  rule <k> I1:Int >  I2:Int => I1 >Int I2 ...</k>
  rule <k> I1:Int >= I2:Int => I1 >=Int I2 ...</k>

  // Equality rules
  rule <k> I1:Int == I2:Int => I1 ==Int I2 ...</k>
  rule <k> I1:Int != I2:Int => notBool (I1 ==Int I2) ...</k>
  rule <k> B1:Bool == B2:Bool => B1 ==Bool B2 ...</k>
  rule <k> B1:Bool != B2:Bool => notBool (B1 ==Bool B2) ...</k>

  // Logical operations
  rule <k> B1:Bool && B2:Bool => B1 andBool B2 ...</k>
  rule <k> B1:Bool || B2:Bool => B1 orBool B2 ...</k>
endmodule
