NB. Vector dot product. Rank 1 so it
NB. doubles as a matrix multiply.
dot =: +/ . *

NB. Turn an affine (x) and a translation
NB. coord (y) into a single homogenized
NB. 2D transformation.
homogenize =: 4 : '(x,0),"1 0(y,1)'

NB. barnsleya =: 4 2 2 $ 0.00 0.00 0.00 0.16 0.85 0.04 0.04 0.85 0.20 0.26 0.23 0.22 0.15 0.28 0.26 0.24
NB. barnsleyt =: 4 2 $ 0.00 0.00 0.00 1.60 0.00 1.60 0.00 0.44

barnsleya =: 4 2 2 $ 0 0 0 0.16 0.85 0.04 _0.04 0.85 0.20 _0.26 0.23 0.22 _0.15 0.28 0.26 0.24
barnsleyt =: 4 2 $ 0 0 0 1.6 0 1.6 0 0.44
barnsleyp =: 1 85 7 7

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
NB. Generate an array consisting of a
NB. number of copies each index in i. N
NB. corresponding to the probability
NB. of that index.
expandprobs =: ] # [: i. #
NB. expandprobs barnsleyp
