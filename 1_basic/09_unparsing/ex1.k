module COLORED-BOOL
  syntax Bool ::= "true" [token, color(blue)]
                | "false" [token, color(blue)]
endmodule

module EX1
  imports COLORED-BOOL
  syntax Stmt ::= "{" Stmt "}" [format(%1%i%n%2%d%n%3), color(yellow)] | "{" "}" [format(%1%2), color(yellow)]
                > right:
                  Stmt Stmt [format(%1%n%2)]
                | "if" "(" Bool ")" Stmt [format(%1 %2%3%4 %5), color(green)]
                | "if" "(" Bool ")" Stmt "else" Stmt [avoid, format(%1 %2%3%4 %5 %6 %7), color(red)]
endmodule
