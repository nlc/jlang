require 'format/printf'

export =: 4 : 0
  colordata =. x
  ofname =. y

  'w h' =. 2&^@(>.,<.)@-:@#@q: # colordata

  fileheader =. 'P3\n%d %d\n256\n' sprintf w ; h

  (fileheader , (LF joinstring ;/ ":"(1) colordata)) fwrite ofname
  NB. ":"(1) 5 {. colordata
)

process =: 3 : 0
  ifname =. y
  data =. (1!:1) < ifname
  lsd =. a. i. 10 { data NB. Logical Screen Descriptor

  if. lsd AND #: 1 0 0 0 0 0 0 0 do.
    ctn =. _3&{.&.#: lsd NB. Color Table Number
    ncolors =. 2&^@>: ctn
    nbytes =. ncolors * 3

    'LSD=%d ->\n  Color Table No.: %d\n  Num. Colors: %d\n  Color Table Size: %d bytes\n' printf lsd ; ctn ; ncolors ; nbytes

    colordata =. (ncolors , 3) $ #. 2 2 2 2 2 2 2 2 #: (13 + i. nbytes) { a. i. data
    NB. '#%02X%02X%02X' printf colordata
    echo colordata

    colordata export 'temp_colortable.ppm'

    NB. dizzle
    NB. diz =. (a. {~ , sort&.:-"1 colordata) (11 + i. nbytes) } data
    NB. diz 1!:2 < 'dizzled.gif'
  else.
    echo 'No global color table!'
  end.
)

ifname =: 2 pick ARGV
process ifname

exit 0
