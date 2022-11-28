Note 'https://en.wikipedia.org/wiki/Ray_transfer_matrix_analysis'
  Ray transfer matrix analysis (also known as ABCD matrix
  analysis) is a mathematical form for performing ray tracing
  calculations in sufficiently simple problems which can be
  solved considering only paraxial rays. Each optical element
  (surface, interface, mirror, or beam travel) is described
  by a 2×2 ray transfer matrix which operates on a vector
  describing an incoming light ray to calculate the outgoing
  ray. Multiplication of the successive matrices thus yields
  a concise ray transfer matrix describing the entire optical
  system. The same mathematics is also used in accelerator
  physics to track particles through the magnet installations
  of a particle accelerator, see electron optics.

  This technique, as described below, is derived using the
  paraxial approximation, which requires that all ray
  directions (directions normal to the wavefronts) are at
  small angles θ relative to the optical axis of the system,
  such that the approximation sin θ ≈ θ remains valid. A
  small θ further implies that the transverse extent of
  the ray bundles (x and y) is small compared to the length
  of the optical system (thus "paraxial"). Since a decent
  imaging system where this is not the case for all rays
  must still focus the paraxial rays correctly, this matrix
  method will properly describe the positions of focal
  planes and magnifications, however aberrations still need
  to be evaluated using full ray-tracing techniques.
)

NB. matrix multiplication
mult =: +/ . *

NB. m = propagation distance along optical axis
propagationRTM =: 1 : '2 2 $ 1 , m , 0 1'

NB. m = n1 , n2
flatrefractionRTM =: 1 : '2 2 $ 1 0 0 , %/ m'

NB. m = n1 , n2 , R (R > 0 for convex)
curvedrefractionRTM =: 1 : 0
  'n1 n2 r' =. m

  2 2 $ 1 0 , ((n1 - n2) % r * n2) , n1 % n2
)

NB. m = focal length
thinlensRTM =: 1 : '2 2 $ 1 0 , (-%m) , 1'

NB. m = n1 , n2 , R1 , R2 , t
thicklensRTM =: 1 : 0
  'n1 n2 r1 r2 t' =. m

  a =. 2 2 $ 1 0 , ((n2 - n1) % r2) , 1
  b =. 2 2 $ 1 , (t % n2) , 0 1
  c =. 2 2 $ 1 0 , ((n1 - n2) % r1) , 1

  a mult b mult c
)

NB. rays =: 1 ,"(0) 0.01 * i: 10
NB. lens mult"(2 1) 5 propagationRTM mult"(2 1) rays
