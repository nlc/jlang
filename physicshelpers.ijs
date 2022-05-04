NB. Unless otherwise noted, everything is assumed to be MKS

NB. 2D vector math stuff
d2r =: deg =: %&180p_1
NB. experimental: "180 deg ==> 3.14159"
deg =: 1 : 'd2r m'
r2d =: rad =: *&180p_1
NB. experimental: "1 rad ==> 57.2958"
rad =: 1 : 'r2d m'
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

dot =: +/ . * NB. also works as a matrix multiply--monadic invocation is the "permanent"
det =: -/ . * NB. matrix determinant

cross =: dyad define
  assert (3 = # x) *. (3 = # y)
  'a1 a2 a3' =. x
  'b1 b2 b3' =. y
  ((a2 * b3) - a3 * b2) , ((a3 * b1) - a1 * b3) , ((a1 * b2) - a2 * b1)
)

NB. rotation/translation matrices
rmat=: 1 (< 2 2) } 3 3 {. 2 2 $ 1 _1 1 1 * 2 1 1 2&o.
tmat =: ] ((0 2 ; 1 2) })&(=/~@i.3)
NB. have to ensure the vector is in homogeneous coordinates: <x, y, 1>
homogeneousfwd =: ,&1"1
homogeneousinv =: _1&}."1
homogeneous =: homogeneousfwd :. homogeneousinv
Note 'Example: Rotate a square by the top right corner'
     ]pts =: #: i. 4
  0 0
  1 0
  0 1
  1 1
     (((tmat 1 1) dot (rmat _1r4p1) dot (%. tmat 1 1)) dot"(2 1) ])&.:homogeneous pts
  _0.414214        1
   0.292893  1.70711
   0.292893 0.292893
          1        1
)
NB. "_1r4p1 rundert 1 1" means "rotate by _1r4p1 about the point 1, 1"
rundert =: 4 : '(tmat y) dot (rmat x) dot (%. tmat y)'
transform =: 4 : '(x dot"(2 1) ])&.:homogeneous y'
NB. The equivalent to the above is then: (_1r4p1 rundert 1 1) transform pts

avg =: +/%#

NB. Center Of Gravity for set of discrete points
NB. Optionally add masses as x argument
NB. cog =: 3 : 0
NB.   avg y
NB. :
NB.   (+/ x * y) % (+/ x)
NB. )
cog =: avg : (+/@:* % +/@:[) NB. p sure this works but keeping explicit ver. around jic

NB. Universal constants
NB. 2019 SI defining constants
AvogadroNumber =: AvogadrosNumber =: 6.02214076e23 NB. 1
BoltzmannConstant =: BoltzmannsConstant =: 1.380649e_23 NB. J*K^_1
ElementaryCharge =: ElectronCharge =: 1.602176634e_19 NB. C
PlanckConstant =: PlancksConstant =: 6.62607015e_34 NB. J*Hz^_1
ReducedPlanckConstant =: ReducedPlancksConstant =: 1r2p_1 * PlanckConstant NB. J*Hz^_1
SpeedOfLight =: 299792458 NB. m*s^_1
SpeedOfLightSquared =: *: SpeedOfLight NB. (m^2)*s^_2
NB. Non-defining constants
GravitationalConstant =: 6.674e_11 NB. (m^3)*(kg^_1)*s^_2
PermeabilityOfFreeSpace =: VacuumPermeability =: MuNaught =: 1.25663706212e_6 NB. H*m^_1
NB. Particle rest masses
ElectronMass =: 9.1093837015e_31 NB. kg (rest mass)
NeutronMass =: 1.67492749804e_27 NB. kg (rest mass)
ProtonMass =: 1.67262192369e_27 NB. kg (rest mass)
NB. Derived constants
CoulombConstant =:CoulombsConstant =: 1r4p_1 * PermeabilityOfFreeSpace * SpeedOfLightSquared NB. N*(m^2)*C^2
FineStructureConstant =: Alpha =: CoulombsConstant * (ElementaryCharge ^ 2) % ReducedPlancksConstant * SpeedOfLight NB. 1
GasConstant =: AvogadrosNumber * BoltzmannsConstant NB. J*(K*mol)^_1
PermittivityOfFreeSpace =: VacuumPermittivity =: EpsilonNaught =: % PermeabilityOfFreeSpace * SpeedOfLightSquared NB. F*m^_1
RydbergConstant =: RydbergsConstant =: (ElectronMass * (ElementaryCharge ^ 4) * (PermeabilityOfFreeSpace ^ 2) * (SpeedOfLight ^ 3)) % 8 * PlancksConstant ^ 3 NB. m^_1
StefanBoltzmannConstant =: (2r15 * 1p5 * (BoltzmannsConstant ^ 4)) % (SpeedOfLightSquared * PlancksConstant ^ 3) NB. W*(m^_2)*K^_4

NB. Some useful empirical values
StandardGravity =: 9.80665 NB. m*s_2
EarthRadius =: 6.3781e6 NB. m
EarthMass =: 5.9722e24 NB. kg
MoonRadius =: 1.7374e7 NB. m -- Volumetric mean radius
MoonMass =: 7.346e22 NB. kg
SunRadius =: 6.967e8 NB. m
SunMass =: SolarMass =: 1.98847e30 NB. kg
AstronomicalUnit =: 1.495978707e11 NB. m
LunarDistance =: 384748000 NB. m -- Semi-major axis of lunar orbit; true value varies from 3.633e8 to 4.055e8
VisibleUniverseRadius =: 4.4e26 NB. m
SolarConstant =: 1360.8 NB. W*m_2

NB. Temperature conversions
K2C =: -&273.15
C2K =: KtoC^:_1
C2F =: 32 9r5&p.
F2C =: CtoF^:_1
K2F =: CtoF@KtoC
F2K =: KtoF^:_1

NB.
NB. More useful tools for freshman-level physics
NB.

NB. Percent difference from accepted value x
pctdiff =: |@-%[
pctdiff2 =: 2*|@-%+ NB. some teachers do "difference over average"

NB. Electric field from point charges
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
  +/"2 ,: cfields
)

NB. This and the above could stand a refactor into maybe an adverb form
NB. Electric potential from point charges
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

NB. <Q x y [z]>{1,} VERB <Q x y [z]>
eforce =: dyad define
  charge =. {.&.|: y
  location =. }.&.|: y

  charge * x efield location
)
NB. ^ not quite working for the crude table of forces I want

