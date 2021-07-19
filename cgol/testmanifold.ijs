load 'cgol.ijs'
load 'manifold.ijs'

g =: 8 5 $ (i. 40) e. 7 13 16 17 18

lp =: l plane NB. Life on a Plane
lc =: l cylinder NB. Life on a Cylinder
lt =: l torus NB. Life on a Torus
lm =: l mobius NB. Life on a Mobius strip
lk =: l klein NB. Life on a Klein bottle
lr =: l rp2 NB. Life on a Real Projective Plane

NB. Based on my gen_draw2 in scholes_life.ijs
gendraw =: 1 : 0
  echo 27 91 50 74 27 91 72 { a. NB. escape code hack to clear the screen
  pic =: y { (u: 183 9017)
  echo pic
  usleep 1e6 * 1r8
  u y
)

0 $ lk gendraw^:81 g NB. 'l klein gendraw^:81 g' works also
