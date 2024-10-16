module LESSON-07-B
  imports BOOL
  imports INT
  // Define a syntax for grades

  syntax Grade ::= "letter-D"
                 | "letter-F"
                 | gradeFromPercentile(Int) [function]
  // Define a function that converts a percentile to a grade
  rule gradeFromPercentile(I) => letter-D requires I >=Int 60 andBool I <Int 70
  rule gradeFromPercentile(I) => letter-F requires I >=Int 0 [owise]
endmodule
