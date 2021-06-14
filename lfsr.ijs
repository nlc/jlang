tap =: 4 : 'XOR/(x&{) y'
NB. lfsr =: 4 : '#. x (tap , [: }: ]) (16 # 2)&#: y'
lfsr =: 2 : '#. n (tap , [: }: ]) (m # 2)&#: y'

NB. example data:
taps =: 10 12 13 15
s1 =: 16bace1
s2 =: 16b5670

l1 =: 16 lfsr taps

s2 -: l1 s1 NB. ==> 1
