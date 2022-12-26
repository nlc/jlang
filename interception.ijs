Note 'Formulation'
  Given:
    - Location <r_0> of target at time 0
    - Constant velocity <v> of target
    - Constant speed u of projectile launched from origin
      on straight-line intercept course towards the target

  Find the time t at which the projectile impacts the
  target, and at what angle it must be launched, or,
  equivalently, the x and y coordinates of the point
  of impact.

  The problem is (I believe) quadratic, so there may be 0,
  1 or 2 real-valued solutions to a given input.

  I believe we can use the quadratic formula, with values
    a = v^2 - u^2
    b = 2 * (r_0_x * v_x + r_0_y * v_y)
    c = r_0^2
  to calculate t.

  So far this has been borne out.
)

quadraticformula =: 3 : 0
  if. (1 $ 3) -: $ y do.
    'a b c' =. y
    ((- b) (+ , -) %: (*: b) - 4 * a * c) % 2 * a
  else.
    _.
  end.
)

NB. <rx , ry> (<s> interception) <vx , vy>
interception =: 1 : 0
  s =: m NB. projectile speed
  'rx ry' =. x NB. target starting location
  'vx vy' =. y NB. target constant velocity

  a =. (+/ *: vx , vy) - *: s
  b =. 2 * (rx * vx) + (ry * vy)
  c =. (+/ *: rx , ry)

  NB. Time to contact
  NB. t =. (>&0#]) quadraticformula a , b , c

  NB. ((rx, ry) +"1 (vx , vy) *"1 0 t) ,"1 0 t


  t =. quadraticformula a , b , c
)
