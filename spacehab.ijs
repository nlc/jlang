area =: 10000000000 NB. m2
NB. area =: 2.6e8
ratio =: 7 NB. (ratio of h to d=2*r)
gravity =: 9.81
ceiling =: 1000 NB. meters

h =: %: area % (ratio * 1p1)
d =: h * ratio
r =: d % 2
c =: 2p1 * r

omega =: %: gravity % r
v =: omega * r


