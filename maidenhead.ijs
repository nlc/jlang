require 'format/printf'

Note 'Maidenhead coordinates'
  Convert maidenhead square notation to longitude & latitude
  (currently of SW corner of square)

  TODO:
    * add flexibility to deal with arbitrary(?) precision
      - at least 6- and 8-char formats
    * either return *middle* of square or the bounds
    * add a way to do it in reverse
)

snip =: 1 : '(min&{. x) u min&{. y [ min =. x <.&# y'
addhalf =: + 0.5 ,~ 0 #~ <:@#

offsets =: 65 48 97 48 97 48
ranges =: 18 10 24 10 24 10
normal =: [: */ ranges {.~ -:@#

NB. mhvalues =: [: ((offsets {.~ #) -~ ]) a. i. ((2 , ~ -:@#) $ ])
mhvalues =: offsets -snip~ a. i. ((2 , ~ -:@#) $ ])
mhfractions =: normal %~ ranges #.snip"1 |:@addhalf@mhvalues@]
mhlonglatne =: 360 180 * 1 | 0.5 + mhfractions@]
mhlatlongne =: |.@mhlonglatne
netonw =: ({. , 180 - 180 | {:)
mhlonglatnw =: netonw@mhlonglatne
mhlatlongnw =: netonw@mhlatlongne
mhlatlongpretty =: '%d°%d''%0.2f"N %d°%d''%0.2f"W' printf ,@todms@netonw@mhlatlongne

NB. echo mhvalues 'BL11bh16'
NB. echo mhfractions 'BL11bh16'
NB. echo mhlonglat 'BL11bh16'


NB. 42.3601 ==> 42° 21' 36.36"
convbasefwd =: _&,@[ #: ] * */@[
convbaseinv =: */@[%~ _&,@[ #. ]
convbase =: convbasefwd :. convbaseinv
todms =: 60 60&convbase
todec =: 60 60&convbase^:(_1)

Note 'example'
  41.831817 _88.251838
  'EN51ut'
)
