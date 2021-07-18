rawmap =: [: > [: ".&.> [ }. [: cutLF [: 1!:1 [: < ] NB. '#rows to drop' rawppm 'name of file'

lennarawrgb =: 3 rawmap 'lenna.ppm'
dims =: $ lennarawrgb
NB. channels =: |:@((3,~3%~#@,)($,)]) NB. rearrange to 3 vectors: r,g,b
channels =: <"1@|:@((3,~3%~#@,)($,)])
'lr lg lb' =: dims&$ each channels lennarawrgb

lennarawgs =: 3 rawmap 'lenna.pgm' NB. For simplicity we'll use the greyscale

NB. jpegmat_t =: (%: 8) , -: o. 
NB. jpegmat_q =: 8 8 $ 16 11 10 16 24 40 51 61 12 12 14 19 26 58 60 55 14 13 16 24 40 57 69 56 14 17 22 29 51 87 80 62 18 22 37 56 68 109 103 77 24 35 55 64 81 104 113 92 49 64 78 87 103 121 120 101 72 92 95 98 112 100 103 99

NB. J = log2(n)-1;
n =: {. $ lennarawgs NB. Assume a square for simplicity
nscales =: <: 2 ^. n

NB. Encode basic example from  https://www.cse.iitd.ac.in/~pkalra/csl783/haar.pdf
img =: 9 7 3 5
pairs =: ((2,~-:@#)$]) NB. divide into pairs
avg =: +/ % #
NB. pdc =: ] {.@|:@(-,) avg"1 NB. Pair Detail Coefficients
NB. Man that is hard to make into a tacit verb

padc =: 3 : 0 NB. pairwise average + detail coefficients
  vec =. > {. y

  if. 1 = # vec do.
    y return.
  end. NB. This hurts me to do

  ps =. pairs vec
  pa =. avg"1 ps
  dc =. ps ({.@|:@(-,)) pa

  pa ; dc ; }. y
)

pm =: +,- NB. Plus/Minus (+/-)

haar1dfwd =: [: > [: ,&.>/ [: }: [: padc^:_ [: ;/ 0 ,:~ ]

exampledata =: 1 6 2 12 6 3 2 8 5 4 10 4 10 5 15 1
exampledatatransformed =: haar1dfwd exampledata

echo exampledata
echo exampledatatransformed

chop =: 1 : 'x ({. u }.) y' NB. May or may not actually need this

NB. First and Second Half
fshfwd =: (2,-:@#)$]
fshinv =: , NB. This ain't gonna work unless the array is rank 1 btw
fsh =: fshfwd :. fshinv


