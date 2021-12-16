NB. https://en.wikipedia.org/wiki/GNU_Unifont
unifont_bmp =: ([: #: [: ". '0X' ,"(1) 16 2 $ ('.*:' ; '') rxrplc ])"1

NB. TODO: handle sizes larger than 32 chars
NB. (((2 ,~ 2 %~ [: # ])$]) ,)
