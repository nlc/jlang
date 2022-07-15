require 'format/printf'
require './seed.ijs'

prompt=: 3 : '1!:1]1 [ ((2) 1!:2~ ])y'

NB. 'BROTH' (= + e.~) 'SWORN'  ==>  0 0 2 1 0
fit =: = + e.~

without =: -.@e. # [


prevline =: (13 27 91 65 27 91 65{a.) , ]
green =: (27 91 55 59 51 50 109{a.) , (27 91 48 109{a.) ,~ ]
yellow =: (27 91 55 59 51 51 109{a.) , (27 91 48 109{a.) ,~ ]
none =: ]
highlight =: [: > [: ,&.>/ [: ,&.> (none`yellow`green@.[ ])&.>
display =: fit highlight ]


possiblewords =: > cutLF fread '_wordle_possible_words.txt'
allwords =: > cutLF fread '_wordle_all_words.txt'
alphabet =: (97 + i. 26) { a.

wordle =: monad define
  word =. (?@# { ]) possiblewords
  tries =. 6
  found =. 0

  guessed =. ''

  while. (-. found) AND (tries > 0) do.
    unguessed =. alphabet without guessed

    guess =. prompt '%d guesses remaining | %s' sprintf tries ; unguessed
    guessed =. ~. guessed , guess

    echo prevline word display guess

    if. guess -: word do.
      found =. 1
    else.
      tries =. tries - 1
    end.
  end.

  if. found do.
    'You got it in %d guesses!' printf 7 - tries
  else.
    'Sorry! The word was "%s"!' printf { word
  end.

  word
)

seed ''
'seed=%d' printf RNGSEED

NB. generateblanks 'alu__' ==> 'alu__' , 'al_u_' , 'al__u' ...
generateblanks =: [: ~. i.@!@# A. ]
shuffle =: { ~ (# ? #)
