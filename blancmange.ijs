triangle =: ([: <./ ] |@- <. , >.)"0

NB. TODO: Add ability to configure max number of terms in series. Default 20 seems close enough for government work.

blanc =: ([: +/ (2 ^ i. 20) (] %~ [: triangle *)~ ])"0


saw =: 3 : '2 * | y - <. y + 1r2'
([: +/ (i. 100) (4 : '(saw y*2^x) % (2^x)') ])"(0) 1000%~ i. 1000
