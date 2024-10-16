module LESSON-16-B-SYNTAX
  imports INT-SYNTAX
  imports ID-SYNTAX

  syntax Exp ::= Id | Int
  syntax Decl ::= "int" Id "=" Exp ";" [strict(2)]
  syntax Stmt ::= Decl
  syntax Stmt ::= Id "=" Exp ";" [strict(2)]
  syntax Pgm ::= List{Stmt,""}
endmodule


module LESSON16-EX1-B
  imports LESSON-16-B-SYNTAX
  imports BOOL

  configuration <T>
                  <k> $PGM:Pgm </k>
                  <state> .Map </state>
                </T>


  rule <k> S:Stmt P:Pgm => S ~> P ...</k>
  rule <k> .Pgm => . ...</k>


  rule <k> int X:Id = V:Int ; => . ...</k>
       <state> STATE => STATE [ X <- V ] </state>

  // Variable assignment using map pattern
  rule <k> X:Id = V:Int ; => . ...</k>
       <state>... X |-> _ => X |-> V:Int ...</state>

  // Variable lookup
  rule <k> X:Id => I ...</k>
       <state>... X |-> I ...</state>

  syntax Bool ::= isKResult(K) [symbol(isKResult), function]
  rule isKResult(_:Int) => true
  rule isKResult(_) => false [owise]
endmodule
