NB. Turn an affine (x) and a translation
NB. coord (y) into a single homogenized
NB. 2D transformation.
homogenize =: 4 : '(x,0),"1 0(y,1)'

barnsleya =: 4 2 2 $ 0.00 0.00 0.00 0.16 0.85 0.04 0.04 0.85 0.20 0.26 0.23 0.22 0.15 0.28 0.26 0.24
barnsleyt =: 4 2 $ 0.00 0.00 0.00 1.60 0.00 1.60 0.00 0.44

barnsley =: barnsleya homogenize"2 1 barnsleyt

NB. Dot together a random sequence of
NB. members of a list of transforms.
randtransform =: 4 : 'dot/ x {~ ? y # # x'

NB. NOTE: Don't need a vector, just
NB. grab the rightmost elements of
NB. the final matrix.
locate =: (0 2 ; 1 2)&{

NB. TODO: Generate a list of lists of
NB. random indices and feed them all
NB. through together.

NB. TODO: Generate indices based on a
NB. probability distribution.


