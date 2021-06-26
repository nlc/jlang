NB. Game of Life
]((3=])+4=*)(_1&|.+1&|.+])@:(_1&|."1+1&|."1+])
NB. Hell yeah
NB. 46 chars, not terrible.
+/@+/@((3 1$i:1)&|.@|:"2)^:2([=3+4=*)]
NB. 38 chars with a different approach
+/+/(,"0/~@i:1)&|. m
([:+/[:+/(,"0/~@i:1)&|.) m

NB. This is the one.
l=:(]=3+4=*)[:+/[:+/(,"0/~@i:1)&|.
'a very short implementation of cgol'
NB. 34 chars, including definition. Beats the StackExchange one by 5.

l=:(]=3+4=*)[:+/^:2(,"0/~@i:1)&|.
NB. Shaved off another one for 33.

NB. ell gets ope right eq three plus four eq times close cap sum twice ope
NB.   rav rank zo ject flex top steps one close bind rot

NB. Somebody on reddit came up with this based on my original
l=:(]=3+4=*)[:+/(>,{;~i:1)&|.
NB. ^ a clever use of the "catalogue" verb ({ y) to directly form a cartesian
NB. product,instead of the more common "table" adverb (u / y) over
NB. item-wise concatenation.

NB. The Rosetta Code Version:
e=:(3 3(+/e.3+0,4&{)@,;._3])@(0,0,~0,.0,.~])

(+/@+/@((_1+i.3 1)&|.@|:"2)^:2([=3+4=*)])^:(i.20)5 5|.7 7{.3 3$9{.|.#:482
q=: 3 : '+/(3 1$i:1)&|.|:y'

NB. Wolfram
NB. ((4*_1&|.)+2&*+1&|.)@:]{((8$0),~|.@:#:)@:[
NB. 42 chars, okay.
NB. ope ope four times neg one bind rot close plus two bind times plus one
NB.   bind rot close at right from ope ope eight shape zo close rav? flex
NB.   rot at base close at left

NB. The above appears to be incorrect. Here's an "adverb" (adjective?) version.
wolf =: 1 : '((8#2)|.@#:m){~+/1 2 4*(i:1)|."0 1 y'
wolf30 =: 30 wolf
NB. TODO: Add iteration based on an x argument

NB. FIXME: A more elegant "kernel":  #. |: (i: 1) |."(0 1) y


NB. Odd-sided square matrix of powers of 2
NB. Potentially useful for non-totalistic CA's
(2#1+2*])$2^[:i.[:*:1+2*]
NB. ope num one plus two times right close shape two pow cap ints cap
NB.   square one plus two times right

NB. Generates every permutation of given array
i.@!@#A.]
NB. ints top fac top num gram self

NB. save 8x the space with this one weird trick!
NB. a 1/6th pane of tmux, 120x34 chars, can hold almost 32,000 cells this way
NB. and the full ~360x70 can do 198720
br =: [: u: 10240&+
NB. b2b ([: br [: #. 0 2 4 1 3 5 6 7&{&.|.)"1
n2b =: ([: br 0 2 4 1 3 5 6 7&{&.|.&.((8$2)&#.^:_1))"0
n2b #. (4 2 ,: 4 2)([:|.,);._3 grid
n2b #. (4 2 ,: 4 2)([:|.,);._3 cgol cgol grid
g2b =: (4 2 ,: 4 2)&(([:n2b[:#.[:|.,);._3)
g2b"2 cgol^:10 grid

NB. A glider detector
NB. NB. two versions stacked
NB. gl =: 2 3 3 $ 0 1 0 0 0 1 1 1 1 1 0 0 0 1 1 1 1 0
NB. ([:(_1&|.&.|:)"2[:(_1&|.)"2([:,&0,&0&.|:)"2^:2) gl
NB. one wise
NB. damn turns out one is just a l/r shift of the other
gla =: 3 3 $ 0 1 0 0 0 1 1 1 1
glb =: 3 3 $ 1 0 0 0 1 1 1 1 0
NB. rotate 2D array counter-clockwise
ccw =: ([: |. |:)"2
NB.
gls =: 16 3 3 ($,) ccw (^: (i. 4))"2 (,:|:"2)gla,:glb
NB. embed 3x3 patterns in 5x5 zeros
egls =: ([:(_1&|.&.|:)"2[:(_1&|.)"2([:,&0,&0&.|:)"2^:2) gls
isgl =: [:+/egls&(-:"2)
+/^:_(1 1 ,: 5 5)(isgl);._3 g NB. count all the detected gliders
NB. Take "close-up shots" of the species of gliders found
egls#~ +/^:2(1 1 ,: 5 5)(egls&(-:"2));._3 g
