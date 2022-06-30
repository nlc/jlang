require 'format/printf'

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


words =: > cutLF fread 'wordle_list.txt'
alphabet =: (97 + i. 26) { a.

wordle =: monad define
  word =. (?@# { ]) words
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

NB. seed RNG
(9!:1) seed =: ". (6!:0) 'mmsssss'
'seed=%d' printf seed

NB. generateblanks 'alu__' ==> 'alu__' , 'al_u_' , 'al__u' ...
generateblanks =: [: ~. i.@!@# A. ]
shuffle =: { ~ (# ? #)
