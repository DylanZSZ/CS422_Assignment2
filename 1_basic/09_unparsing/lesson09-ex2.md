
# Ex2

## Syntax

```k
module EX2-SYNTAX
  imports INT-SYNTAX
  imports BOOL-SYNTAX

  syntax Exp ::= Int
               | Bool
               | "-" Exp                [group(unary), function]
               | "!" Exp                [group(unary), function]
               | Exp "*" Exp            [group(mul), function, color(blue)]
               | Exp "/" Exp            [group(mul), function, color(red)]
               | Exp "+" Exp            [group(add), function, color(yellow)]
               | Exp "-" Exp            [group(add), function, color(purple)]
               | Exp "<"  Exp           [group(cmp), function]
               | Exp "<=" Exp           [group(cmp), function]
               | Exp ">"  Exp           [group(cmp), function]
               | Exp ">=" Exp           [group(cmp), function]
               | Exp "==" Exp           [group(eq),  function]
               | Exp "!=" Exp           [group(eq),  function]
               | Exp "&&" Exp           [group(and), function]
               | Exp "||" Exp           [group(or),  function]

```

Additionally, we need to account for the lexical representation of integers and operator precedence:

```k
  syntax Int ::= r"[0-9]+"              [token]
  syntax priority unary > mul > add > cmp > eq > and > or
  syntax left mul
  syntax left add
  syntax left cmp
  syntax left eq
  syntax left and
  syntax left or

  syntax KResult ::= Int | Bool
endmodule
```

## Semantics

```k
module LESSON09-EX2
  imports EX2-SYNTAX
  imports INT
  imports BOOL

  rule I1:Int + I2:Int => I1 +Int I2
  rule I1:Int - I2:Int => I1 -Int I2
  rule I1:Int * I2:Int => I1 *Int I2
  rule I1:Int / I2:Int => I1 /Int I2 requires I2 >Int 0 orBool I2 <Int 0
  rule - E:Int         => 0 -Int E

  rule I1:Int <  I2:Int => I1  <Int I2
  rule I1:Int <= I2:Int => I1 <=Int I2
  rule I1:Int >  I2:Int => I1  >Int I2
  rule I1:Int >= I2:Int => I1 >=Int I2

  rule I1:Int == I2:Int => I1 ==Int I2
  rule I1:Int != I2:Int => notBool (I1 ==Int I2)
  rule B1:Bool == B2:Bool => B1 ==Bool B2
  rule B1:Bool != B2:Bool => notBool (B1 ==Bool B2)

  rule ! B:Bool         => notBool B
  rule B1:Bool && B2:Bool => B1 andBool B2
  rule B1:Bool || B2:Bool => B1 orBool B2

  rule E1:Exp && E2:Exp => E1 andBool E2
  rule E1:Exp || E2:Exp => E1 orBool  E2
  rule ! E:Exp          => notBool E
endmodule
```