NB. <Q x y [z]>{1,} VERB <Q x y [z]>
NB. This and the above could stand a refactor into maybe an adverb form
epotentialenergy =: dyad define
  charge =. {.&.|: y
  location =. }.&.|: y

  charge * x epotential location
)

NB. NB. test
NB. NB. a charge of 1 nC @ <0, 0>
NB. NB. a charge of 2 nC @ <5, 0>
NB. NB. a charge of 3 nC @ <3, 2>
NB. myparticles =: 4 3 $ 1e_9 0 0 2e_9 5 0 3e_9 3 2 4e_9 9 9
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

NB. Photon wavelength/frequency/energy
wavelength2frequency =: lambda2f =: SpeedOfLight&%
frequency2wavelength =: f2lambda =: wavelength2frequency^:_1
wavelength2energy =: lambda2e =: (PlancksConstant * SpeedOfLight)&%
energy2wavelength =: e2lambda =: wavelength2energy^:_1
frequency2energy =: f2e =: (PlancksConstant * SpeedOfLight)&%@frequency2wavelength
energy2frequency =: e2f =: frequency2energy^:_1
ev2j =: *&ElementaryCharge
j2ev =: ev2j^:_1

NB. RLC Circuits
NB. <capacitance> cimpedance <frequency>
cimpedance =: 1 % 2p1 * *
limpedance =: 2p1 * *

NB. Propagation of uncertainty
Note 'Approximation'
  The following definitions ignore a third, linear term
  under the square root, since most intro physics programs
  don't use it. If necessary it would be easy to alter the
  functions to include it.
)
ucon =: (] , |)@[ * ] NB. <constant> ucon <x, delta(x)>
umuldiv =: 1 : 0 NB. <x, delta(x)> <umul/udiv> <y, delta(y)>
  'a da' =. x
  'b db' =. y
  ra =. da % a
  rb =. db % b

  w =. a u b

  dw =: (|w) * +/&.:*: ra , rb

  w , dw
)
umul =: * umuldiv
udiv =: % umuldiv
uaddsub =: 1 : 0 NB. <x, delta(x)> <uadd/usub> <y, delta(y)>
  'a da' =. x
  'b db' =. y

  w =. a u b

  dw =: +/&.:*: da , db

  w , dw
)
uadd =: + uaddsub
usub =: - uaddsub
upow =: 4 : 0
  'a da' =. x
  ra =. da % a
  p =. y

  w =. a ^ p

  dw =: w * p * ra

  w , dw
)

NB. Hydrogen lines
NB. energy of solitary electron with n=y about nucleus with Z=x
hydrogenic =: [: - (PlanckConstant * SpeedOfLight * RydbergConstant) * %&*:
hydrogenictransition =: 1 : '(-&(m&hydrogenic))'
hydrogenspectralseries =: 1 : '- e2lambda m (1 hydrogenictransition) 1 + m + y'
lyman =: 1 hydrogenspectralseries
balmer =: 2 hydrogenspectralseries
pascen =: 3 hydrogenspectralseries
brackett =: 4 hydrogenspectralseries
pfund =: 5 hydrogenspectralseries
humphreys =: 6 hydrogenspectralseries
NB. balmer i. 4 ==> 6.56112e_7 4.86009e_7 4.33937e_7 4.1007e_7

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

NB. Relativity
NB. Create a "squared-distance" measure based on a metric signature
I =: =/~@i. NB. Identity matrix of dimension y
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

NB. from relativity.ijs
beta =: %&SpeedOfLight NB. m * s^_1
gammafrac =: [: % -.&.*:
gamma =: gammafrac@beta_ms NB. m * s^_1

NB. relativistic velocity addition
NB. I see A moving at v. A sees B moving at u'. What is u, the velocity of B with respect to me?
NB. u = (v + u')/(1 + (vu')/c^2)
rva =: + % 1 + SpeedOfLightSquared %~ *
NB. require 'plot'
NB. 'surface' plot rva"0/~ ((SpeedOfLight % 100) * i. 101)

Note 'Planck''s Law (Blackbody Distribution)'
  B(lambda, T) = ((2*h*c^2)/(lambda^5))*(1/(exp(hc/lambda*kB*T)-1))
  m -> W*sr^_1*m^_3

  T planckslaw lambda
)
planckslaw =: ((2 * PlancksConstant * SpeedOfLightSquared) % 5 ^~ ]) * [: % 1 -~ [: ^ (PlancksConstant * SpeedOfLight) % ] * BoltzmannsConstant * [
