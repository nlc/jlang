require 'format/printf'

sec2day =: %&86400
m2mi =: %&1609.344
G =: 9.73
RE =: 6.3781e6 NB. m
AE =: 4p1 * *: RE

NB. R =: 1.4966899e11
NB. V =: %: R * G
NB. NB. H =: 1.3934e9 NB. width of the "ribbon"--same as solar diameter
NB. H =: m2mi^:(_1) 1e6 NB. width of the "ribbon"--1 million miles

NB. From Ringworld RPG via http://www.alcyone.com/max/reference/scifi/ringworld.html
R =: 153e9 NB. radius
V =: %: R * G
H =: 1.6e9 NB. width of the "ribbon"
T =: 50 NB. Effectively negligible
M =: 2.1e27 NB. mass

Om =: V % R
Th =: Om&*

falan =: 10 * sec2day Th^:(_1) 2p1 NB. Ten full revolutions

'Ringworld rotates at %.2f miles per second' printf m2mi V
'%.2f Earth days in 1 falan (10 Ringworld rotations)' printf falan
NB. If you use 1AU and 1 million miles, a revolution is only 25 minutes
NB.   shy of exactly 9 Earth days.
NB. Tragically, when the RPG numbers are used, it's not quite as clean--
NB.   just short of two hours more than 9 Earth days

A =: H * 2p1 * R
earths =: A % AE
'The inner surface of the ring has an area of%.2e sq. mi.' printf m2mi^:2 A
'About%.2e Earth surfaces would fit onto the inside of one Ringworld' printf earths

MJupiter =: 4.18e27
MSun =: 1.99e30
perjupiter =: M % MJupiter
persun =: M % MSun
'The Ringworld masses%.2e kg, about %.2f Jupiter masses or%.2e solar masses' printf M ; perjupiter ; persun

D =: T * A NB. Displacement
Nu =: 0.3 NB. Poisson's Ratio--Who knows?--Using steel for now
RhSteel =: 7.9e3 NB. Density--Can be calculated from book description--Using steel for now
Rh =: M % D
persteel =: Rh % RhSteel

'The density of scrith is %.2f kg/m3, about %.2f times that of steel' printf Rh ; persteel

Aa =: R NB. Inner Radius
A2 =: *: Aa
Bb =: R + T NB. Outer Radius
B2 =: *: Bb
R2 =: *: R
NB. Angular tensile stress for rotating ring
SiTh =: ((3 + Nu) % 8) * Rh * (Om ^ 2) * (A2 + B2 + ((A2 * B2) % R2) - ((1 + 3 * Nu) % (3 + Nu)) * R2)

'Angular stress =%.2e Pa' printf SiTh


a =: 680e6  NB. sun radius
r =: 43.9e9 NB. shadow square ring radius
b =: 153e9  NB. ringworld radius

asq =: *: a
bsq =: *: b
rsq =: *: r

cpr =: (%: bsq - asq) - (%: rsq - asq)
phi =: 2 * _2 o. (bsq + rsq - *: cpr) % (2 * b * r)
s =: b * phi NB. length of arc in twilight

omega =: 5.11e_6
rwomega =: 7.98e_6
omegamin =: rwomega - omega
omegamax =: rwomega + omega
omegas =: rwomega (- , ] , +) omega

ts =: phi % omegas

'Twilight lasts either %.2f, %.2f, or %.2f minutes, depending on spin direction' printf ts % 60

exit 1
