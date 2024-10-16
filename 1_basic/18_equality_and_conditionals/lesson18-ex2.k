module LESSON-16-B-SYNTAX
  imports INT-SYNTAX
  imports ID-SYNTAX
  imports BOOL-SYNTAX
  imports K-EQUAL

  syntax Exp ::= Id | Int | Bool
  syntax Exp ::= Exp "+" Exp [strict]
               | Exp "<" Exp [strict]
               | Exp ">" Exp [strict]
               | Exp "==" Exp [strict]
               | Exp "!=" Exp [strict]

  syntax Decl ::= "int" Id "=" Exp ";" [strict(2)]
  syntax Stmt ::= Decl
                | Id "=" Exp ";" [strict(2)]
                | "if" "(" Exp ")" Stmt "else" Stmt [strict(1)]
  syntax Pgm ::= List{Stmt,""}
endmodule

module EX2
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


  rule <k> X:Id = V:Int ; => . ...</k>
       <state> STATE => STATE [ X <- V ] </state>


  rule <k> X:Id => I ...</k>
       <state>... X |-> I ...</state>

  rule if (B:Bool) S1:Stmt else S2:Stmt => #if B #then S1 #else S2 #fi

  syntax Bool ::= isKResult(K) [symbol(isKResult), function]
  rule isKResult(_:Int) => true
  rule isKResult(_) => false [owise]
endmodule
