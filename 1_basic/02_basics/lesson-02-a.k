// Create a new definition which defines an outfit as a multi-argument constructor consisting of a hat, shirt, pants, and shoes. Define a new sort, Boolean, with two constructors, true and false. Each of hat, shirt, pants, and shoes will have a single argument (a color), either black or white. Then define an outfitMatching function that will return true if all the pieces of the outfit are the same color. You do not need to define the case that returns false. Write some tests that your function behaves the way you expect.


module LESSON-02-A

  syntax Color ::= Yellow() | Blue()
  syntax Fruit ::= Banana() | Blueberry()
  syntax Color ::= colorOf(Fruit) [function]

  rule colorOf(Banana()) => Yellow()
  rule colorOf(Blueberry()) => Blue()
  rule colorOf(Blackberry()) => Black()
  rule colorOf(Kiwi()) => Green()


endmodule

