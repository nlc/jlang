Note 'allprob'
  Monte Carlo "probability" of getting all possible "rolls"
  from 0 to y in (}. x) throws, tried ({. x) times. e.g.
     10000 68 allprob 20
  0.5123

  Can be used to make a nice plot with
     plot > allprob&20 each { 10000 ,. i. 100
)
allprob =: ([: {. [) %~ [: +/ ] = [: #@~."1 ?@$

