   round =: [:<.0.5+]

   btc1a =: 3 : 0
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

   btc1b =: 3 : 0
'ab bs' =. y
(2&#@%:@# $ ]) bs { ab NB. Careful, this assumes blocks are square
)

p2 =: [: > [: ".&.> 4 }. [: cutLF fread NB. Adjust behead number to fit
img =: p2 'C:\Users\nchaveri\Downloads\mona_lisa.ascii.pgm' NB. File goes here

>btc1a each , (4 4 ,: 4 4) <;._3 img

viewmat > , each/"1 ,/"1 each/"1 (2 2 $ 4) <@btc1b@btc1a;._3 img
