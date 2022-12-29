Note 'WIP'
  This example works, generalize into generic:
  (i. 6 6) {~ ([: < 6 | (2 2 $ 2 1 1 1) +/ .*])@,"0/~ i. 6
)

ACMMAT =: 2 2 $ 1 1 1 2

NB. Generate Permutation Matrix
gpm =: 3 : '(i. y , y) {~ ([: < y | ACMMAT +/ . * ])@,"0/~i. y'

acm =: gpm@# { ,
