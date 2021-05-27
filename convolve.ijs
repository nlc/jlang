2 2|.+/+/kernel *(,"0/~i.7)|.7 7{.(%+/@,)matrix

NB. Make a boolean matrix of some size with left, right and diagonal set
nmat =: (2&$$1,1,~0#~-&2)+.=@i.

NB. Make a "chessboard"
cb =: 2|+/~@i.

NB. Generalized dot product (works for any two equal-sized arrays of dim N)
dot=:[:+/^:_*

NB. Get subarray from 0, 0 to 2, 2
(0 0 ,: 2 2) ];.0 m

NB. Normalize kernel to 1
norm=:%+/^:_

NB. sobel convolve pgm image
, <. 255 * (]%[:>./,) (]-[:<./,) (1 1,:3 3) (+/@:,@:*)&vsobel;._3 img
