tap =: 4 : 'XOR/(x&{) y'
NB. lfsr =: 4 : '#. x (tap , [: }: ]) (16 # 2)&#: y'
lfsr =: 2 : '#. n (tap , [: }: ]) (m # 2)&#: y'

NB. NB. example data:
NB. taps =: 10 12 13 15
NB. s1 =: 16bace1
NB. s2 =: 16b5670
NB. 
NB. l1 =: 16 lfsr taps
NB. 
NB. s2 -: l1 s1 NB. ==> 1
