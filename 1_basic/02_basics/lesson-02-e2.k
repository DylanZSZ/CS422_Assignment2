// Create a new definition which defines an outfit as a multi-argument constructor consisting of a hat, shirt, pants, and shoes. Define a new sort, Boolean, with two constructors, true and false. Each of hat, shirt, pants, and shoes will have a single argument (a color), either black or white. Then define an outfitMatching function that will return true if all the pieces of the outfit are the same color. You do not need to define the case that returns false. Write some tests that your function behaves the way you expect.
// module LESSON-02-D

//   syntax Container ::= Jar(Fruit)
//   syntax Fruit ::= Apple() | Pear()

//   syntax Fruit ::= contentsOfJar(Container) [function]

//   rule contentsOfJar(Jar(F)) => F

// endmodule
module LESSON-02-E
    syntax Color ::= Black() | White()
  
    syntax Outfit ::= Outfit(Hat, Shirt, Pants, Shoes)
    syntax Hat ::= Hat(Color)
    syntax Shirt ::= Shirt(Color)
    syntax Pants ::= Pants(Color)
    syntax Shoes ::= Shoes(Color)
    syntax Boolean ::= true() | false()
  
    syntax Boolean ::= outfitMatching(Outfit) [function]
    // DO NOT USE OWISE
    rule outfitMatching(Outfit(Hat(C), Shirt(C), Pants(C), Shoes(C))) => true()

endmodule