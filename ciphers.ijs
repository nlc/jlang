NB. ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 -,.?
ALPH =: a. {~ (65 + i. 26) , (48 + i. 10) , 32 44 45 46 63
ALEN =: # ALPH

ord =: ALPH i. ]

pt =: 'WELL, WE ALREADY BOUGHT THE TICKETS. --ABRAHAM LINCOLN, 1865'



Note 'Caesar Cipher: modular addition to constant under ord'
     pt
  WELL, WE ALREADY BOUGHT THE TICKETS. --ABRAHAM LINCOLN, 1865
     ]ct =: 1 csr pt
  XFMM-,XF,BMSFBEZ,CPVHIU,UIF,UJDLFUT?,..BCSBIBN,MJODPMO-,2976
     13 14 15 csr pt
  9RYYJI9RINY4RNQ,IO17TU6I6URI6VPXR65LIKKNO4NUNZIYV0P1Y0JI?GED
  SZZKJ SJOZ5SOR-JP28UV7J7VSJ7WQYS76MJLLOP5OVO0JZW1Q2Z1KJAHFE
  ,T00LK,TKP06TPS.KQ39VW8K8WTK8XRZT87NKMMPQ6PWP1K0X2R302LKBIGF
     1 csr^:_1 ct
  WELL, WE ALREADY BOUGHT THE TICKETS. --ABRAHAM LINCOLN, 1865
)
NB. Pity about the ace syntax, not sure what that's about
csrfwd =: (ALEN|+)&.:(a:`ord)"0 1
csrinv =: -@[csrfwd]
csr =: csrfwd :. csrinv



Note '"Keyword" Cipher: mapping to a different permutation of the alphabet under ord'
     pt
  WELL, WE ALREADY BOUGHT THE TICKETS. --ABRAHAM LINCOLN, 1865
     'AC' kwd pt
  WELL, WE ALREADY COUGHT THE TIBKETS. --ACRAHAM LINBOLN, 1865
     ]ct =: 'KEYWORD10-9-8' kwd pt
  NO88 7NO7K8HOKWQ7ECLD1J7J1O7J0Y9OJI.7,,KEHK1KA780BYC8B 7U532
     'KEYWORD10-9-8' kwd^:_1 ct
)
kwdfwd =: ~.@,&ALPH@[ {~&.ord ]
kwdinv =: ~.@,&ALPH@[ i.&.ord ]
kwd =: kwdfwd :. kwdinv



Note 'Vigenere Cipher: modular addition under ord to running stream created by repeating key'
     pt
  WELL, WE ALREADY BOUGHT THE TICKETS. --ABRAHAM LINCOLN, 1865
     ]ct =: 'KEY' vig pt
  6I9VAT6ITKPAOE18?ZYY4RXT3L2FX6MO23WWFBVKFAKLYW?9SR0YP,G?KD O
     'KEY' vig^:_1 ct
  WELL, WE ALREADY BOUGHT THE TICKETS. --ABRAHAM LINCOLN, 1865
)
vigfwd =: ((#@]$[)(ALEN|+)&.ord])"1
viginv =: ((#@]$[)(ALEN|-~)&.ord])"1
vig =: vigfwd :. viginv



Note 'Autokey Cipher: modular addition under ord to running stream created by prepending key to ciphertext itself'
  WIP--Decryption seems a bit trickier than Vigenere
)
atkfwd =: ((#@]$,)(ALEN|+)&.ord])"1



Note 'Hill Cipher: affine transformation of N-grams by the NxN invertible key matrix'
  WIP--Must figure out how to do a modular matrix inverse :(
)
NB. some intermediate tools (https://code.jsoftware.com/wiki/Essays/Euclidean_Algorithm):
g0  =: , ,. =@i.@2:  
it  =: {: ,: {. - {: * <.@%&{./
gcd =: (}.@{.) @ (it^:(*@{.@{:)^:_) @ g0 NB. calculates GCD as linear coefficients


