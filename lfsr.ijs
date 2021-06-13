tap =: 4 : 'XOR/(x&{) y'
lfsr =: 4 : '#. x (tap , [: }: ]) (16 # 2)&#: y'

NB. example data:
taps =: 10 12 13 15
s1 =: 16bace1
s2 =: 16b5670

s2 -: taps lfsr s1 NB. ==> 1
