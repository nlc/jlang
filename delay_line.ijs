NB. 

sin =: 1&o.

lambda =: _. NB. Wavelength
k =: 2p1 % lambda NB. Wave number
a =: _. NB. Piston radius
Df =: [: (2 * J1 % ]) (k * a) * sin

P =: [: +/ () i.o
[: +/ P * L * (([: Df Th) % d) * [: ^ [: 0j1 * Phi + k * Delta
