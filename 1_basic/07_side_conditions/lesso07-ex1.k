module LESSON07-EX1
  imports INT
  imports BOOL

  syntax Bool ::= isEven(Int) [function]

  rule isEven(I:Int) => true requires I %Int 2 ==Int 0
  rule isEven(_)     => false [owise]
endmodule
