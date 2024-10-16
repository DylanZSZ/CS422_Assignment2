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

  syntax Stmt ::= Bool ";" Exp
                | "reset" ";" Exp

  syntax Pgm ::= Exp
               | Stmt

  syntax Int ::= r"[0-9]+"              [token]

  syntax KResult ::= Int | Bool
endmodule

module LESSON15-EX3
  imports EX2-SYNTAX
  imports INT
  imports BOOL

  configuration <T>
                  <k> $PGM:Pgm </k>
                  <flags>
                    <useDiv> false </useDiv>
                  </flags>
               </T>

  // Rule for reset ; Exp: Reset 'useDiv' to its default value via '...'
  rule <k> "reset" ";" E:Exp => E ...</k>
       <flags> _ => <flags> ... </flags> </flags>

  // Rule for Bool ; Exp: Set the 'useDiv' flag to the Bool value
  rule <k> B:Bool ; E:Exp => E ...</k>
       <flags>
         <useDiv> _ => B </useDiv>
       </flags>

  // Unary minus rule
  rule <k> - I:Int => 0 -Int I ...</k>

  // Integer arithmetic rules
  rule <k> I1:Int + I2:Int => I1 +Int I2 ...</k>
  rule <k> I1:Int - I2:Int => I1 -Int I2 ...</k>
  rule <k> I1:Int * I2:Int => I1 *Int I2 ...</k>

  // Division rules based on 'useDiv' flag
  rule <k> I1:Int / I2:Int => I1 /Int I2 ...</k>
       <flags>
         <useDiv> false </useDiv>
       </flags>
    requires I2 =/=Int 0

  rule <k> I1:Int / I2:Int => I1 divInt I2 ...</k>
       <flags>
         <useDiv> true </useDiv>
       </flags>
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
