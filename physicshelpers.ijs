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
psum =: +/&.:p2c NB. should be equiv. to padd/ but more efficient

pnorm =: (1) 0} ] NB. Simply replace the radius with 1
cnorm =: pnorm&.:c2p
cmag =: xy2r
pmag =: {. NB. always assuming radius is the first

d2r =: %&180p_1
r2d =: *&180p_1

dot =: +/ . * NB. also works as a matrix multiply

cross =: dyad define
  assert (3 = # x) *. (3 = # y)
  'a1 a2 a3' =. x
  'b1 b2 b3' =. y
  ((a2 * b3) - a3 * b2) , ((a3 * b1) - a1 * b3) , ((a1 * b2) - a2 * b1)
)

NB. More useful tools for Physics 1
pctdiff =: |@-%] NB. Percent difference from accepted value y

NB. Electric field
NB. <Q x y [z]>{1,} VERB <x y [z]>
efield =: dyad define
  k =. 8.987551e9
  data =. x
  charges =. {.&.|: data
  locations =. }.&.|: data
  point =. y

  displacements =: point -"1 locations
  mags =: cmag"1 displacements
  norms =: cnorm"1 displacements

  cfields =: norms *"(1 0) k * charges % *: mags
  +/ cfields
)

NB. This and the above could stand a refactor into maybe an adverb form
NB. Electric potential
NB. <Q x y [z]>{1,} VERB <x y [z]>
epotential =: dyad define
  k =. 8.987551e9
  data =. x
  charges =. {.&.|: data
  locations =. }.&.|: data
  point =. y

  displacements =: point -"1 locations
  mags =: cmag"1 displacements

  cfields =: k * charges % mags
  +/ cfields
)

NB. test
NB. a charge of 1 nC @ <0, 0>
NB. a charge of 2 nC @ <5, 0>
NB. a charge of 3 nC @ <3, 2>
myparticles =: 3 3 $ 1e_9 0 0 2e_9 5 0 3e_9 3 2
NB. viewmat ^. cmag"1 myparticles efield"(2 1) ,"0/~ +&0.00001 %&10 i. 100 NB. preliminary
NB. +/^:2(,"0/~ +&0.00001 %&100 i. 1000) * (]=(<./^:_)) cmag"1 myparticles efield"(2 1) ,"0/~ +&0.00001 %&100 i. 1000
NB. ^ find approximately where one of the "zeros" is