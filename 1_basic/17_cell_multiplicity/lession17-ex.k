module LESSON17-EX
  imports INT

  // Define the syntax for a list of statements and individual commands
  syntax Stmts ::= List{Stmt,""}
  syntax Stmt  ::= "enable" 
                 | "increment" 
                 | "decrement" 
                 | "disable"

  // Configuration that includes an optional <counter> cell
  configuration <k> $PGM:Stmts </k>
                <counter multiplicity="?"> 0 </counter>

  // Rule to activate the counter by introducing the <counter> cell
  rule <k> enable => . ... </k>
       (.Bag => <counter> 0 </counter>)

  // Rule to deactivate the counter by removing the <counter> cell
  rule <k> disable => . ... </k>
       (<counter> _ </counter> => .Bag)

  // Rule to increase the counter value when <counter> exists
  rule <k> increment => . ... </k>
       <counter> N:Int => N +Int 1 </counter>

  // Rule to decrease the counter value when <counter> exists
  rule <k> decrement => . ... </k>
       <counter> N:Int => N -Int 1 </counter>

endmodule
