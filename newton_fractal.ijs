require 'viewmat'

NB. Find roots of polynomial with coefficients x, from starting point y
NB. invocation: <polynomial coefs> polynewton <starting point>
polynewton =: ] - p. % ] p.~ [: p.. [

g =: 100
playingfield =: (g%2) %~ 1e_9 + j."0/~ i: g

polycoefs =: _1 0 0 1 0 0 1

NB. viewmat |: {:@*."0 polycoefs (polynewton^:100"1 0) playingfield NB. categorize by angle
viewmat |: (i.~~.@,) polycoefs (polynewton^:100"1 0) playingfield NB. just tally all the unique values

NB. exit 0
