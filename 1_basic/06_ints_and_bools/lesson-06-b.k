module LESSON-06-B
  imports BOOL

  syntax Fruit ::= Blueberry()
                 | Banana()
                 | BlueBanana()  // New Fruit

  syntax Bool ::= isBlue(Fruit) [function]
                | isYellow(Fruit) [function]
                | isBlueOrYellow(Fruit) [function]
                | isBlueAndNotYellow(Fruit) [function]  // New function

  rule isBlue(Blueberry()) => true
  rule isBlue(Banana()) => false
  rule isBlue(BlueBanana()) => true
  rule isYellow(Banana()) => true
  rule isYellow(Blueberry()) => false
  rule isYellow(BlueBanana()) => true
  rule isBlueOrYellow(F) => isBlue(F) orBool isYellow(F)
  rule isBlueAndNotYellow(F) => isBlue(F) andBool notBool isYellow(F)
endmodule
