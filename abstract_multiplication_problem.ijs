perform =: ({. * 10 #:^:_1 ])@(10 #.^:_1 ]) NB. multiply a number by its own first digit
allsame =: [: (}. -: }:) 10 #.^:_1 ] NB. are all the digits of y the same?
alldiff =: [: (-: ~.) 10 #.^:_1 ]

echo ([: (alldiff"0 # ]) ] (allsame"0 # [) perform"0) 10000 + i. 90000
exit 1
