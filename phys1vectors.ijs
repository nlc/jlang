xy2r =: +/&.:*:
atan2 =: 12 o. j./
xy2a =: atan2
xy2ra =: xy2r , xy2a
ra2xy =: {. * 2 1 o. {:

c2p =: (xy2ra"1) :. (ra2xy"1)
p2c =: (ra2xy"1) :. (xy2ra"1)

NB. D1 =: 660 0
NB. D2 =: 440 , _45 * 180p_1
NB. D3 =: 550 , (180 + 53) % 180p_1
NB. echo +/&.:p2c D1 , D2 ,: D3 NB. => 796.881 _1.4846

padd =: +&.:p2c
psub =: -&.:p2c
psum =: +/&.:p2c NB. should be equiv. to addpolar/ but more efficient

pnorm =: (1) 0} ] NB. Simply replace the radius with 1
cnorm =: pnorm&.:c2p

d2r =: %&180p_1
r2d =: *&180p_1
