require 'stats'
require 'format/printf'

NB. 'output301_2.txt' fwrite~ ": 999999 ,~"1 (+/&.:*:)"1 (-"1)/~ }."1 > > ((".each)@cut) each }. cutLF fread 'ssp301.txt'


NB. n =: 5233 NB. 1.002 +/- 0.369 ; [0.100, 1.900]
NB. n =: 425 NB. 1.002 +/- 0.362 ; [0.224, 1.776]
n =: 301 NB. 0.996 +/- 0.359 ; [0.251, 1.749]

pts =: }. "1 > > ((".each)@cut) each }. cutLF fread 'ssp%d.txt' sprintf n

dtbl =: (+/&.:*:)"1 (-"1)/~ pts

ds =: (*#]) , dtbl

'N = %d' printf n
'%0.3f +/- %0.3f' printf (mean , stddev) ({~ 2 * i.@-:@#) sort ds
'[%0.3f, %0.3f]' printf (<./ , >./) ds

Note 'plot'
  require 'plot'
  hist =: <:@(#/.~)@(i.@#@[ , I.)
  plot (0.01 * i. 201) hist ({~ 2 * i.@-:@#) sort ds
)

exit 0
