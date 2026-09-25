box =: ] # ] #"1 [: (i.) 2 # ]
rcb =: [: > box ,~each [: { [: ((<.@%~,"0|) [: i. 2 # ]) *:

NB. outer product of contention with self
(1 e. =)"1/~ rcb 2

NB. contention  map
cmap =: [: <"2 (1 e. =)"1/~

NB. example 4x4 puzzle
s44 =: 4 4 $ 0 0 0 0 0 0 2 1 3 0 0 4 0 0 0 0

cmap rcb %:@{.@$ s44
