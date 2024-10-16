module EX3
  imports INT
  imports BOOL

  syntax Bool ::= Int "==" Int [function]
                | Int "!=" Int [function]
                | Int "<"  Int [function]
                | Int "<=" Int [function]
                | Int ">"  Int [function]
                | Int ">=" Int [function]

  // Equality
  rule N:Int == N:Int => true
  rule _     == _     => false [owise]

  // Inequality
  rule N:Int != N:Int => false
  rule _     != _     => true [owise]

  // Less Than or Equal
  rule N:Int <= M:Int => true requires N == M
  rule N:Int <= M:Int => false requires N == M +Int 1
  rule N:Int <= M:Int => N +Int 1 <= M [owise]

  // greater than or equal
  rule N:Int >= M:Int => true requires N == M
  rule N:Int >= M:Int => false requires N == M -Int 1
  rule N:Int >= M:Int => N -Int 1 >= M [owise]

  // greater than
  rule N:Int > M:Int => false requires N == M
  rule N:Int > M:Int => N >= M [owise]

  // less than
  rule N:Int < M:Int => false requires N == M
  rule N:Int < M:Int => N <= M [owise]

endmodule
