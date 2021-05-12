NB. Circle function from page 51
NB. A simple demonstration of Chaitin complexity
circ =: 4 : '(*:x)>+"0/~*:1r2+(i.--:)y'


NB. Firm Model profit function from page 151
NB. F = RQ - LW - rK

NB. V / (Q ^ (eta))
pricepersupply =: 3 : 0
  eta =. 1r2
  scalefactor =. paramV
  numbuyers =. x

  scalefactor % numbuyers ^ 
)

NB. Q(L, K) = L^beta * K^(1 - beta)
NB. L Q K
firmproduction =: 4 : 0
  beta =. 4r5
  numhires =. x
  borrowcapital =. y

  (numhires ^ beta) * (borrowcapital ^ 1 - beta)
)

firmprofit =: 4 : 0
  numhires =. paramL
  borrowcapital =. paramK
  hirewages =. paramW
  interestrate =. paramSmallR

  
)
