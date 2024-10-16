module LESSON01-EX
  syntax Nat ::= "0"               // Zero
               | "S" "(" Nat ")"   // Successor function

  syntax Nat ::= Nat "+" Nat [macro-rec]

  rule N:Nat + 0 => N
  rule N:Nat + S(M:Nat) => S(N + M)
endmodule
