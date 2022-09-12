suits =: 'CHDS'
denoms =: 'A23456789TJQK'

suitidxof =: ((#denoms) <.@%~ ])"0
suitof =: suits {~ suitidxof

denomidxof =: ((#denoms) | ])"0
denomof =: denoms {~ denomidxof

cardoffwd =: (denomof , suitof)"0
numoffwd =: (((#denoms)) #. [: |. (denoms,:suits) i."1 0 ])"1

cardof =: cardoffwd :. numoffwd
numof =: numoffwd :. cardoffwd

Note 'sorting'
  Cards can thus be sorted more or less elegantly:

       ] myhand =: 'AS' , 'TH' ,: '3H'
    AS
    TH
    3H
       sort&.:numof myhand
    3H
    TH
    AS
)

pernum =: A.@i.~ sort NB. permutation number of set
shuf =: ?~@# { ] NB. shuffle a set

Note 'dealing'
  A full deck can be created and optionally shuffled using:

       ] mydeck =: cardof i. 52
    AC
    2C
    ...
       ] mydeck =: shuf mydeck
    9S
    7H
    ...

  And then a hand can be dealt by simply taking the first n cards:

       myhand =: 5 {. mydeck
    9S
    7H
    AH
    2S
    TH
       sort&.:numof myhand
    AH
    7H
    TH
    2S
    9S

  Although for full functionality a more nuanced approach would have
  to be used for representing deck dealing and state.
)
