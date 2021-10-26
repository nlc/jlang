Note 'Maidenhead coordinates'
  Convert maidenhead square notation to longitude & latitude
  (currently of SW corner of square)

  TODO:
    * add flexibility to deal with arbitrary(?) precision
      - at least 6- and 8-char formats
    * either return *middle* of square or the bounds
    * add a way to do it in reverse
)

offsets =: 65 48 97 48
ranges =: 18 10 24 10
normal =: */ ranges

NB. mhvalues =: [: ((offsets {.~ #) -~ ]) a. i. ((2 , ~ -:@#) $ ])
mhvalues =: offsets -~ a. i. ((2 , ~ -:@#) $ ])
mhfractions =: normal %~ ranges #. |:@mhvalues@]
mhlonglat =: 360 180 * 1 | 0.5 + mhfractions@] NB. E N

NB. echo mhvalues 'BL11bh16'
NB. echo mhfractions 'BL11bh16'
NB. echo mhlonglat 'BL11bh16'
