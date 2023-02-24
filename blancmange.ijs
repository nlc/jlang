triangle =: ([: <./ ] |@- <. , >.)"0

NB. TODO: Add ability to configure max number of terms in series. Default 20 seems close enough for government work.

blanc =: ([: +/ (2 ^ i. 20) (] %~ [: triangle *)~ ])"0
