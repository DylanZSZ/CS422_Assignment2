module EX2-SYNTAX
  imports INT-SYNTAX
  imports BOOL-SYNTAX

  syntax Exp ::= Id "(" ")" | Int
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

  syntax Decl ::= "int" Id "=" Exp ";" [strict(2)]
  syntax Stmt ::= Decl
  syntax Stmt ::= Id "=" Exp ";" [strict(2)]
  syntax Stmt ::= "return" Exp ";" [strict]
  syntax Decl ::= "fun" Id "(" ")" "{" Stmt "}"
  syntax Pgm ::= List{Stmt,""}
  syntax Id ::= "main" [token] | "x" [token] | "y" [token]

  syntax Int ::= r"[0-9]+"              [token]

  syntax KResult ::= Int | Bool
endmodule

module LESSON16-EX2
  imports EX2-SYNTAX
  imports INT
  imports BOOL
  imports BOOL
  imports LIST
  imports STRING

  configuration <T>
                  <k> $PGM:Pgm ~> main () </k>
                  <functions> .Map </functions>
                  <fstack> .List </fstack>
                <state> .Map </state>
                </T>

  // declaration sequence
  rule <k> D:Decl P:Pgm => D ~> P ...</k>
  rule <k> .Pgm => . ...</k>


  rule <k> int X:Id = V:Int ; => . ...</k>
       <state> STATE => STATE [ X <- V ] </state>

  rule <k> X:Id = V:Int ; => . ...</k>
       <state> STATE => STATE [ X <- V ] </state>

  rule <k> X:Id => I ...</k>
       <state>... X |-> I ...</state>

  rule <k> fun X:Id () { S } => . ...</k>
       <functions>... .Map => X |-> S ...</functions>

  syntax KItem ::= stackFrame(K)
  rule <k> X:Id () ~> K => S </k>
       <functions>... X |-> S ...</functions>
       <fstack> .List => ListItem(stackFrame(K)) ...</fstack>

  rule <k> return I:Int ; ~> _ => I ~> K </k>
       <fstack> ListItem(stackFrame(K)) => .List ...</fstack>


  rule <k> I1:Int + I2:Int => I1 +Int I2 ...</k>
  rule <k> I1:Int - I2:Int => I1 -Int I2 ...</k>
  rule <k> I1:Int * I2:Int => I1 *Int I2 ...</k>
  rule <k> I1:Int / I2:Int => I1 /Int I2 ...</k> requires I2 =/=Int 0

  rule <k> I1:Int <  I2:Int => I1 <Int I2 ...</k>
  rule <k> I1:Int <= I2:Int => I1 <=Int I2 ...</k>
  rule <k> I1:Int >  I2:Int => I1 >Int I2 ...</k>
  rule <k> I1:Int >= I2:Int => I1 >=Int I2 ...</k>

  rule <k> I1:Int == I2:Int => I1 ==Int I2 ...</k>
  rule <k> I1:Int != I2:Int => notBool (I1 ==Int I2) ...</k>
  rule <k> B1:Bool == B2:Bool => B1 ==Bool B2 ...</k>
  rule <k> B1:Bool != B2:Bool => notBool (B1 ==Bool B2) ...</k>

  rule <k> B1:Bool && B2:Bool => B1 andBool B2 ...</k>
  rule <k> B1:Bool || B2:Bool => B1 orBool B2 ...</k>
endmodule
