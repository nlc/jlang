Note 'WIP'
  This example works, generalize into generic:
  (i. 6 6) {~ ([: < 6 | (2 2 $ 2 1 1 1) +/ .*])@,"0/~ i. 6
)

NB. ACM =: 2 2 $ 1 1 2 1
mat =: 2 2 $ 1 1 1 2

NB. Generate Permutation Matrix
gpm =: 3 : 0
  'hh ww' =. y
  yxs =. (i. ww) <@,"0/~ (i. hh)
  NB. nxys =. ([: < (ww , hh) | ACM +/ . * ])"1 xys
  NB. nyxs =. ([: < y | ACM +/ . * ])"1 yxs
)

NB. Generate Permutation Matrix
gpm =: 3 : '(i. y , y) {~ ([: < y | ACM +/ . * ])@,"0/~i. y'

acm =: gpm@# { ,
