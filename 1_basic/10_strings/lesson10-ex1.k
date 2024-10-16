module LESSON10-EX1
  imports STRING
  imports INT

  syntax String ::= extractFirstWords(String) [function]

  // Recursive case: Extracts the first word of the current sentence, followed by the first words of the remaining sentences.
  rule extractFirstWords(S) =>
    extractFirstWord(S) +String " " +String extractFirstWords(getRemainingSentences(S))
    requires lengthString(getRemainingSentences(S)) >Int 0

  // Base case: Extracts the first word of the last sentence and appends a period.
  rule extractFirstWords(S) =>
    extractFirstWord(S) +String "."
    requires lengthString(getRemainingSentences(S)) ==Int 0

  syntax String ::= extractFirstWord(String) [function]

  // Handles sentences with a single word (no spaces), returns the entire string.
  rule extractFirstWord(S) =>
    S
    requires findChar(S, " ", 0) ==Int -1

  // Extracts the first word by taking the substring up to the first space character.
  rule extractFirstWord(S) =>
    substrString(S, 0, findChar(S, " ", 0))
    requires findChar(S, " ", 0) >=Int 0

  syntax String ::= getRemainingSentences(String) [function]

  // If no more sentences are found (no period in the string), returns an empty string.
  rule getRemainingSentences(S) =>
    ""
    requires findChar(S, ".", 0) ==Int -1

  // Returns the substring after the first period, representing the remaining sentences.
  rule getRemainingSentences(S) =>
    substrString(S, findChar(S, ".", 0) +Int 1, lengthString(S))
    requires findChar(S, ".", 0) >=Int 0
endmodule
