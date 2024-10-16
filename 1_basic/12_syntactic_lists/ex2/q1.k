module LESSON-12-C-SYNTAX
  imports INT-SYNTAX

  syntax Ints ::= NeList{Int,","}
endmodule

module Q1
  imports LESSON-12-C-SYNTAX
  imports INT

  syntax Int ::= sum(Ints) [function]
  // Base case for empty list
  rule sum(I:Int) => I
  // sum(I1, I2, Is) = I1 + I2 + sum(Is)
  rule sum(I1:Int, I2:Int, Is:Ints) => sum(I1 +Int I2, Is)
endmodule
