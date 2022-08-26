require 'graphics/jpeg'

r =: (0 { 3 8 $ ])&.#:"0
g =: (1 { 3 8 $ ])&.#:"0
b =: (2 { 3 8 $ ])&.#:"0

rgb =: r , g ,: b

expval =: (+/@[%~[:+/*) i.@#

sobelx =: 3 3 $ 1 0 _1 2 0 _2 1 0 _1
sobely =: |: sobelx

(2 2 $ 1 1 3 3) (<) ;._3  i. 5 5

convolve =: 4 : '(2 2 $ 1 1 , $ x) ([: +/^:_ x * ]) ;.(_3) y'"2

NB. "My Terrible Image Format"
mtif =: ":@$ , ' $ ' , ":@,
