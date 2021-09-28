NB. Unless otherwise noted, everything is assumed to be MKS

NB. 2D vector math stuff
d2r =: %&180p_1
r2d =: *&180p_1
xy2r =: +/&.:*:
atan2 =: 12 o. j./
xy2a =: atan2
xy2ra =: xy2r , xy2a
ra2xy =: {. * 2 1 o. {:

atr =: ,
atd =: atr d2r

c2p =: (xy2ra"1) :. (ra2xy"1)
p2c =: (ra2xy"1) :. (xy2ra"1)

cadd =: +
csub =: -
csum =: +/

padd =: cadd&.:p2c
psub =: csub&.:p2c
psum =: csum&.:p2c NB. should be equiv. to padd/ but more efficient

pnorm =: (1) 0} ] NB. Simply replace the radius with 1
cnorm =: pnorm&.:c2p
cmag =: xy2r
pmag =: {. NB. always assuming radius is the first

sin =: 1&o.
cos =: 2&o.
tan =: 3&o.

dot =: +/ . * NB. also works as a matrix multiply

cross =: dyad define
  assert (3 = # x) *. (3 = # y)
  'a1 a2 a3' =. x
  'b1 b2 b3' =. y
  ((a2 * b3) - a3 * b2) , ((a3 * b1) - a1 * b3) , ((a1 * b2) - a2 * b1)
)

NB. Some constants
AvogadroNumber =: AvogadrosNumber =: 6.02214076e23 NB. 1
BoltzmannConstant =: BoltzmannsConstant =: 1.380649e_23 NB. J*K^_1
CoulombConstant =:CoulombsConstant =: 8.987551e9 NB. N*(m^2)*C^2
GravitationalConstant =: 6.674e_11 NB. (m^3)*(kg^_1)*s^_2
PermeabilityOfFreeSpace =: VacuumPermeability =: MuNaught =: 1.25663706212e_6 NB. H*m^_1
PermittivityOfFreeSpace =: VacuumPermittivity =: EpsilonNaught =: 8.8541878176e_12 NB. F*m^_1
PlanckConstant =: PlancksConstant =: 6.62607015e_34 NB. J*Hz^_1
ReducedPlanckConstant =: ReducedPlancksConstant =: 2p_1 * PlanckConstant NB. J*Hz^_1
SpeedOfLight =: 299792458 NB. m*s^_1
SpeedOfLightSquared =: *: SpeedOfLight NB. (m^2)*s^_2

NB. Some useful values
EarthRadius =: 6.3781e6 NB. m
EarthMass =: 5.9722e24 NB. kg
ElementaryCharge =: 1.602176634e_19 NB. C
ElectronMass =: 9.1093837015e_31 NB. kg (rest mass)
ProtonMass =: 1.67262192369e_27 NB. kg (rest mass)
StandardGravity =: 9.80665 NB. m*s_2

NB.
NB. More useful tools for freshman-level physics
NB.

NB. Percent difference from accepted value x
pctdiff =: |@-%[

NB. Electric field
NB. <Q x y [z]>{1,} VERB <x y [z]>
efield =: dyad define
  k =. CoulombsConstant
  data =. x
  charges =. {.&.|: data
  locations =. }.&.|: data
  point =. y

  displacements =. point -"1 locations
  mags =. cmag"1 displacements
  norms =. cnorm"1 displacements

  cfields =. norms *"(1 0) k * charges % *: mags
  +/ cfields
)

NB. This and the above could stand a refactor into maybe an adverb form
NB. Electric potential
NB. <Q x y [z]>{1,} VERB <x y [z]>
epotential =: dyad define
  k =. CoulombsConstant
  data =. x
  charges =. {.&.|: data
  locations =. }.&.|: data
  point =. y

  displacements =. point -"1 locations
  mags =. cmag"1 displacements

  cfields =. k * charges % mags
  +/ cfields
)

NB. NB. test
NB. NB. a charge of 1 nC @ <0, 0>
NB. NB. a charge of 2 nC @ <5, 0>
NB. NB. a charge of 3 nC @ <3, 2>
NB. myparticles =: 3 3 $ 1e_9 0 0 2e_9 5 0 3e_9 3 2 4e9 9 9
NB. viewmat ^. cmag"1 myparticles efield"(2 1) ,"0/~ +&0.00001 %&10 i. 100 NB. preliminary
NB. +/^:2(,"0/~ +&0.00001 %&100 i. 1000) * (]=(<./^:_)) cmag"1 myparticles efield"(2 1) ,"0/~ +&0.00001 %&100 i. 1000
NB. NB. ^ find approximately where one of the "zeros" is
NB. rim =: _1&$: : (4 : 'x ,. (x , y , x) ,. x')
NB. fieldmag =: cmag"1 myparticles efield"(2 1) ,"0/~ +&0.00001 %&10 i. 100
NB. *./"(1) 3 3 ((0 1 2 3 5 6 7 8&{>:4&{)@,);._3 (__&rim) fieldmag
NB. NB. ^ find whether each grid square is a local minimum

NB. resistors/capacitors in series/parallel
rseries =: cparallel =: +
rparallel =: cseries =: +&.%

NB. experiment with loading unit definitions from the `units` command database
unitsfilename =: '/usr/share/misc/units.lib'
units =: a:
3 : 0 ''
  if. fexist unitsfilename do.
    unitsraw =: cutopen fread unitsfilename

    units =: unitsraw NB. TODO perform some processing
  end.
)

commutator =: 2 : '(u v y) - (v u y)' NB. QM commutation operator

I =: =/~@i.

NB. Create a "squred-distance" measure based on a metric signature
metric =: 1 : '+/ m +/ . * *: y - x'
euclidean2mt =: I 2 NB. 2D Euclidean metric tensor
euclidean3mt =: I 3
minkowskimt =: _1 1 1 1 * I 4
minkowski2mt =: _1 1 * I 2
euclidean2 =: euclidean2mt metric
euclidean3 =: euclidean3mt metric
minkowski =: minkowskimt metric
minkowski2 =: minkowski2mt metric

NB. tempdata =: 0 0 minkowski2"1/~ ,"0/~ 10 %~ i: 100
NB. NB. Cute diagram
NB. require 'viewmat'
NB. viewmat tempdata
NB. NB. Surface plot
NB. require 'plot'
NB. 'wire' plot tempdata

NB. Planck's Law (Blackbody Distribution)
NB. B(lambda, T) = ((2*h*c^2)/(lambda^5))*(1/(exp(hc/lambda*kB*T)-1))
NB. m -> W*sr^_1*m^_3
planckslaw =: ((2 * PlancksConstant * SpeedOfLightSquared) % 5 ^~ ]) * [: % 1 -~ [: ^ (PlancksConstant * SpeedOfLight) % ] * BoltzmannsConstant * [
