NB. Given a natural number N, find the first integer k
NB. for which k! > N ^ k

comp =: [ (([: ! ]) > [^]) [:i.]
surpass =: [: 1&(i.~) comp

echo (i. 20) surpass("0 0) 50

NB. Turns out this is A065027 in the OEIS
