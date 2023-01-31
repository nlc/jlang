Note 'Block Truncation Coding'
  Block Truncation Coding (BTC) is a type of lossy image compression technique for
  greyscale images. It divides the original images into blocks and then uses a
  quantizer to reduce the number of grey levels in each block whilst maintaining
  the same mean and standard deviation. It is an early predecessor of the popular
  hardware DXTC technique, although BTC compression method was first adapted to color
  long before DXTC using a very similar approach called Color Cell Compression.
  BTC has also been adapted to video compression.
)

require 'standard_deviation.ijs'

round =: [:<.0.5+]

btcfwd =: 3 : 0
   ns =. , y
   mn =. mean ns
   sd =. sdp ns
   km =. # ns
   bs =. ns > mn
   kq =. +/ bs
   ka =. round mn - sd * %: kq % km - kq
   kb =. round mn + sd * %: (km - kq) % kq
   (ka , kb) ; bs
)

btcinv =: 3 : 0
   'ab bs' =. y
   (2&#@%:@# $ ]) bs { ab NB. Careful, this assumes blocks are square
)

btc =: btcfwd :. btcinv

folder =: 'C:\Users\nchaveri\Downloads\'

p2 =: [: > [: ".&.> 4 }. [: cutLF fread NB. Adjust behead number to fit
img =: p2 folder , 'mona_lisa.ascii.pgm' NB. File goes here

NB. >btc1a each , (4 4 ,: 4 4) <;._3 img

require 'viewmat'
viewmat img
viewmat > , each/"1 ,/"1 each/"1 (2 2 $ 4) <@(]&.:btc);._3 img

out4 =: > , each/"1 ,/"1 each/"1 (2 2 $ 4) <@(]&.:btc);._3 img
out8 =: > , each/"1 ,/"1 each/"1 (2 2 $ 8) <@(]&.:btc);._3 img

hackywrite =: 4 : 0
  fname =. y
  contents =. x
  fname fwrite~ 'P2' , LF , (": |. $ contents) , LF , '255' , LF , ([,LF,])/ ": contents
)

img hackywrite folder , 'temp.ascii.pgm'
out4 hackywrite folder , 'temp4.ascii.pgm'
out8 hackywrite folder , 'temp8.ascii.pgm'
