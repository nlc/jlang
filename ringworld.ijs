require 'format/printf'

sec2day =: %&86400
m2mi =: %&1609.344
G =: 9.81
RE =: 6.3781e6 NB. m
AE =: 4p1 * *: RE

R =: 1.4966899e11
V =: %: R * G
NB. H =: 1.3934e9 NB. width of the "ribbon"--same as solar diameter
H =: m2mi^:(_1) 1e6 NB. width of the "ribbon"--1 million miles

Om =: V % R
Th =: Om&*

falan =: sec2day Th^:(_1) 2p1

'Ringworld rotates at %f miles per second' printf m2mi V
'%f Earth days in one Ringworld rotation (falan)' printf falan
NB. A falan is only 25 minutes shy of exactly 9 Earth days

A =: H * 2p1 * R
earths =: A % AE
'The inner surface of the ring has an area of %e sq. mi.' printf m2mi^:2 A
'About %d Earth surfaces would fit onto the inside of one Ringworld' printf earths

Nu =: 0.3 NB. Poisson's Ratio--Who knows?--Using steel for now
Rh =: 7.9e3 NB. Density--Can be calculated from book description--Using steel for now
T =: 50 NB. Obtainable from book? -- Effectively negligible
Aa =: R NB. Inner Radius
A2 =: *: Aa
Bb =: R + T NB. Outer Radius
B2 =: *: Bb
R2 =: *: R
NB. Angular tensile stress for rotating ring
SiTh =: ((3 + Nu) % 8) * Rh * (Om ^ 2) * (A2 + B2 + ((A2 * B2) % R2) - ((1 + 3 * Nu) % (3 + Nu)) * R2)

'Radial stress = %e' printf SiR
'Angular stress = %e' printf SiTh

exit 1
