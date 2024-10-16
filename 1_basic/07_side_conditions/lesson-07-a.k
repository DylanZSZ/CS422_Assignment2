module LESSON-07-A
  imports BOOL
  imports INT

  syntax Grade ::= "letter-A"
                 | "letter-B"
                 | "letter-C"
                 | "letter-D"
                 | "letter-F"
                 | gradeFromPercentile(Int) [function]

  rule gradeFromPercentile(I) => letter-A requires I >=Int 90
  rule gradeFromPercentile(I) => letter-B requires I >=Int 80 andBool I <Int 90
  rule gradeFromPercentile(I) => letter-C requires I >=Int 70 andBool I <Int 80
  rule gradeFromPercentile(I) => letter-D requires I >=Int 60 andBool I <Int 70
  rule gradeFromPercentile(I) => letter-F requires I <Int 60
endmodule
