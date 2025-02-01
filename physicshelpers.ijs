NB. Unless otherwise noted, everything is assumed to be MKS and radians

NB. 2D vector math stuff
d2r =: deg =: %&180p_1
NB. experimental: "180 deg ==> 3.14159"
deg =: 1 : 'd2r m'
r2d =: *&180p_1
NB. experimental: "1 rad ==> 1"
rad =: 1 : 'm'
xy2r =: +/&.:*:
atan2 =: (12 o. [: j./ ])"1
xy2a =: atan2
xy2ra =: xy2r , xy2a
ra2xy =: {. * 2 1 o. {:

atr =: at =: ,
atd =: atr d2r

c2p =: (xy2ra"1) :. (ra2xy"1)
p2c =: (ra2xy"1) :. (xy2ra"1)

c2pd =: [: ({. , r2d@}.)"1 c2p

cadd =: +
csub =: -
csum =: +/

padd =: cadd&.:p2c
psub =: csub&.:p2c
psum =: csum&.:p2c NB. should be equiv. to padd/ but more efficient

cmag =: xy2r
pmag =: {. NB. always assuming radius is the first
cnorm =: % cmag
pnorm =: (1) 0} ] NB. Simply replace the radius with 1

sin =: 1&o.
cos =: 2&o.
tan =: 3&o.
asin =: _1&o.
acos =: _2&o.
atan =: _3&o.

re =: {.@+.
im =: {:@+.

dot =: +/ . * NB. also works as a matrix multiply--monadic invocation is the "permanent"
det =: -/ . * NB. matrix determinant

cross =: dyad define
  assert (3 = # x) *. (3 = # y)
  'a1 a2 a3' =. x
  'b1 b2 b3' =. y
  ((a2 * b3) - a3 * b2) , ((a3 * b1) - a1 * b3) , ((a1 * b2) - a2 * b1)
)

NB. angle between two vectors via dot product
angle =: [: acos dot % *&cmag

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

avg =: average =: mean =: +/%#

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
BoltzmannConstant =: BoltzmannsConstant =: 1.380649e_23 NB. J / K
ElementaryCharge =: ElectronCharge =: 1.602176634e_19 NB. C
PlanckConstant =: PlancksConstant =: 6.62607015e_34 NB. J s
SpeedOfLight =: 299792458 NB. m / s
Cs133HyperfineTransitionFrequency =: 9192631770 NB. Hz
LuminousEfficacy540THz =: 683 NB. lm / W
NB. Particle rest masses
ElectronMass =: 9.1093837015e_31 NB. kg -- rest mass
NeutronMass =: 1.67492749804e_27 NB. kg -- rest mass
ProtonMass =: 1.67262192369e_27 NB. kg -- rest mass
NB. Empirical universal constants
FineStructureConstant =: Alpha =: 0.0072973525643 NB. 1
GravitationalConstant =: NewtonsGravitationalConstant =: 6.67430e_11 NB. N m^2 / kg^2
HubbleConstant =: HubblesConstant =: 2.3009533e_18 NB. 1 / s -- aka 71 km / s Mpc; very approximate
NB. Derived constants
ReducedPlanckConstant =: ReducedPlancksConstant =: 1r2p_1 * PlancksConstant NB. J s
SpeedOfLightSquared =: *: SpeedOfLight NB. m^2 / s^2
PermeabilityOfFreeSpace =: VacuumPermeability =: MuNaught =: (2 * Alpha * PlancksConstant) % ((*: ElementaryCharge) * SpeedOfLight) NB. N / A^2
PermittivityOfFreeSpace =: VacuumPermittivity =: EpsilonNaught =: (*: ElementaryCharge) % (2 * Alpha * PlancksConstant * SpeedOfLight) NB. F / m
CoulombConstant =:CoulombsConstant =: 1r4p_1 * PermeabilityOfFreeSpace * SpeedOfLightSquared NB. N m^2 / C^2
GasConstant =: AvogadrosNumber * BoltzmannsConstant NB. J / K mol
RydbergConstant =: RydbergsConstant =: ((*: Alpha) * ElectronMass * SpeedOfLight) % (2 * PlancksConstant)
StefanBoltzmannConstant =: (2r15 * 1p5 * (BoltzmannsConstant ^ 4)) % (SpeedOfLightSquared * PlancksConstant ^ 3) NB. W / m^2 K^4

NB. Other empirical values
StandardGravity =: 9.80665 NB. m / s^2
EarthRadius =: 6.3781e6 NB. m
EarthMass =: 5.9722e24 NB. kg
MoonRadius =: 1.7374e6 NB. m -- Volumetric mean radius
MoonMass =: 7.346e22 NB. kg
SunRadius =: 6.967e8 NB. m
SunMass =: SolarMass =: 1.98847e30 NB. kg
AstronomicalUnit =: SolarDistance =: SunEarthDistance =: EarthOrbit =: 1.495978707e11 NB. m
LunarDistance =: EarthMoonDistance =: MoonOrbit =: LunarOrbit =: 384748000 NB. m -- Semi-major axis of lunar orbit; true value varies from 3.633e8 to 4.055e8
MercuryOrbit =: 5.79e10 NB. m
VenusOrbit =: 1.082e11 NB. m
MarsOrbit =: 2.28e11 NB. m
JupterOrbit =: 7.785e11 NB. m
SaturnOrbit =: 1.432e12 NB. m
UranusOrbit =: 2.867e12 NB. m
NeptuneOrbit =: 4.515e12 NB. m
PlutoOrbit =: 5.9064e12 NB. m
VisibleUniverseRadius =: 4.4e26 NB. m
SolarConstant =: 1360.8 NB. W / m^2
Atmosphere =: 101325 NB. Pa
WaterLatentHeatOfFusion =: 333550 NB. J / kg -- at 1 atm
WaterLatentHeatOfVaporization =: 2257000 NB. J / kg -- at 1 atm
WaterSpecificHeat =: WaterHeatCapacity =: WaterSpecificHeatCapacity =: 4184 NB. J / kg K
WaterIceSpecificHeat =: WaterIceHeatCapacity =: WaterIceSpecificHeatCapacity =: 2093 NB. J / kg K

NB. Temperature conversions
K2C =: -&273.15
C2K =: K2C^:_1
C2F =: 32 9r5&p.
F2C =: C2F^:_1
K2F =: C2F@K2C
F2K =: K2F^:_1

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

NB. multipole magnet (as in an accelerator) formula
NB. https://cds.cern.ch/record/1333874/files/1.pdf
multipole =: 2 : '(im , re) m * (x + 0j1 * y) ^ n - 1'

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
gamma =: gammafrac@beta NB. m * s^_1

NB. relativistic velocity addition
NB. I see A moving at v. A sees B moving at u'. What is u, the velocity of B with respect to me?
NB. u = (v + u')/(1 + (vu')/c^2)
rva =: + % 1 + SpeedOfLightSquared %~ *
NB. require 'plot'
NB. 'surface' plot rva"0/~ ((SpeedOfLight % 100) * i. 101)

schwarzschildradius =: (2 * GravitationalConstant % SpeedOfLightSquared)&*

Note 'Planck''s Law (Blackbody Distribution)'
  B(lambda, T) = ((2*h*c^2)/(lambda^5))*(1/(exp(hc/lambda*kB*T)-1))
  m -> W*sr^_1*m^_3

  T planckslaw lambda
)
planckslaw =: ((2 * PlancksConstant * SpeedOfLightSquared) % 5 ^~ ]) * [: % 1 -~ [: ^ (PlancksConstant * SpeedOfLight) % ] * BoltzmannsConstant * [

NB. experiment with loading IUPAC element weight data from a file.
NB. weights are in the fourth column.
ElementDataFilename =: 'element_data.tsv'
3 : 0 ''
  if. fexist ElementDataFilename do.
    ElementData =: > 4&{. each (9 { a.)&cut each cutLF fread ElementDataFilename
    elementbyid =: ElementData&(4 : ', x #~ > ((#$]) y)&-: each (1 {"1 x)')
    atomicmassamu =: [: ". 3 pick elementbyid
    atomicmasskg =: 1.6605391e_27 * atomicmassamu
    a:
  end.
)

NB. Same but for the ~100 brightest stars
StarDataFilename =: 'star_data.tsv'
3 : 0 ''
  if. fexist StarDataFilename do.
    StarData =: (0 1 3 4 6 7 9 { ])"1 > (9 { a.)&cut each cutLF fread StarDataFilename
    a:
  end.
)

NB. given in A, B, C (not how the p. method wants it!)
quadraticformula =: 3 : 0
  if. (1 $ 3) -: $ y do.
    'a b c' =. y
    ((- b) (+ , -) %: (*: b) - 4 * a * c) % 2 * a
  else.
    _.
  end.
)
NB. quadraticformula =: 1 pick [: p. |.

Note 'The Famous Five (and their rearrangements)'
  dt dx v0 v vavg a

  dx = v0 * dt + (a * dt^2) / 2
    '(v0 * dt) + 1r2 * a * dt^2'
    'dx'
    'dt' ; 'v0' ; 'a'
  v0 = (a * dt) / 2 - dx / dt
  dt = QF(a / 2, v0, -dx)
  a = 2 * (dx - v0 * dt) / (dt^2)

  v = v0 + a * dt
  v0 = v - a * dt
  a = (v - v0) / dt
  dt = (v - v0) / a

  vavg = dx / dt
  dx = vavg * dt
  dt = dx / vavg

  vavg = (v0 + v) / 2
  v0 = 2 * vavg - v
  v = 2 * vavg - v0

  NB. v^2 = v0^2 + 2 * a * dx
  v = (+/-)Sqrt(v0^2 + 2 * a * dx)
  v0 = (+/-)Sqrt(v^2 - 2 * a * dx)
  a = (v^2 - v0^2) / (2 * dx)
  dx = (v^2 - v0^2) / (2 * a)
)
