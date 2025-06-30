require 'format/printf'

moore =: 8 2 $ _1 _1 _1 0 _1 1 0 _1 0 1 1 _1 1 0 1 1
convolve =: [: +/ |.
isvalid =: e.&1 2

iter =: [: (- >&1) ] + 3 * [: isvalid =&1 * moore convolve =&3
mkhdr =: 3 : '''P2'' , LF , (": |. $ y) , LF , ''3'' , LF'


strjoin =: #@[ }. <@[ ;@,. ]
xordemo =: 3 : 0
  grid =. > ". each cutLF fread '_wireworld_pattern_1.txt'
  hdr =. mkhdr grid
  (i.@# (>@] fwrite 'ww_frame_%04d.pgm' sprintf <@[)"0 ]) (LF ,~ (' *\n';(LF)) rxrplc LF strjoin [: ;/ hdr , ":) each  ;/ iter^:(i. 36) grid
  NB. convert ww_frame_00{18..35}.pgm ww.gif
)

primesdemo =: 3 : 0
  grid =. > (' #~@' i. ]) each }. cutLF fread 'primes.wi'
  hdr =. mkhdr grid
  fnamefmt =. 'ww_frame_%%0%dd.pgm' sprintf < >. 10 ^. y

  for_i. i. y do.
    echo i
    (fnamefmt sprintf < i) fwrite~ hdr , LF ,~ LF strjoin ": each { grid
    grid =. iter grid
  end.

  grid
)

NB. x by x  grid of 1s with a 3 in the middle
mkdot =: 1 + 2 * <.@-:@*: = [:i. 2#]
NB. viewmat iter^:(99) (mkdot 199) * 0.25 > ? 199 199 $ 0

mkdotrand =: 4 : '((x > [: ? 0 $~ 2 # ]) (OR + 2*]) <.@-:@*:=[:i. 2#]) y'

NB. ([:+/,)"(2) 3 = iter^:(49)"2 (10 10$0.1*1+i. 10) mkdotrand"(0) 99
NB. plot (>./-<./)([:+/,)"(2) 3 = iter^:(49)"2(30 10$0.1*1+i. 10) mkdotrand"(0) 99
NB. plot +/ %/ ([:+/,)"(2) (3&=,:*) iter^:(49)"2(20 10$0.1*1+i. 10) mkdotrand"(0) 99
