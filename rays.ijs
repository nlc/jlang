NB. Lines in the form <b m>: y = mx + b <-> y = <line> p. x

NB. require 'plot'
NB. plot (line1 p. i. 3) ,: (line2 p. i. 3)

IND =: _. _.

Note 'Special cases'
  * Same slope, no intersection
  * Vertical line (represent as <x-intercept> , _)
  * Infinite intercept?
)
intersection =: 4 : 0
  'bs ms' =. |: x ,: y
  'b1 b2' =. bs
  'm1 m2' =. ms

  if. m1 = m2 do. NB. parallel lines
    IND
  elseif. _ = | b1 do. NB. infinite intercept, nothing crosses
    IND
  elseif. _ = | b2 do. NB. infinite intercept, nothing crosses
    IND
  elseif. _ = | m1 do. NB. infinite slope, assume intercept is for x
    b1 , y p. b1
  elseif. _ = | m2 do. NB. infinite slope, assume intercept is for x
    b2 , x p. b2
  else.
    (%. (- ms) ,"(0) 1) +/ . * bs
  end.
)

Note 'Special cases'
  * vertical
)
NB. SISE = "slope-intercept/start-end"
pair_to_sise_fwd =: 3 : 0
  'x1 y1 x2 y2' =. , sort y

  if. x1 = x2 do.
    x1 , _ , y1 , y2
  else.
    slope =. (y2 - y1) % x2 - x1
    intercept =. y1 - slope * x1

    intercept , slope , x1 , x2
  end.
)

sise_to_pair_fwd =: 3 : 0
  'b1 m1 s1 e1' =. y

  if. m1 = _ do.
    2 2 $ b1 , s1 , b1 , e1
  else.
    (s1 , e1) ,"0 ((b1 , m1) p. s1 , e1)
  end.
)

pair_to_sise =: pair_to_sise_fwd :. sise_to_pair_fwd
sise_to_pair =: sise_to_pair_fwd :. pair_to_sise_fwd

isvertical =: 3 : 0
  _ = 1 { y
)

contains =: 4 : 0
  'start end' =. x

  (start <: y) AND end >: y
)

sise_intersection =: 4 : 0
  'b1 m1 s1 e1' =. x
  'b2 m2 s2 e2' =. y

  i =. (b1 , m1) intersection b2 , m2

  if. i = IND do.
    IND
  else.
    v1 =. isvertical x
    v2 =. isvertical y
    if. (-. v1) AND (-. v2) AND ((s1 , e1) contains {. i) AND ((s2 , e2) contains {. i) do.
      i
    elseif. (v1) AND (-. v2) AND ((s1 , e1) contains {: i) AND ((s2 , e2) contains {. i) do.
      i
    elseif. (-. v1) AND (v2) AND ((s1 , e1) contains {. i) AND ((s2 , e2) contains {: i) do.
      i
    else.
      IND NB. both vertical, no intersection
    end.
  end.
)

line_reflect =: 2p1 | 2&*@[ - ]
line_refract_relative =: 2 : '_1 o. (m % n) * 1 o. y'

rays_test0 =: 3 : 0
  line1 =. 1 1
  line2 =. 2 _1r2
  line3 =. 0 0
  line4 =. 19 _4
  line5 =. 1 _
  line6 =. 2 _
  line7 =. _ 9

  lines =. line1 , line2 , line3 , line4 , line5 , line6 ,: line7

  {@intersection"1/~ lines
)

rays_test1 =: 3 : 0
  require 'plot'
  pts =. 5 2 $ 3 1 5 2 4 3 2 3 1 2
  sises =. 5 {. 2 pair_to_sise\ pts , pts
  plot (2 {."1 sises) p."(1) i. 10 NB. "diamond"-shaped center
)
