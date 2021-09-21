require 'physicshelpers.ijs'

s =: 1 NB. arbitrary
a =: 1r8p1 NB. 360 % 16

NB. r2 =: %: 2
NB. r2s =: r2 * s
NB. s2 =: s % 2
NB. r2s4 =: r2s % 4
NB. r54s =: s * %: 5r4

NB. r54s atd _5 * a
NB. c2p (-r2s4) , (-s)

NB. definition of path as list of polar vectors
NB. pvs =: 8 2 $ 0 0 , (r54s atd _5 * a) , (s2 atd _2 * a) , (r2s4 atd 4 * a) , (s2 atd 0) , (r2s4 atd 2 * a) , (r2s4 atd _2 * a) , (s2 atd 4 * a) NB. wrong

r2 =: %: 2
r2s =: r2 * s
tp8 =: 3 o. a NB. tan(pi/8)
stp8 =: s * tp8
nstp8 =: 1 - stp8
b =: +/&.:*: s , stp8

NB. pvs =: 8 2 $ 0 0 , (b atr _5 * a) , ()
locs =: 8 2 $ 0 0 , (p2c b atr _5 * a) , (0 , -r2s) , (0 , -s) , (stp8 , -s) , ((stp8 , -s) cadd p2c stp8 atr 2 * a) , (s , -s) , (s , -stp8)

echo locs

NB. echo p2c padd/\pvs

