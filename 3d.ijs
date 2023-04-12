spt =: 13 : '|. |: 1 (y) } x'

prj =: 4 : 0
  D =. x
  'rx ry rz' =. y
  (rx , ry) * D % D + rz
)

cube =: ;/ _5 _5 1 +"(1) 10 * #: i. 8
scr =: 20 20 $ 0

scr spt ([: <. 10 10 + ]) each 5 prj each cube
