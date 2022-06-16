invsqrt2 =: % %: 2 NB. oof

real =: {.@+.
imag =: {:@+.

ket0 =: 1 0 NB. |0>
ket1 =: 0 1 NB. |1>
ketP =: invsqrt2 * 1 1 NB. |+>
ketM =: invsqrt2 * 1 _1 NB. |->

xmat =: 2 2 $ 0 1 1 0 NB. NOT gate
x =: xmat (+/ . * ])"(2 1) ]
hmat =: invsqrt2 * 2 2 $ 1 1 1 _1 NB. Hadamard Gate
h =: hmat (+/ . * ])"(2 1) ]

NB. Transform back and forth from alpha/beta to p/phi
coefficients2ProbPhase =: 3 : 0
  if. y = ket0 do.
    0 0
  else.
    'alpha beta' =: 2 {. y

    prob =: 1 - *: alpha
    phase =: 0j_1 * ^. beta % %: prob

    prob , phase
  end.
)
probPhase2Coefficients =: 3 : 0
  'prob phase' =: 2 {. y

  alpha =: %: 1 - prob
  beta =: (^ j. phase) * %: prob

  alpha , beta
)

NB. Basic unary gate definitions
p =: 4 : 0
  probPhase2Coefficients _ 2p1 | (0 , x) + coefficients2ProbPhase y
)
t =: 1r4p1&p
s =: 1r2p1&p
z =: 1p1&p
tinv =: _1r4p1&p
sinv =: _1r2p1&p

NB. Measure
measure =: 3 : '-. (? 0) < ({. % +/) real y'"1
