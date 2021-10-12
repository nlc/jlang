borderfwd =: 3 : 0
  'h w' =: $ y
  _1 _1 |. (2 # h + 2) {. y
)
borderinv =: 3 : '_1 _1 }. 1 1 }. y'
border =: borderfwd :. borderinv

luma =: ([: +/ 0.2126 0.7152 0.0722&*)"1

closest =: 127&< NB. get closest color in palette (in this case 0 or 1)

dto =: 3 3 $ 0 0 0 0 0 7r16 3r16 5r16 1r16 NB. fwd. diffusions (who gets my error)
dfrom =: |."1 |. dto NB. rev. diffusions (who gives me error)

path =: '~/Downloads/keats.ppm'
linedata =: 255 %~ > ". each 3 }. cutLF fread path
'height width' =: 1 3 %~ $ linedata

subpixdata =: (height , width , 3) ($,) linedata
lumadata =: luma subpixdata

NB. Is this right-ish?
3 3(([:+/^:_ dfrom*]);._3) border (-~closest) lumadata
