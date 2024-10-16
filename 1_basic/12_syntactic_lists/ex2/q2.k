module LESSON-12-D-SYNTAX
  imports INT-SYNTAX

  syntax Ints ::= List{Int,","}
endmodule

module Q2
  imports LESSON-12-D-SYNTAX
  imports INT

  syntax Int ::= sum(Ints) [function]

  // Base case for empty list
  rule sum(.Ints) => 0

  // Base case for single element list
  rule sum(I:Int) => I
  // sum(I1, I2, Is) = I1 + I2 + sum(Is)
  rule sum(I:Int, Is:Ints) => I +Int sum(Is)
endmodule
