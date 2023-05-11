Note 'Kinematic variables'
  A vector of kinematic variables can be updated with a matrix based on a timestep.

  e.g. for parabolic motion under a constant acceleration:

  / 1   dt dt^2    0 \  / y \     / y' \
  | 0    1   dt    0 |  | v |     | v' |
  | 0    0    1    0 |  | a |  =  |  a |
  \ 0    0    0    1 /  \ 1 /     \  1 /

  For this example it wasn't necessary to make things homogeneous but I'm choosing
  the format for my experiments in this file by fiat.
)

dot =: +/ . *

NB. Make a matrix that describes constant acceleration over a fixed timestep x
mkmatconstaccel =: 3 : '4 4 $ 1 , y , (0.5 * *:y) , 0 0 1 , y , 0 0 0 1 0 0 0 0 1'
NB. constaccel =: mkmatconstaccel 0.001
NB. 

NB. Make a matrix that describes a system where a spring pulls a mass towards 0
NB. While this does yield an oscillatory motion with the right frequency,
NB. the amplitude erroneously grows, and pretty quickly.
mkmatspringaccel =: 4 : '4 4 $ 1 , y , (0.5 * *: y) , 0 0 1 , y , 0 , (- x) , 0 0 0 0 0 0 1'
NB. springaccel 0.5 mkmatspringaccel 0.001
NB. plot (10 * 2 o. (%: 0.5) * 0.001 * i. 50000) ,: {."1 (springaccel&dot)^:(i.50000) 10 0 0 1
