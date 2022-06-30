NB. Slow Fourier Transform
sftfwd =: (+/ . *)~ ((0j_2p1&*@*)/~ ^@% #)@i.@#
sftinv =: isft =: [: |. 1 |. # %~ ] (+/ . *)~ ((0j_2p1&*@*)/~ ^@% #)@i.@#
NB. Not *exactly* sure why the isft comes through permuted
NB. the way it is, but it's an easy fix

sft =: sftfwd :. sftinv
