module LESSON-12-F-SYNTAX
  imports STRING-SYNTAX

  syntax Strings ::= List{String, ","}
endmodule

module Q1
  imports LESSON-12-F-SYNTAX
  imports STRING

  syntax String ::= concat(Strings) [function]

  rule concat(.Strings) => ""
  rule concat(S:String, Ss:Strings) => S +String concat(Ss)
endmodule
