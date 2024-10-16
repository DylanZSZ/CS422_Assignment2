module LESSON18-EX1
  imports INT
  imports K-EQUAL

  // Define a function that compares two terms of sort K and returns an Int.
  syntax Int ::= compareTerms(K, K) [function]

  // Rule that returns 0 if the terms are equal.
  rule compareTerms(T1:K, T2:K) => 0 requires T1 ==K T2

  // Rule that returns 1 if the terms are unequal.
  rule compareTerms(T1:K, T2:K) => 1 requires T1 =/=K T2
endmodule