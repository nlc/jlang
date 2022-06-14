invsqrt2 =: % %: 2 NB. oof

ket0 =: 1 0 NB. |0>
ket1 =: 0 1 NB. |1>
ketP =: invsqrt2 * 1 1 NB. |+>
ketM =: invsqrt2 * 1 _1 NB. |->

xmat =: 2 2 $ 0 1 1 0 NB. NOT gate
x =: xmat (+/ . * ])"(2 1) ]
hmat =: invsqrt2 * 2 2 $ 1 1 1 _1 NB. Hadamard Gate
h =: hmat (+/ . * ])"(2 1) ]

measure =: 3 : '-. (? 0) < ({. % +/) | y'"1


probPhase2Coefficients =: 3 : 0
  'prob phase' =: 2 {. y

  alpha =: %: 1 - prob
  beta =: (^ j. phase) * %: prob

  alpha , beta
)

coefficients2ProbPhase =: 3 : 0
  'alpha beta' =: 2 {. y

  prob =: 1 - *: alpha
  phase =: 0j_1 * ^. beta % %: prob

  prob , phase
)

