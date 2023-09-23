require 'format/printf'

strjoin =: #@[ }. <@[ ;@,. ]

mydt =: 2.47436
mydx =: _30
myv0 =: 0
myv =: _24.2487
myvavg =: _12.1244
mya =: _9.8

NB. <equation string> ; <output> ; <param1> ; <param2> ; ...
NB. eqdata =: '(v0 * dt) + 1r2 * a * dt^2' ; 'dx' ; 'dt' ; 'v0' ; 'a'
NB. eqdata =: '(1r2 * a * dt) - dx % dt' ; 'v0' ; 'dt' ; 'dx' ; 'a'
NB. eqdata =: '1 pick p. (1r2 * a) , v0 , -dx' ; 'dt' ; 'dx' ; 'v0' ; 'a'
NB. eqdata =: '2 * (dx - v0 * dt) % dt^2' ; 'a' ; 'dt' ; 'dx' ; 'v0'
NB. 
NB. eqdata =: 'v0 + a * dt' ; 'v' ; 'dt' ; 'v0' ; 'a'
NB. eqdata =: 'v - a * dt' ; 'v0' ; 'dt' ; 'v' ; 'a'
NB. eqdata =: '(v - v0) % dt' ; 'a' ; 'dt' ; 'v0' ; 'v'
NB. eqdata =: '(v - v0) % a' ; 'dt' ; 'v0' ; 'v' ; 'a'
NB. 
NB. eqdata =: 'dx % dt' ; 'vavg' ; 'dt' ; 'dx'
NB. eqdata =: 'vavg * dt' ; 'dx' ; 'dt' ; 'vavg'
NB. eqdata =: 'dx % vavg' ; 'dt' ; 'dx' ; 'vavg'
NB. 
NB. eqdata =: '1r2 * v0 + v' ; 'vavg' ; 'v0' ; 'v'
NB. eqdata =: '(2 * vavg) - v' ; 'v0' ; 'v' ; 'vavg'
NB. eqdata =: '(2 * vavg) - v0' ; 'v' ; 'v0' ; 'vavg'
NB. 
NB. eqdata =: '(+,-) %: (v0^2) + 2 * a * dx' ; 'v' ; 'dx' ; 'v0' ; 'a'
NB. eqdata =: '(+,-) %: (v^2) - 2 * a * dx' ; 'v0' ; 'dx' ; 'v' ; 'a'
NB. eqdata =: '(v (-&*:) v0) % 2 * dx' ; 'a' ; 'dx' ; 'v0' ; 'v'
NB. eqdata =: '(v (-&*:) v0) % 2 * a' ; 'dx' ; 'v0' ; 'v' ; 'a'


famousfive =: ('(v0 * dt) + 1r2 * a * dt^2' ; 'dx' ; 'dt' ; 'v0' ; 'a') ; ('(1r2 * a * dt) - dx % dt' ; 'v0' ; 'dt' ; 'dx' ; 'a') ; ('1 pick p. (1r2 * a) , v0 , -dx' ; 'dt' ; 'dx' ; 'v0' ; 'a') ; ('2 * (dx - v0 * dt) % dt^2' ; 'a' ; 'dt' ; 'dx' ; 'v0') ; ('v0 + a * dt' ; 'v' ; 'dt' ; 'v0' ; 'a') ; ('v - a * dt' ; 'v0' ; 'dt' ; 'v' ; 'a') ; ('(v - v0) % dt' ; 'a' ; 'dt' ; 'v0' ; 'v') ; ('(v - v0) % a' ; 'dt' ; 'v0' ; 'v' ; 'a') ; ('dx % dt' ; 'vavg' ; 'dt' ; 'dx') ; ('vavg * dt' ; 'dx' ; 'dt' ; 'vavg') ; ('dx % vavg' ; 'dt' ; 'dx' ; 'vavg') ; ('1r2 * v0 + v' ; 'vavg' ; 'v0' ; 'v') ; ('(2 * vavg) - v' ; 'v0' ; 'v' ; 'vavg') ; ('(2 * vavg) - v0' ; 'v' ; 'v0' ; 'vavg') ; ('(+,-) %: (v0^2) + 2 * a * dx' ; 'v' ; 'dx' ; 'v0' ; 'a') ; ('(+,-) %: (v^2) - 2 * a * dx' ; 'v0' ; 'dx' ; 'v' ; 'a') ; ('(v (-&*:) v0) % 2 * dx' ; 'a' ; 'dx' ; 'v0' ; 'v') ; (< '(v (-&*:) v0) % 2 * a' ; 'dx' ; 'v0' ; 'v' ; 'a')

NB. ('dt' ; 'a' ; 'v0') ([ (#@] = [: +/ [ e. ]) 2 }. >@])"1 0 eqs
NB. hasallvars =: ([ (#@] = [: +/ e.) 2 }. >@])"1 0

NB. eqdata =: '' ; '' ; 'dt' ; 'dx' ; 'v0' ; 'v' ; 'vavg' ; 'a'

NB. the fact that individual chars are treated as scalars means that
NB. ('v0' ; 'a' ; 'dt') and (cutopen 'v0 a dt') are subtly different.
NB. (,each 'v0' ; 'a' ; 'dt') (([ (#@] = [: +/ e.) 2 }. >@])"1 0) ,each each famousfive
hasallvars =: (,each@[ (#@] = [: +/ e.) [:,each 2 }. >@])"1 0

invoke =: 1 : 0
  'func output' =. 2 {. m
  params =. 2 }. m

  joinedparams =. ' ' strjoin params

  invocation =. ('%s [ ''%s''=.y' sprintf func ; (' ' strjoin params))

  NB. (3 : invocation) y
  3 : invocation
)

NB. (0 pick famousfive #~ famousfive (hasallvars~) cutopen 'v0 v dt') invoke 3 1 2
