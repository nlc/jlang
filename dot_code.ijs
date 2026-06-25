Note 'dots'
  0 - 1
  |   |
  2 - 3
  |   |
  4 - 5
  |   |
  6 - 7

  0 a 1
  b   c
  2 d 3
  e   f
  4 g 5
  h   i
  6 j 7
)

NB. which of x does y contain all set bits in
cover =: [=AND

NB. preserved blocks of 4
2b11110000 2b00111100 2b00001111 ([:OR/cover"0/) i. 256
2b11110000 2b00111100 2b00001111 (]#~[:OR/cover"0/) i. 256
valblox =: 2b11110000 2b00111100 2b00001111 (]#~[:OR/cover"0/) i. 256 NB. valid "block"-bearing scaffolds

NB. connectors
conns =: #. +/"(1) 1 |: (10 2 $ 0 1 0 2 1 3 2 3 2 4 3 5 4 5 4 6 5 7 6 7) (=)"(0 1) i. 8

+/ 2^ +/"1 conns cover"(1 0) valblox NB. 3888
+/ 2^ +/"1 conns cover"(1 0) 1 + i. 256 NB. 5197
