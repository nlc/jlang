msg =: 'The quick, brown fox jumps over the (lazy) dog.'

NB. decompose into array of triplets of ascii values
triplets =: (3 3 ,: 1 3) ( ] ;.3) 1 47 $ a. I. msg
