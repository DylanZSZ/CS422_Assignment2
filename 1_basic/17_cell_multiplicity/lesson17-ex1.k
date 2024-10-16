module LESSON17-EX1
  imports INT-SYNTAX
  imports ID-SYNTAX
  imports INT
  imports BOOL

  syntax Exp ::= Id 
               | Int
               | Exp "+" Exp [strict]  // Expression evaluation
  syntax Decl ::= "int" Id "=" Exp ";" [strict(2)]
  syntax Stmt ::= Decl
               | Id "=" Exp ";" [strict(2)]
  syntax Pgm  ::= List{Stmt,""}

  configuration <T>
                  <k> $PGM:Pgm </k>
                  <variables>
                    <var multiplicity="*"> 
                      <name> X:Id </name>
                      <value> V:Int </value>
                    </var>
                  </variables>
                </T>

  // Handle a sequence of statements
  rule <k> S:Stmt P:Pgm => S ~> P ...</k>
  rule <k> .Pgm => . ...</k>

  // Handle variable declarations
  rule <k> int X:Id = V:Int ; => . ...</k>
       (<variables> VS </variables>
        => <variables> VS
             <var>
               <name> X </name>
               <value> V </value>
             </var>
           </variables>)

  // Handle variable assignments
  rule <k> X:Id = V:Int ; => . ...</k>
       <var>
         <name> X </name>
         <value> _ => V
       </value>
       </var>

  // Handle variable lookups
  rule <k> X:Id => V ...</k>
       <var>
         <name> X </name>
         <value> V </value>
       </var>

  // Evaluate expressions
  rule I1:Int + I2:Int => I1 +Int I2

  // Auxiliary function to determine if something is a K result
  syntax Bool ::= isKResult(K) [function, symbol(isKResult)]
  rule isKResult(_:Int) => true
  rule isKResult(_) => false [owise]

endmodule
